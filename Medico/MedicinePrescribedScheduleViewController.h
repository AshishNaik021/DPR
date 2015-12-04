//
//  MedicinePrescribedScheduleViewController.h
//  Medico
//
//  Created by APPLE on 26/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedicinePrescribedScheduleViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *medicineNameField;
@property (weak, nonatomic) IBOutlet UITextField *scheduleField;
@property (weak, nonatomic) IBOutlet UITextField *numberOfDosesField;
@property (weak, nonatomic) IBOutlet UITextField *totalMedicationDurationField;
@property (weak, nonatomic) IBOutlet UITextField *startDateField;
@property (weak, nonatomic) IBOutlet UITextField *endDateField;
@property (weak, nonatomic) IBOutlet UITextView *scheduleTimeTextView;
@property (weak, nonatomic) IBOutlet UIButton *medicineReminderButton;
@property (weak, nonatomic) IBOutlet UITextView *doctorsInstructionTextView;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *startDateButton;
@property (weak, nonatomic) IBOutlet UIButton *endDateButton;
@property BOOL *check;
@property IBOutlet NSDictionary *dict;

- (IBAction)save:(id)sender;
- (IBAction)medicineReminder:(id)sender;
- (IBAction)startDate:(id)sender;
- (IBAction)endDate:(id)sender;


@end