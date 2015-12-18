//
//  DoctorRegistrer.h
//  Medico
//
//  Created by APPLE on 05/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorRegistrer : UIViewController <UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate> {
    IBOutlet UIScrollView *scroll;
    // BOOL clearField;
}

@property (retain, nonatomic)  UIPickerView *picker;
@property (retain, nonatomic)  UIPickerView *pickerSpeciality;

@property (nonatomic,retain) NSArray *pickerBloodGroupArr;
@property (nonatomic,retain) NSArray *pickerSpecialityArr;


@property  BOOL *keyboardVisible;
@property CGPoint offset;
@property CGFloat width;
@property CGFloat height;
@property CGFloat scrollHeight;
@property CGRect screen;

@property (weak, nonatomic) IBOutlet UIButton *checkButton;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UIButton *changeImageButton;
@property (weak, nonatomic) IBOutlet UITextField *bloodGroupField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *mobileField;
@property (weak, nonatomic) IBOutlet UITextField *genderField;
@property (weak, nonatomic) IBOutlet UITextField *dateofBirthField;
@property (weak, nonatomic) IBOutlet UIButton *calendarButton;
@property (weak, nonatomic) IBOutlet UITextField *locationField;
@property (weak, nonatomic) IBOutlet UITextField *specializationField;
@property (weak, nonatomic) IBOutlet UIButton *readTCButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property BOOL *doctorCheck;
-(IBAction)checkButton:(id)sender;
- (IBAction)changeImage:(id)sender;
- (IBAction)addCalendar:(id)sender;
- (IBAction)readTermsConditions:(id)sender;
- (IBAction)next:(id)sender;
- (IBAction)addLocation:(id)sender;

@end

