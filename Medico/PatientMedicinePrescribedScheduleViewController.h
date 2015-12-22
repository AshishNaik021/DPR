//
//  PatientMedicinePrescribedScheduleViewController.h
//  Medico
//
//  Created by Apple on 25/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientMedicinePrescribedScheduleViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *medicineNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *scheduleField;
@property (weak, nonatomic) IBOutlet UITextField *numberOfDosesField;
@property (weak, nonatomic) IBOutlet UITextField *totalMedicationDurationField;
@property (weak, nonatomic) IBOutlet UITextField *startDateField;
@property (weak, nonatomic) IBOutlet UITextField *endDateField;
@property (weak, nonatomic) IBOutlet UITextField *scheduleTimeTextView;
@property (weak, nonatomic) IBOutlet UIButton *medicineReminderButton;
@property (weak, nonatomic) IBOutlet UITextField *doctorsInstructionTextView;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *startDateButton;
@property (weak, nonatomic) IBOutlet UIButton *endDateButton;
@property BOOL *check;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@property  BOOL *keyboardVisible;
@property CGPoint offset;
@property CGFloat width;
@property CGFloat height;
@property CGFloat scrollHeight;
@property CGRect screen;

- (IBAction)save:(id)sender;
- (IBAction)medicineReminder:(id)sender;
- (IBAction)startDate:(id)sender;
- (IBAction)endDate:(id)sender;

@end
