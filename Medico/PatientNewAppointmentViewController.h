//
//  PatientNewAppointmentViewController.h
//  Medico
//
//  Created by Apple on 09/12/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientNewAppointmentViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *doctorConsultationCheckButton;
- (IBAction)doctorConsultationCheck:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *doctorConsultationNameField;
@property (weak, nonatomic) IBOutlet UIButton *bookAppointmentButton;
- (IBAction)bookAppointment:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *diagnosticTestReminderButton;
- (IBAction)diagnosticTestReminder:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *dateField;
@property (weak, nonatomic) IBOutlet UIButton *calenderButton;
- (IBAction)calender:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *referredByField;
@property (weak, nonatomic) IBOutlet UITextField *clinicNameField;
@property (weak, nonatomic) IBOutlet UITextField *typeField;
@property (weak, nonatomic) IBOutlet UIButton *setAlarmButton;
- (IBAction)setAlarm:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;


@property  BOOL *keyboardVisible;
@property CGPoint offset;
@property CGFloat width;
@property CGFloat height;
@property CGFloat scrollHeight;
@property CGRect screen;

@end
