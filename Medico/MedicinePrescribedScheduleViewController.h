//
//  MedicinePrescribedScheduleViewController.h
//  Medico
//
//  Created by APPLE on 26/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedicinePrescribedScheduleViewController : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

@property(nonatomic,retain) UIPickerView *medSchedule;
@property (nonatomic,retain) NSMutableArray *schedules;
@property (nonatomic,retain) UIPickerView *dosesPicker;
@property (nonatomic,retain) NSMutableArray *dosesArray;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@property (weak, nonatomic) IBOutlet UITextField *medicineNameField;
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
@property IBOutlet NSDictionary *dict;

- (IBAction)save:(id)sender;
- (IBAction)medicineReminder:(id)sender;
- (IBAction)startDate:(id)sender;
- (IBAction)endDate:(id)sender;

@property  BOOL *keyboardVisible;
@property CGPoint offset;
@property CGFloat width;
@property CGFloat height;
@property CGFloat scrollHeight;
@property CGRect screen;


// need to add......
@property IBOutlet NSString *passAppointmentDate;
@property IBOutlet NSString *passAppointmentTime;
@property IBOutlet NSString *passDiagnosis;
@property IBOutlet NSString *passDoctorId;
@property IBOutlet NSString *passOwnerType;
@property IBOutlet NSString *passPatientEmail;
@property IBOutlet NSString *passReferredBy;
@property IBOutlet NSString *passSymptoms;
@property IBOutlet NSString *passTestsPrescribed;
@property IBOutlet NSString *passVisitDate;
@property IBOutlet NSString *passvisitType;
// end......
@end
