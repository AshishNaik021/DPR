//
//  LoginPage.h
//  Medico
//
//  Created by Apple on 02/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LoginPage : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *forgotButton;
@property (weak, nonatomic) IBOutlet UIButton *regDoctor;
@property (weak, nonatomic) IBOutlet UIButton *regPatient;
@property (weak, nonatomic) IBOutlet UIButton *knowMore;

@property (weak, nonatomic) IBOutlet UIButton *regAssistant;
- (IBAction)validate:(id)sender;

- (IBAction)forgotPassword:(id)sender;

- (IBAction)doctorRegistration:(id)sender;

- (IBAction)patientRegistration:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *assistantRegistration;

- (IBAction)knowMore:(id)sender;


@end
