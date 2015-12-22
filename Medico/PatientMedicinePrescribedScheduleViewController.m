//
//  PatientMedicinePrescribedScheduleViewController.m
//  Medico
//
//  Created by Apple on 25/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientMedicinePrescribedScheduleViewController.h"
#import "PatientLandingPageViewController.h"

@interface PatientMedicinePrescribedScheduleViewController ()

@end



@implementation PatientMedicinePrescribedScheduleViewController
@synthesize doctorsInstructionTextView;
@synthesize scheduleTimeTextView;
@synthesize check;
@synthesize medicineReminderButton;
@synthesize startDateField;
@synthesize endDateField;

@synthesize  keyboardVisible;
@synthesize offset;
@synthesize height;
@synthesize width;
@synthesize screen;
@synthesize scrollHeight;
@synthesize scroll;

- (void) homePage:(id)sender{
    PatientLandingPageViewController *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientLandingPageViewController"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"PatientMedicinePrescribedScheduleViewController.m");
    
    UIImage *myImage = [UIImage imageNamed:@"ic_home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Medicine Schedule";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    [doctorsInstructionTextView.layer setBorderWidth:1.0];
    [scheduleTimeTextView.layer setBorderWidth:1.0];
    check = NO;
    
    startDateField.tag = 4;
    endDateField.tag = 5;
    
    keyboardVisible = NO;
    screen = [[UIScreen mainScreen] bounds];
    width = CGRectGetWidth(screen);
    //Bonus height.
    height = CGRectGetHeight(screen);
    scrollHeight = height + 400;
    NSLog(@"Width is--- %f",width);
    NSLog(@"Height is--- %f",height);
    [scroll setScrollEnabled:YES];
    [scroll setContentSize:CGSizeMake(width, scrollHeight)];

    // Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"Registering for keyboard events");
    
    // Register for the events
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardDidShow:)
                                                 name: UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardDidHide:)
                                                 name: UIKeyboardDidHideNotification object:nil];
    
    //Initially the keyboard is hidden
    keyboardVisible = NO;
}

-(void) viewWillDisappear:(BOOL)animated
{
    NSLog (@"Unregister for keyboard events");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void) keyboardDidShow: (NSNotification *)notif
{
    // If keyboard is visible, return
    if (keyboardVisible)
    {
        NSLog(@"Keyboard is already visible. Ignore notification.");
        return;
    }
    
    // Get the size of the keyboard.
    NSDictionary* info = [notif userInfo];
    NSValue* aValue = [info objectForKey:UIKeyboardBoundsUserInfoKey];
    CGSize keyboardSize = [aValue CGRectValue].size;
    
    // Save the current location so we can restore
    // when keyboard is dismissed
    offset = self.scroll.contentOffset;
    
    // Resize the scroll view to make room for the keyboard
    CGRect viewFrame = scroll.frame;
    viewFrame.size.height -= keyboardSize.height;
    scroll.frame = viewFrame;
    
    // Keyboard is now visible
    keyboardVisible = YES;
}

-(void) keyboardDidHide: (NSNotification *)notif
{
    // Is the keyboard already shown
    if (!keyboardVisible)
    {
        NSLog(@"Keyboard is already hidden. Ignore notification.");
        return;
    }
    
    // Reset the frame scroll view to its original value
    scroll.frame = CGRectMake(0, 0, width, scrollHeight);
    
    // Reset the scrollview to previous location
    scroll.contentOffset = offset;
    
    // Keyboard is no longer visible
    keyboardVisible = NO;
    
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

- (IBAction)save:(id)sender {
}

- (IBAction)medicineReminder:(id)sender {
    if(!check){
        [medicineReminderButton setImage:[UIImage imageNamed:@"ic_check_box.png"]forState:UIControlStateNormal];
        check = YES;
    }
    else if(check){
        [medicineReminderButton setImage:[UIImage imageNamed:@"ic_check_box_outline_blank.png"]forState:UIControlStateNormal];
        check = NO;
        
    }
    
}

- (IBAction)startDate:(id)sender {
    // Create a date picker for the date field.
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.tag = 2;
    datePicker.minimumDate = [NSDate date];
    [datePicker setDate:[NSDate date]];
    [datePicker addTarget:self action:@selector(updateDateField:) forControlEvents:UIControlEventValueChanged];
    
    // If the date field has focus, display a date picker instead of keyboard.
    // Set the text to the date currently displayed by the picker.
    self.startDateField.inputView = datePicker;
    self.startDateField.text = [self formatDate:datePicker.date];
    

}

- (IBAction)endDate:(id)sender {
    // Create a date picker for the date field.
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.tag = 3;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MMM-yyyy"];
    NSDate *date = [dateFormatter dateFromString:self.startDateField.text];
    datePicker.minimumDate = date;
    [datePicker setDate:date];
    [datePicker addTarget:self action:@selector(updateDateField:) forControlEvents:UIControlEventValueChanged];
    
    // If the date field has focus, display a date picker instead of keyboard.
    // Set the text to the date currently displayed by the picker.
    self.endDateField.inputView = datePicker;
    self.endDateField.text = [self formatDate:datePicker.date];
    

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.tag == 4) {
        self.startDateField = textField;
        
        // Create a date picker for the date field.
        UIDatePicker *datePicker = [[UIDatePicker alloc]init];
        datePicker.datePickerMode = UIDatePickerModeDate;
        datePicker.tag = 2;
        datePicker.minimumDate = [NSDate date];
        [datePicker setDate:[NSDate date]];
        [datePicker addTarget:self action:@selector(updateDateField:) forControlEvents:UIControlEventValueChanged];
        
        // If the date field has focus, display a date picker instead of keyboard.
        // Set the text to the date currently displayed by the picker.
        self.startDateField.inputView = datePicker;
        self.startDateField.text = [self formatDate:datePicker.date];
        self.endDateField.userInteractionEnabled = YES;
        
    }
    else if (textField.tag == 5) {
        self.endDateField = textField;
        
        // Create a date picker for the date field.
        UIDatePicker *datePicker = [[UIDatePicker alloc]init];
        datePicker.datePickerMode = UIDatePickerModeDate;
        datePicker.tag = 3;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd-MMM-yyyy"];
        NSDate *date = [dateFormatter dateFromString:self.startDateField.text];
        datePicker.minimumDate =  date;
        [datePicker setDate: date];
        [datePicker addTarget:self action:@selector(updateDateField:) forControlEvents:UIControlEventValueChanged];
        
        // If the date field has focus, display a date picker instead of keyboard.
        // Set the text to the date currently displayed by the picker.
        self.endDateField.inputView = datePicker;
        self.endDateField.text = [self formatDate:datePicker.date];
        
    }
    
    
    else{
        
    }
}



// Called when the date picker changes.
- (void)updateDateField:(id)sender
{
    if (startDateField.isEditing) {
        UIDatePicker *picker = (UIDatePicker*)self.startDateField.inputView;
        self.startDateField.text = [self formatDate:picker.date];
    }
    else if (endDateField.isEditing){
        UIDatePicker *picker = (UIDatePicker*)self.endDateField.inputView;
        self.endDateField.text = [self formatDate:picker.date];
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

@end
