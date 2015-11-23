//
//  AddNewReminderForDoctorViewController.m
//  Medico
//
//  Created by Apple on 23/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "AddNewReminderForDoctorViewController.h"

@interface AddNewReminderForDoctorViewController ()

@end

@implementation AddNewReminderForDoctorViewController
@synthesize reminderEndDateField;
@synthesize reminderSetTime1Field;
@synthesize reminderSetTime2Field;
@synthesize reminderSetTime3Field;
@synthesize reminderStartDateField;
@synthesize reminderTitleText;
@synthesize addTimeSlot1Button;
@synthesize addTimeSlot2Button;
@synthesize startDateCalendarButton;
@synthesize setTime1Button;
@synthesize setTime2Button;
@synthesize setTime3Button;
@synthesize endDateCalendarButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    reminderSetTime2Field.hidden = TRUE;
    reminderSetTime3Field.hidden = TRUE;
    setTime2Button.hidden = TRUE;
    setTime3Button.hidden = TRUE;
    addTimeSlot2Button.hidden = TRUE;
    NSLog(@"---------------------%@",[addTimeSlot1Button titleForState:UIControlStateNormal]);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)startDateCalendar:(id)sender {
}
- (IBAction)endDateCalendar:(id)sender {
}
- (IBAction)setTime1:(id)sender {
}
- (IBAction)setTime2:(id)sender {
}
- (IBAction)setTime3:(id)sender {
}
- (IBAction)addTimeSlot1:(id)sender {

    if ([[addTimeSlot1Button titleForState:UIControlStateNormal]  isEqual: @"+"]) {
        [addTimeSlot1Button setTitle:@"-" forState:UIControlStateNormal];
        reminderSetTime2Field.hidden = FALSE;
        setTime2Button.hidden = FALSE;
        addTimeSlot2Button.hidden = FALSE;
    }
    else{
        [addTimeSlot1Button setTitle:@"+" forState:UIControlStateNormal];
        reminderSetTime2Field.hidden = TRUE;
        setTime2Button.hidden = TRUE;
        addTimeSlot2Button.hidden = TRUE;
    }
    
}
- (IBAction)addTimeSlot2:(id)sender {
    if ([[addTimeSlot2Button titleForState:UIControlStateNormal]  isEqual: @"+"]) {
        [addTimeSlot2Button setTitle:@"-" forState:UIControlStateNormal];
        reminderSetTime3Field.hidden = FALSE;
        setTime3Button.hidden = FALSE;
    }
    else{
        [addTimeSlot2Button setTitle:@"+" forState:UIControlStateNormal];
        reminderSetTime3Field.hidden = TRUE;
        setTime3Button.hidden = TRUE;
    }

}
@end
