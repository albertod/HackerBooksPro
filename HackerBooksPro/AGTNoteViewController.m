//
//  AGTNoteViewController.m
//  Everpobre
//
//  Created by Fernando Rodríguez Romero on 09/04/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "AGTNoteViewController.h"
#import "ADMCoreAnnotation.h"
#import "AGTPhotoViewController.h"

@interface AGTNoteViewController ()

@end

@implementation AGTNoteViewController

#pragma mark - Init
-(id) initWithModel:(ADMCoreAnnotation *) model{
    
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = model;
    }
    
    return self;
}


-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Asignamos delegados
    self.nameView.delegate = self;
    
    // Alta en notificaciones de teclado
    [self setupKeyboardNotifications];
    
    
    // Sincornizar modelo -> Vista
    
    // Fechas
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterShortStyle;
    
    self.creationDateView.text = [fmt stringFromDate:self.model.creationDate];
    self.modificationDateView.text = [fmt stringFromDate:self.model.modificationDate];
    
    // Nombre
    self.nameView.text = self.model.name;
    
    
    // Texto
    self.textView.text = self.model.text;
    
}


-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    // Baja en notificaciones
    [self tearDownKeyboardNotifications];
    
    // Sincronizo vistas -> Modelo
    
    self.model.name = self.nameView.text;
    self.model.text = self.textView.text;
}

#pragma mark - Actions
- (IBAction)displayPhoto:(id)sender {
    
    //Crear un controlador de fotos
    AGTPhotoViewController *pVC = [[AGTPhotoViewController alloc]
                                   initWithModel:self.model.photo];
    
    // Push que te crió
    [self.navigationController pushViewController:pVC
                                         animated:YES];
    
}

-(IBAction)hideKeyboard:(id)sender{
    
    [self.view endEditing:YES];
}

#pragma mark - UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    // Buen momento para validar el texto
    
    [textField resignFirstResponder];
    
    return YES;
}

-(void) textFieldDidEndEditing:(UITextField *)textField{
    
    // Buen momento para guardar el texto
}


-(void) setupKeyboardNotifications{
    
    // Alta en notificaciones
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self
           selector:@selector(notifyThatKeyboardWillAppear:)
               name:UIKeyboardWillShowNotification
             object:nil];
    
    [nc addObserver:self
           selector:@selector(notifyThatKeyboardWillDisappear:)
               name:UIKeyboardWillHideNotification
             object:nil];
    
}


-(void) tearDownKeyboardNotifications{
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc removeObserver:self];
    
}

// UIKeyboardWillShowNotification
-(void) notifyThatKeyboardWillAppear:(NSNotification *)n{
    
    // Sacar la duración de la animación del teclado
    double duration = [[n.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // Sacar el tamaño (bounds) del teclado del objeto
    // userInfo que viene en la notificación
    NSValue *wrappedFrame = [n.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect kbdFrame = [wrappedFrame CGRectValue];
    
    
    // Calcular los nuevos bounds de self.textView
    // Hacerlo con una animación que coincida con la
    // del teclado
    CGRect currentFrame = self.textView.frame;
    
    CGRect newRect = CGRectMake(currentFrame.origin.x,
                                currentFrame.origin.y,
                                currentFrame.size.width,
                                currentFrame.size.height -
                                kbdFrame.size.height +
                                self.bottomBar.frame.size.height);
   
    [UIView animateWithDuration:duration
                     animations:^{
                         self.textView.frame = newRect;
                     }];
    
    
    
}

// UIKeyboardWillHideNotification
-(void)notifyThatKeyboardWillDisappear:(NSNotification *) n{
    
    // Sacar la duración de la animación del teclado
    double duration = [[n.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // Devolver a self.textView su bounds original
    // mediante una animación que coincide con la
    // del teclado.
    [UIView animateWithDuration:duration
                     animations:^{
                         self.textView.frame = CGRectMake(8,
                                                          150,
                                                          304,
                                                          359);

                     }];
    }


@end
