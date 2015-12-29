//
//  CreateDoctorsClinicSettingsViewController.h
//  Medico
//
//  Created by APPLE on 15/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface CreateDoctorsClinicSettingsViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *createClinicNameField;
@property (weak, nonatomic) IBOutlet UITextField *createEmailField;
@property (weak, nonatomic) IBOutlet UITextField *createMobileField;
@property (weak, nonatomic) IBOutlet UITextField *createLandLineField;
@property (weak, nonatomic) IBOutlet UITextField *createSpecialtyTextView;
@property (weak, nonatomic) IBOutlet UIButton *addSlotsButton;
- (IBAction)addSlots:(id)sender;
@property IBOutlet NSArray *returnArr;
@property BOOL *clinicFlag;
@property BOOL *slotFlag;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@property (weak, nonatomic) IBOutlet UITextField *createLocationTextView;
@property (weak, nonatomic) IBOutlet UIButton *createClinicButton;
- (IBAction)createClinic:(id)sender;
@property NSString *returnStringClinic;
@property NSString *returnStringSlot;
@property NSDictionary *dict;
@property (weak, nonatomic) IBOutlet UITextView *createSlotTextView;
@property (weak, nonatomic) IBOutlet UIButton *alwaysButton;
@property (weak, nonatomic) IBOutlet UIButton *exceptCurrentSlotButton;
@property (weak, nonatomic) IBOutlet UIButton *exceptCurrentDayButton;
@property (weak, nonatomic) IBOutlet UIButton *confirmByDoctorButton;
@property BOOL *alwaysRadioButton;
@property BOOL *exceptSlotRadioButton;
@property BOOL *exceptDayRadioButton;
@property BOOL *confirmDoctorRadioButton;
@property IBOutlet NSString *appointment;
@property(weak) MBProgressHUD *hud;

- (IBAction)always:(id)sender;
- (IBAction)exceptCurrentSlot:(id)sender;
- (IBAction)exceptCurrentDay:(id)sender;
- (IBAction)confirmByDoctor:(id)sender;
@property IBOutlet NSDictionary *passDictionaryForSlots;
@property IBOutlet NSString *passString;
@property NSString *emailid;



@property  BOOL *keyboardVisible;
@property CGPoint offset;
@property CGFloat width;
@property CGFloat height;
@property CGFloat scrollHeight;
@property CGRect screen;

@end
