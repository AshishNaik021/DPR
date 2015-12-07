//
//  DoctorChangePasswordViewController.h
//  Medico
//
//  Created by APPLE on 13/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
BOOL doctor;

@interface DoctorChangePasswordViewController : UIViewController{


}
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@property (weak, nonatomic) IBOutlet UIImageView *doctorImage;
@property (weak, nonatomic) IBOutlet UIButton *changeImageButton;
- (IBAction)changeImage:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *mobileField;
@property (weak, nonatomic) IBOutlet UITextField *bloodGroupField;
@property (weak, nonatomic) IBOutlet UITextField *genderField;
@property (weak, nonatomic) IBOutlet UITextField *dateoBirthField;
@property (weak, nonatomic) IBOutlet UIButton *calendarButton;
- (IBAction)addCalendar:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *locationField;
@property (weak, nonatomic) IBOutlet UITextField *specializationField;
@property (weak, nonatomic) IBOutlet UIButton *checkButton;
- (IBAction)check:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *readTCButton;

- (IBAction)readTermsConditions:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *changePasswordButton;
- (IBAction)changePassword:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
- (IBAction)save:(id)sender;


@property  BOOL *keyboardVisible;
@property CGPoint offset;
@property CGFloat width;
@property CGFloat height;
@property CGFloat scrollHeight;
@property CGRect screen;

@end
