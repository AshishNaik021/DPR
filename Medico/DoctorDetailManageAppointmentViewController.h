//
//  DoctorDetailManageAppointmentViewController.h
//  Medico
//
//  Created by APPLE on 21/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorDetailManageAppointmentViewController : UIViewController<UITextFieldDelegate>
    @property IBOutlet NSString *clinicName;

@property IBOutlet NSMutableArray *passDataArr;

@property IBOutlet NSDictionary *passDataDict;
@property IBOutlet NSArray *clinicJson;

@property IBOutlet NSArray *detailAppArr;
@property IBOutlet NSArray *detailSlot1;

@property IBOutlet NSArray *detailSlot2;
@property (weak, nonatomic) IBOutlet UIButton *hideDetailsButton;
- (IBAction)hideDetails:(id)sender;

@property IBOutlet NSArray *detailSlot3;
@property (weak, nonatomic) IBOutlet UILabel *clinicNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot1AppLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot2AppLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot3AppLabel;
@property (weak, nonatomic) IBOutlet UIButton *slot1totalAppButton;
@property (weak, nonatomic) IBOutlet UIButton *slot2TotalAppButton;
@property (weak, nonatomic) IBOutlet UIButton *slot3TotalAppButton;
@property (weak, nonatomic) IBOutlet UITextView *addressTextView;
@property (weak, nonatomic) IBOutlet UITextField *profileMobileField;
@property (weak, nonatomic) IBOutlet UITextField *mobile;
@property (weak, nonatomic) IBOutlet UIButton *totalAppointmentButton;
- (IBAction)totalAppointment:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *profileTabButton;
- (IBAction)profileTab:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *appointmentTabButton;
- (IBAction)appointmentTab:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *profileContentView;
@property (weak, nonatomic) IBOutlet UIView *appointmentContentView;
@property (weak, nonatomic) IBOutlet UITextField *profileAssistantField;
@property (weak, nonatomic) IBOutlet UITextField *profileEmailField;
@property (weak, nonatomic) IBOutlet UITextField *profileLandlineField;
@property (weak, nonatomic) IBOutlet UITextField *profileLocationField;
@property (weak, nonatomic) IBOutlet UITextField *profilePracticeNameField;
@property (weak, nonatomic) IBOutlet UITextView *profileServicesTextView;
@property (weak, nonatomic) IBOutlet UILabel *slot1DaysLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot1TimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *slot1AppButton;
- (IBAction)slot1TotalApp:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *slot2DaysLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot2TimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *slot2AppButton;
- (IBAction)slot2TotalApp:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *slot3DaysLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot3TimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *slot3AppButton;
- (IBAction)slot3TotalApp:(id)sender;




@end

