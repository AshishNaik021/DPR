//
//  LoginPage.h
//  Medico
//
//  Created by Apple on 02/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoctorLandingPageView.h"
#import "PatientLandingPageViewController.h"
//#import "AssistantLandingPageView.h"

@interface LoginPage : UIViewController{
    UIActivityIndicatorView *spinner;
    NSString *returnString;
}
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *forgotButton;
@property (weak, nonatomic) IBOutlet UIButton *regDoctor;
@property (weak, nonatomic) IBOutlet UIButton *regPatient;
@property (weak, nonatomic) IBOutlet UIButton *knowMore;
@property (weak, nonatomic) IBOutlet UIButton *regAssistant;
@property (nonatomic,retain) NSString *returnString;

- (IBAction)validate:(id)sender;

- (void)loginRequest;

-(void)parseJSON:(NSString *)responseData;

@end
