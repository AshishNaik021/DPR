//
//  DoctorDetailManageAppointmentViewController.h
//  Medico
//
//  Created by APPLE on 21/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorDetailManageAppointmentViewController : UIViewController
@property IBOutlet NSArray *detailAppArr;
@property IBOutlet NSArray *detailSlot1;

@property IBOutlet NSArray *detailSlot2;

@property IBOutlet NSArray *detailSlot3;
@property (weak, nonatomic) IBOutlet UILabel *clinicNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot1AppLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot2AppLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot3AppLabel;
@property (weak, nonatomic) IBOutlet UIButton *slot1totalAppButton;
@property (weak, nonatomic) IBOutlet UIButton *slot2TotalAppButton;
@property (weak, nonatomic) IBOutlet UIButton *slot3TotalAppButton;

@property (weak, nonatomic) IBOutlet UIButton *profileTabButton;
- (IBAction)profileTab:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *appointmentTabButton;
- (IBAction)appointmentTab:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *profileContentView;
@property (weak, nonatomic) IBOutlet UIView *appointmentContentView;
@property (weak, nonatomic) IBOutlet UITextField *profileAssistantField;
@property (weak, nonatomic) IBOutlet UITextField *profileEmailField;
@property (weak, nonatomic) IBOutlet UITextField *profileMobileField;
@property (weak, nonatomic) IBOutlet UITextField *profileLandlineField;
@property (weak, nonatomic) IBOutlet UITextField *profileLocationField;
@property (weak, nonatomic) IBOutlet UITextField *profilePracticeNameField;
@property (weak, nonatomic) IBOutlet UITextView *profileServicesTextView;



@end

