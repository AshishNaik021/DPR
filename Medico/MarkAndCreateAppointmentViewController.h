//
//  MarkAndCreateAppointmentViewController.h
//  Medico
//
//  Created by APPLE on 28/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MarkAndCreateAppointmentViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIButton *createAppointmentButton;
@property (weak, nonatomic) IBOutlet UITextField *slotField;
@property (weak, nonatomic) IBOutlet UITextField *timeField;
@property (weak, nonatomic) IBOutlet UITextField *patientField;
- (IBAction)createAppointment:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *markAsButton;
- (IBAction)markAs:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *markAsField;
@property (weak, nonatomic) IBOutlet UIButton *allSlotsButton;
- (IBAction)allSlots:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *selectedSlotsButton;
- (IBAction)selectedSlots:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *selectedSlotsField;
@property (weak, nonatomic) IBOutlet UIButton *selectTimeButton;
- (IBAction)selectTime:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *selectTimeField;
@property (weak, nonatomic) IBOutlet UIButton *wholeWeekButton;
- (IBAction)wholeWeek:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
- (IBAction)save:(id)sender;


@end
