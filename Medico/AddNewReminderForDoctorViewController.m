//
//  AddNewReminderForDoctorViewController.m
//  Medico
//
//  Created by Apple on 23/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "AddNewReminderForDoctorViewController.h"
#import "DoctorLandingPageView.h"
#import "PatientLandingPageViewController.h"

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

- (void) homePage:(id)sender{
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"loggedInUserType"] isEqualToString:@"Doctor"]) {
        
        DoctorLandingPageView *DoctorHome =
        [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
        [self.navigationController pushViewController:DoctorHome animated:YES];
    }
    else{
        PatientLandingPageViewController *patientHome =
        [self.storyboard instantiateViewControllerWithIdentifier:@"PatientLandingPageViewController"];
        [self.navigationController pushViewController:patientHome animated:YES];
    }

    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"AddNewReminderForDoctorViewController.m");
    reminderSetTime2Field.hidden = TRUE;
    reminderSetTime3Field.hidden = TRUE;
    setTime2Button.hidden = TRUE;
    setTime3Button.hidden = TRUE;
    addTimeSlot2Button.hidden = TRUE;
    NSLog(@"---------------------%@",[addTimeSlot1Button titleForState:UIControlStateNormal]);
    // Do any additional setup after loading the view.
    reminderStartDateField.tag = 2;
    reminderEndDateField.tag = 3;
    reminderSetTime1Field.tag = 4;
    reminderSetTime2Field.tag =5;
    reminderSetTime3Field.tag =6;
    UIImage *myImage = [UIImage imageNamed:@"ic_home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    
    self.navigationItem.title = @"Add New Reminder";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    self.reminderEndDateField.userInteractionEnabled = NO;
    
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
    
    // Create a date picker for the date field.
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.tag = 2;
    datePicker.minimumDate = [NSDate date];
    [datePicker setDate:[NSDate date]];
    [datePicker addTarget:self action:@selector(updateDateField:) forControlEvents:UIControlEventValueChanged];
    
    // If the date field has focus, display a date picker instead of keyboard.
    // Set the text to the date currently displayed by the picker.
    self.reminderStartDateField.inputView = datePicker;
    self.reminderStartDateField.text = [self formatDate:datePicker.date];
    
}
- (IBAction)endDateCalendar:(id)sender {
    // Create a date picker for the date field.
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.tag = 3;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MMM-yyyy"];
    NSDate *date = [dateFormatter dateFromString:self.reminderStartDateField.text];
    datePicker.minimumDate = date;
    [datePicker setDate:date];
    [datePicker addTarget:self action:@selector(updateDateField:) forControlEvents:UIControlEventValueChanged];
    
    // If the date field has focus, display a date picker instead of keyboard.
    // Set the text to the date currently displayed by the picker.
    self.reminderEndDateField.inputView = datePicker;
    self.reminderEndDateField.text = [self formatDate:datePicker.date];
    
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField.returnKeyType==UIReturnKeyNext) {
        UIView *next = [[textField superview] viewWithTag:textField.tag+1];
        [next becomeFirstResponder];
        //[textField resignFirstResponder];
    }else if (textField.returnKeyType==UIReturnKeyDone) {
        [textField resignFirstResponder];
    }
    
    return YES;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.view endEditing:YES];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.tag == 2) {
        self.reminderStartDateField = textField;
        
        // Create a date picker for the date field.
        UIDatePicker *datePicker = [[UIDatePicker alloc]init];
        datePicker.datePickerMode = UIDatePickerModeDate;
        datePicker.tag = 2;
        datePicker.minimumDate = [NSDate date];
        [datePicker setDate:[NSDate date]];
        [datePicker addTarget:self action:@selector(updateDateField:) forControlEvents:UIControlEventValueChanged];
        
        // If the date field has focus, display a date picker instead of keyboard.
        // Set the text to the date currently displayed by the picker.
        self.reminderStartDateField.inputView = datePicker;
        self.reminderStartDateField.text = [self formatDate:datePicker.date];
        self.reminderEndDateField.userInteractionEnabled = YES;
        
    }
    else if (textField.tag == 3) {
        self.reminderEndDateField = textField;
        
        // Create a date picker for the date field.
        UIDatePicker *datePicker = [[UIDatePicker alloc]init];
        datePicker.datePickerMode = UIDatePickerModeDate;
        datePicker.tag = 3;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd-MMM-yyyy"];
        NSDate *date = [dateFormatter dateFromString:self.reminderStartDateField.text];
        datePicker.minimumDate =  date;
        [datePicker setDate: date];
        [datePicker addTarget:self action:@selector(updateDateField:) forControlEvents:UIControlEventValueChanged];
        
        // If the date field has focus, display a date picker instead of keyboard.
        // Set the text to the date currently displayed by the picker.
        self.reminderEndDateField.inputView = datePicker;
        self.reminderEndDateField.text = [self formatDate:datePicker.date];
        
    }
    else if (textField.tag == 4) {
        self.reminderSetTime1Field = textField;
        
        // Create a date picker for the date field.
        UIDatePicker *datePicker = [[UIDatePicker alloc]init];
        datePicker.datePickerMode = UIDatePickerModeTime;
        datePicker.tag = 4;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"HH-mm"];
        [datePicker setDate: [NSDate date]];
        [datePicker addTarget:self action:@selector(updateDateField:) forControlEvents:UIControlEventValueChanged];
        
        // If the date field has focus, display a date picker instead of keyboard.
        // Set the text to the date currently displayed by the picker.
        self.reminderSetTime1Field.inputView = datePicker;
        self.reminderSetTime1Field.text = [self formatTime:datePicker.date];
        
    }
    else if (textField.tag == 5) {
        self.reminderSetTime2Field = textField;
        
        // Create a date picker for the date field.
        UIDatePicker *datePicker = [[UIDatePicker alloc]init];
        datePicker.datePickerMode = UIDatePickerModeTime;
        datePicker.tag = 5;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"HH-mm"];
        [datePicker setDate: [NSDate date]];
        [datePicker addTarget:self action:@selector(updateDateField:) forControlEvents:UIControlEventValueChanged];
        
        // If the date field has focus, display a date picker instead of keyboard.
        // Set the text to the date currently displayed by the picker.
        self.reminderSetTime2Field.inputView = datePicker;
        self.reminderSetTime2Field.text = [self formatTime:datePicker.date];
        
    }
    else if (textField.tag == 6) {
        self.reminderSetTime3Field = textField;
        
        // Create a date picker for the date field.
        UIDatePicker *datePicker = [[UIDatePicker alloc]init];
        datePicker.datePickerMode = UIDatePickerModeTime;
        datePicker.tag = 6;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"HH-mm"];
        [datePicker setDate: [NSDate date]];
        [datePicker addTarget:self action:@selector(updateDateField:) forControlEvents:UIControlEventValueChanged];
        
        // If the date field has focus, display a date picker instead of keyboard.
        // Set the text to the date currently displayed by the picker.
        self.reminderSetTime3Field.inputView = datePicker;
        self.reminderSetTime3Field.text = [self formatTime:datePicker.date];
        
    }
    
    
    else{
        
    }
}



// Called when the date picker changes.
- (void)updateDateField:(id)sender
{
    if (reminderStartDateField.isEditing) {
        UIDatePicker *picker = (UIDatePicker*)self.reminderStartDateField.inputView;
        self.reminderStartDateField.text = [self formatDate:picker.date];
    }
    else if (reminderEndDateField.isEditing){
        UIDatePicker *picker = (UIDatePicker*)self.reminderEndDateField.inputView;
        self.reminderEndDateField.text = [self formatDate:picker.date];
    }
    else if (reminderSetTime1Field.isEditing){
        UIDatePicker *picker = (UIDatePicker*)self.reminderSetTime1Field.inputView;
        self.reminderSetTime1Field.text =[self formatTime:picker.date];
    }
    else if (reminderSetTime2Field.isEditing){
        UIDatePicker *picker = (UIDatePicker*)self.reminderSetTime2Field.inputView;
        self.reminderSetTime2Field.text =[self formatTime:picker.date];
    }
    else if (reminderSetTime3Field.isEditing){
        UIDatePicker *picker = (UIDatePicker*)self.reminderSetTime3Field.inputView;
        self.reminderSetTime3Field.text =[self formatTime:picker.date];
    }
    
    
}



// Formats the date chosen with the date picker.
- (NSString *)formatDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"dd-MMM-yyyy"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return formattedDate;
}
// Formats the date chosen with the date picker.
- (NSString *)formatTime:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"HH-mm"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return formattedDate;
}
- (IBAction)addTime:(id)sender{
    
}
- (IBAction)back:(id)sender{
    
}


@end
