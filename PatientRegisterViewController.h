//
//  PatientRegisterViewController.h
//  Medico
//
//  Created by Apple on 01/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
BOOL checked;
@interface PatientRegisterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *changeImageButton;
- (IBAction)changeImage:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (weak, nonatomic) IBOutlet UITextField *mobileField;
@property (weak, nonatomic) IBOutlet UITextField *genderField;
@property (weak, nonatomic) IBOutlet UITextField *dateodBirthField;
@property (weak, nonatomic) IBOutlet UITextField *locationField;
@property (weak, nonatomic) IBOutlet UITextField *bloodGroupField;
@property (weak, nonatomic) IBOutlet UITextField *allergicToField;
@property (weak, nonatomic) IBOutlet UIButton *readTCButton;
- (IBAction)readTermConditions:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
- (IBAction)next:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *locationButton;
- (IBAction)addLocation:(id)sender;

@property IBOutlet UIButton *checkButton;
-(IBAction)checkButton:(id)sender;

@end