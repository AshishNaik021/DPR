//
//  AddNewReminderForDoctorViewController.h
//  Medico
//
//  Created by Apple on 23/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNewReminderForDoctorViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *reminderTitleText;
@property (weak, nonatomic) IBOutlet UITextField *reminderStartDateField;
@property (weak, nonatomic) IBOutlet UITextField *reminderEndDateField;
@property (weak, nonatomic) IBOutlet UITextField *reminderSetTime1Field;
@property (weak, nonatomic) IBOutlet UITextField *reminderSetTime2Field;
@property (weak, nonatomic) IBOutlet UITextField *reminderSetTime3Field;
@property (weak, nonatomic) IBOutlet UIButton *startDateCalendarButton;
- (IBAction)startDateCalendar:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *endDateCalendarButton;
- (IBAction)endDateCalendar:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *setTime1Button;
- (IBAction)setTime1:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *setTime2Button;
- (IBAction)setTime2:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *setTime3Button;
- (IBAction)setTime3:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *addTimeSlot1Button;
- (IBAction)addTimeSlot1:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *addTimeSlot2Button;
- (IBAction)addTimeSlot2:(id)sender;

@end
