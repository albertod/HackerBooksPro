//
//  AGTPhotoViewController.m
//  Everpobre
//
//  Created by Fernando Rodríguez Romero on 10/04/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "AGTPhotoViewController.h"
#import "ADMCorePhoto.h"
@import CoreImage;


@interface AGTPhotoViewController ()

@end

@implementation AGTPhotoViewController

#pragma mark - Init
-(id) initWithModel:(ADMCorePhoto *)model{
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = model;
    }
    
    return self;
}

#pragma mark - View Life cycle
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Me aseguro que la vista no ocupa toda la
    // pantalla, sino lo que queda disponible
    // dentro del navigation
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    // sincronizo modelo -> vista
    self.photoView.image = self.model.photo;
    
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    

    
    
    // Sincronizo vista -> modelo
    self.model.photo = self.photoView.image;
}



#pragma mark - Actions
- (IBAction)takePicture:(id)sender {
    
    // Creamos un UIImagePickerController
    UIImagePickerController *picker = [UIImagePickerController new];
    
    // Lo configuro
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        // Uso la cámara
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
    }else{
        // Tiro del carrete
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    picker.delegate = self;
    
    picker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    // Lo muestro de forma modal
    [self presentViewController:picker
                       animated:YES
                     completion:^{
                         // Esto se va a ejecutar cuando termine la
                         // animación que muestra al picker.
                     }];
    
    
    
}

- (IBAction)deletePhoto:(id)sender {
    
    // la eliminamos del modelo
    self.model.photo = nil;
    
    // sincronizo modelo -> vista
    CGRect oldRect = self.photoView.bounds;
    [UIView animateWithDuration:0.7
                     animations:^{
                         
                         self.photoView.alpha = 0;
                         self.photoView.bounds = CGRectZero;
                         self.photoView.transform = CGAffineTransformMakeRotation(M_PI_2);
                         
                     } completion:^(BOOL finished) {
                         
                         self.photoView.alpha = 1;
                         self.photoView.bounds = oldRect;
                         self.photoView.transform = CGAffineTransformIdentity;
                         self.photoView.image = nil;
                     }];

}


#pragma mark - UIImagePickerControllerDelegate
-(void) imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    // ¡OJO! Pico de memoria asegurado, especialmente en
    // dispositivos antiguos
    
    
    // Sacamos la UIImage del diccionario
    UIImage *img = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    // La guardo en el modelo
    self.model.photo = img;
    
    // Quito de encima el controlador que estamos presentando
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 // Se ejecutará cuando se haya ocultado del todo
                             }];
}

@end
