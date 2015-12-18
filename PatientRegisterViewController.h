//
//  PatientRegisterViewController.h
//  Medico
//
//  Created by Apple on 01/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientRegisterViewController : UIViewController<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource> {
    
    IBOutlet UIScrollView *scroll;
    
}

@property (retain, nonatomic)  UIPickerView *picker;
@property (nonatomic,retain) NSArray *pickerBloodGroupArr;



@property  BOOL *keyboardVisible;
@property CGPoint offset;
@property CGFloat width;
@property CGFloat height;
@property CGFloat scrollHeight;
@property CGRect screen;
@property BOOL *patientChecked;
@property (weak, nonatomic) IBOutlet UIButton *changeImageButton;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *cloudLoginField;
@property (weak, nonatomic) IBOutlet UITextField *cloudPasswordField;
@property (weak, nonatomic) IBOutlet UITextField *cloudTypeField;
@property (weak, nonatomic) IBOutlet UITextField *mobileField;
@property (weak, nonatomic) IBOutlet UITextField *genderField;
@property (weak, nonatomic) IBOutlet UITextField *dateofBirthField;
@property (weak, nonatomic) IBOutlet UITextField *locationField;
@property (weak, nonatomic) IBOutlet UITextField *bloodGroupField;
@property (weak, nonatomic) IBOutlet UITextField *allergicToField;
@property (weak, nonatomic) IBOutlet UIButton *readTCButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *locationButton;
@property (weak, nonatomic) IBOutlet UIButton *calendarButton;
@property IBOutlet UIButton *checkButton;

-(IBAction)checkButton:(id)sender;
- (IBAction)changeImage:(id)sender;
- (IBAction)readTermConditions:(id)sender;
- (IBAction)next:(id)sender;
- (IBAction)addCalendar:(id)sender;
- (IBAction)addLocation:(id)sender;


@end
