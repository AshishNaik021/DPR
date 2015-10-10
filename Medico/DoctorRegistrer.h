//
//  DoctorRegistrer.h
//  Medico
//
//  Created by APPLE on 05/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
BOOL doctorchecked;

@interface DoctorRegistrer : UIViewController
@property IBOutlet UIButton *checkButton;
-(IBAction)checkButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *cloudLogInField;
@property (weak, nonatomic) IBOutlet UITextField *cloudPasswordField;
@property (weak, nonatomic) IBOutlet UITextField *cloudTypeField;
@property (weak, nonatomic) IBOutlet UIButton *changeImageButton;
- (IBAction)changeImage:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *mobileField;
@property (weak, nonatomic) IBOutlet UITextField *genderField;
@property (weak, nonatomic) IBOutlet UITextField *dateofBirthField;
@property (weak, nonatomic) IBOutlet UIButton *calendarButton;
- (IBAction)addCalendar:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *locationField;
@property (weak, nonatomic) IBOutlet UITextField *practiceNameField;
@property (weak, nonatomic) IBOutlet UITextField *specializationField;
@property (weak, nonatomic) IBOutlet UITextField *registrationField;
@property (weak, nonatomic) IBOutlet UIButton *readTCButton;
- (IBAction)readTermsConditions:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
- (IBAction)next:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *locationButton;

- (IBAction)addLocation:(id)sender;






@end
