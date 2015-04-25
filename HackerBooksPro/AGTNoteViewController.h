//
//  AGTNoteViewController.h
//  Everpobre
//
//  Created by Fernando Rodríguez Romero on 09/04/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

@import UIKit;

@class ADMCoreAnnotation;

@interface AGTNoteViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *creationDateView;
@property (weak, nonatomic) IBOutlet UILabel *modificationDateView;
@property (weak, nonatomic) IBOutlet UITextField *nameView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIToolbar *bottomBar;


@property (nonatomic, strong) ADMCoreAnnotation *model;

-(id) initWithModel:(ADMCoreAnnotation *) model;



- (IBAction)displayPhoto:(id)sender;
-(IBAction)hideKeyboard:(id)sender;

@end
