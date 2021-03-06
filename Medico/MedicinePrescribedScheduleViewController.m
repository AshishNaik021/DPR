//
//  MedicinePrescribedScheduleViewController.m
//  Medico
//
//  Created by APPLE on 26/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "MedicinePrescribedScheduleViewController.h"
#import "DoctorLandingPageView.h"

@interface MedicinePrescribedScheduleViewController ()

@end

@implementation MedicinePrescribedScheduleViewController

@synthesize medicineNamePicker;
@synthesize medicineNameArray;
@synthesize dosesPicker;
@synthesize dosesArray;
@synthesize medSchedule;
@synthesize schedules;
@synthesize doctorsInstructionTextView;
@synthesize scheduleTimeTextView;
@synthesize check;
@synthesize medicineReminderButton;
@synthesize medicineNameField;
@synthesize scheduleField;
@synthesize numberOfDosesField;
@synthesize totalMedicationDurationField;
@synthesize startDateButton;
@synthesize endDateButton;
@synthesize saveButton;
@synthesize startDateField;
@synthesize endDateField;
@synthesize dict;

@synthesize  keyboardVisible;
@synthesize offset;
@synthesize height;
@synthesize width;
@synthesize screen;
@synthesize scrollHeight;

//need to add
@synthesize passAppointmentDate = _passAppointmentDate;
@synthesize passAppointmentTime = _passAppointmentTime;
@synthesize passDiagnosis = _passDiagnosis;
@synthesize passDoctorId = _passDoctorId;
@synthesize passOwnerType = _passOwnerType;
@synthesize passPatientEmail = _passPatientEmail;
@synthesize passReferredBy =_passReferredBy;
@synthesize passSymptoms = _passSymptoms;
@synthesize passTestsPrescribed = _passTestsPrescribed;
@synthesize passVisitDate = _passVisitDate;
@synthesize passvisitType = _passvisitType;

//end

- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}

- (void)viewDidLoad {
    NSLog(@"MedicinePrescribedScheduleViewController.m");
    [super viewDidLoad];
    self.startDateField.text = [self formatDate:[NSDate date]];
    startDateField.tag = 1;
    endDateField.tag = 2;
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
    check = false;
    
    keyboardVisible = false;
    screen = [[UIScreen mainScreen] bounds];
    width = CGRectGetWidth(screen);
    //Bonus height.
    height = CGRectGetHeight(screen);
    scrollHeight = height + 400;
    NSLog(@"Width is--- %f",width);
    NSLog(@"Height is--- %f",height);
    [_scroll setScrollEnabled:YES];
    [_scroll setContentSize:CGSizeMake(width, scrollHeight)];
    
    NSLog(@"_summaryDatePassData----%@",_passAppointmentDate);
    NSLog(@"_summaryTimePassData----%@",_passAppointmentTime);
    NSLog(@"summaryDiagnosis----%@",_passDiagnosis);
    NSLog(@"_summaryDoctorIDPassData----%@",_passDoctorId);
    NSLog(@"passOwnerType----%@",_passOwnerType);
    NSLog(@"_summaryPatientEmailPassData----%@",_passPatientEmail);
    NSLog(@"summaryReferredBy----%@",_passReferredBy);
    NSLog(@"summarySymptoms----%@",_passSymptoms);
    NSLog(@"summaryTestPres----%@",_passTestsPrescribed);
    NSLog(@"summaryViDate----%@",_passVisitDate);
    NSLog(@"summaryViType----%@",_passvisitType);
    
    schedules = [[NSMutableArray alloc] initWithObjects:@"Daily",@"Weekly",@"Monthly",nil];
    
    medSchedule = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-200, self.view.frame.size.width, 200)];
    medSchedule.backgroundColor = [UIColor whiteColor];
    medSchedule.showsSelectionIndicator = YES;
    medSchedule.hidden = YES;
    medSchedule.tag =2;
    medSchedule.delegate = self;
    [self.view addSubview:medSchedule];
    
    dosesArray = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",nil];
    
    dosesPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-200, self.view.frame.size.width, 200)];
    dosesPicker.backgroundColor = [UIColor whiteColor];
    dosesPicker.showsSelectionIndicator = YES;
    dosesPicker.hidden = YES;
    dosesPicker.tag = 3;
    dosesPicker.delegate = self;
    [self.view addSubview:dosesPicker];
    
    medicineNameArray = [[NSArray alloc] initWithObjects:@"Ibrufen 400 mg",@"Dextrose",@"Avelox",@"Crocin",@"Combiflam",@"Sumo",@"Nise",@"Paracitamal",@"Bicasule",nil];
    
    medicineNamePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-200, self.view.frame.size.width, 200)];
    [self.view bringSubviewToFront:medicineNamePicker];
    medicineNamePicker.showsSelectionIndicator = YES;
    medicineNamePicker.hidden = YES;
    medicineNamePicker.backgroundColor = [UIColor whiteColor];
    medicineNamePicker.tag =4;
    medicineNamePicker.delegate = self;
    [self.view addSubview:medicineNamePicker];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
{
    if (pickerView.tag == 2) {
        scheduleField.text = [NSString stringWithFormat:@"%@",schedules[row]];
        medSchedule.hidden = YES;
    }
    else if (pickerView.tag == 3){
        numberOfDosesField.text = [NSString stringWithFormat:@"%@",dosesArray[row]];
        dosesPicker.hidden = YES;
    }
    else if (pickerView.tag == 4){
        medicineNameField.text = [NSString stringWithFormat:@"%@",medicineNameArray[row]];
        medicineNamePicker.hidden = YES;
    }
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if ([textField isEqual:scheduleField]) {
        self.medSchedule.hidden = NO;
        self.dosesPicker.hidden = YES;
        self.medicineNamePicker.hidden = YES;
        return NO;
    }
    else if ([textField isEqual:numberOfDosesField]){
        self.medSchedule.hidden = YES;
        self.dosesPicker.hidden = NO;
        self.medicineNamePicker.hidden = YES;
        return NO;
    }
    else if ([textField isEqual:medicineNameField]){
        self.medSchedule.hidden = YES;
        self.dosesPicker.hidden = YES;
        self.medicineNamePicker.hidden = NO;
        return NO;
    }
    return YES;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView; {
    return 1;
}
-(NSString*) pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *str;
    if (pickerView.tag == 2) {
        str =[NSString stringWithFormat:@"%@",[schedules objectAtIndex:row]];
    }
    else if(pickerView.tag == 3){
        str = [NSString stringWithFormat:@"%@",dosesArray[row]];
    }
    else if(pickerView.tag == 4){
        str = [NSString stringWithFormat:@"%@",medicineNameArray[row]];
    }

    return str;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component; {
    NSInteger retval;
    if (pickerView.tag ==2) {
        retval = schedules.count;
    }
    else if(pickerView.tag == 3){
        retval = dosesArray.count;
    }
    else if(pickerView.tag == 4){
        retval = medicineNameArray.count;
    }
    return retval;
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
    keyboardVisible = false;
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
    CGRect viewFrame = _scroll.frame;
    viewFrame.size.height -= keyboardSize.height;
    _scroll.frame = viewFrame;
    
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
    _scroll.frame = CGRectMake(0, 0, width, scrollHeight);
    
    // Reset the scrollview to previous location
    _scroll.contentOffset = offset;
    
    // Keyboard is no longer visible
    keyboardVisible = NO;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField.returnKeyType==UIReturnKeyNext) {
        UIView *next = [[textField superview] viewWithTag:textField.tag+1];
        [next becomeFirstResponder];
        // [textField resignFirstResponder];
    }else if (textField.returnKeyType==UIReturnKeyDone) {
        [textField resignFirstResponder];
    }
    
    return YES;
}


-(void)errorAllFieldsMandatory{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"All fields are mandatory." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(void)errorMessageMedicineNameNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter Medicine name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateMedicineName:(NSString *) medicineName{
    
    NSString *nameRegex = @"[a-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:medicineName]){
        [self errorMessageMedicineNameNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageScheduleNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter Schedule for medicine." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateScheduleName:(NSString *) scheduleName{
    
    NSString *nameRegex = @"[a-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:scheduleName]){
        [self errorMessageScheduleNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageDosesNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter number of doses for medicine." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateDoses:(NSString *) doses{
    
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:doses]){
        [self errorMessageDosesNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageDurationNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter total duration for medicine." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateDuration:(NSString *) duration{
    
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:duration]){
        [self errorMessageDurationNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageStartDateNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter starting date for medicine." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateStartDate:(NSString *) start{
    
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:start]){
        [self errorMessageStartDateNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageEndDateNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter ending date for medicine." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateEndDate:(NSString *) end{
    
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:end]){
        [self errorMessageEndDateNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageScheduleTimeNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter Schedule Time for medicine." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateScheduleTime:(NSString *) time{
    
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:time]){
        [self errorMessageScheduleTimeNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageDoctorInstructionNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter doctor instruction for medicine." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateDoctorInstruction:(NSString *) instruction{
    
    NSString *nameRegex = @"[a-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:instruction]){
        [self errorMessageDoctorInstructionNotValid];
        return 0;
    }
    else
        return 1;
}

-(BOOL)validateAllFields:(NSString *)medicineName : (NSString *)scheduleName : (NSString *) doses : (NSString *)duration : (NSString *)start : (NSString *)end : (NSString *)scheduleTime : (NSString *)instruction{
    
    if ([self validateMedicineName:medicineName]
        && [self validateScheduleName:scheduleName]
        && [self validateDoses:doses]
        && [self validateDuration:duration]
        && [self validateStartDate:start]
        && [self validateEndDate:end]
        && [self validateScheduleTime:scheduleTime]
        && [self validateDoctorInstruction:instruction]) {
        return 1;
    }
    else{
        return 0;
    }
    
}

-(void)callValidateAllFields{
    
    if([self validateAllFields:medicineNameField.text
                              :scheduleField.text
                              :numberOfDosesField.text
                              :totalMedicationDurationField.text
                              :startDateField.text
                              :endDateField.text
                              :scheduleTimeTextView.text
                              :doctorsInstructionTextView.text]){
        NSLog(@"Sending data to next vc");
        
        NSLog(@"Medicine Name = %@",medicineNameField.text);
        NSLog(@"Schedule Name = %@",scheduleField.text);
        NSLog(@"Number of Doses = %@",numberOfDosesField.text);
        NSLog(@"Total Medication Duration = %@",totalMedicationDurationField.text);
        NSLog(@"Start Date = %@",startDateField.text);
        NSLog(@"End Date = %@",endDateField.text);
        NSLog(@"Schedule Time for medicine = %@",scheduleTimeTextView.text);
        NSLog(@"Doctor instruction = %@",doctorsInstructionTextView.text);
        
        NSArray *objects=[[NSArray alloc]initWithObjects:
                          medicineNameField.text,
                          scheduleField.text,
                          numberOfDosesField.text,
                          totalMedicationDurationField.text,
                          startDateField.text,
                          endDateField.text,
                          scheduleTimeTextView.text,
                          doctorsInstructionTextView.text,
                          nil];
        NSArray *keys=[[NSArray alloc]initWithObjects:
                       @"medicineName",
                       @"scheduleField",
                       @"numberDoses",
                       @"totalDuration",
                       @"startDate",
                       @"endDate",
                       @"scheduleTime",
                       @"instruction",
                       nil];
        
        dict = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        
        NSLog(@"The data in the dictionary is************************%@",dict);
        
        NSError *error;
        //   NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
        // options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
        //  error:&error];
    }
    else {
        NSLog(@"Data invalid");
    }
}

-(void)errorMessaggeCheckBox{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please check Medicine Reminder to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
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

- (IBAction)save:(id)sender {
    
    if ([medicineNameField.text isEqualToString:@""]
        && [scheduleField.text isEqualToString:@""]
        && [numberOfDosesField.text isEqualToString:@""]
        && [totalMedicationDurationField.text isEqualToString:@""]
        && [startDateField.text isEqualToString:@""]
        && [endDateField.text isEqualToString:@""]
        && [scheduleTimeTextView.text isEqualToString:@""]
        && [doctorsInstructionTextView.text isEqualToString:@""]) {
        NSLog(@"All Empty");
        [self errorAllFieldsMandatory];
    }
    else{
        if (check) {
            NSLog(@"Checked and calling func");
            [self callValidateAllFields];
        }
        else{
            NSLog(@"Check button");
            [self errorMessaggeCheckBox];
        }
    }
    
    
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
}

- (IBAction)endDate:(id)sender {
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    medSchedule.hidden = YES;
    dosesPicker.hidden =YES;
    medicineNamePicker.hidden = YES;
    [self.view endEditing:YES];
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    self.endDateField.text = [self formatDate:[self returnDate]];
    [textField resignFirstResponder];
    medSchedule.hidden = YES;
    dosesPicker.hidden = YES;
    medicineNamePicker.hidden = YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.endDateField.text = [self formatDate:[self returnDate]];

    textField.returnKeyType =UIReturnKeyDone;
        if (textField.tag == 1) {
            self.startDateField = textField;
    
            // Create a date picker for the date field.
            UIDatePicker *datePicker = [[UIDatePicker alloc]init];
            datePicker.datePickerMode = UIDatePickerModeDateAndTime;
            datePicker.tag = 1;
            datePicker.minimumDate = [NSDate date];
            [datePicker setDate:[NSDate date]];
            [datePicker addTarget:self action:@selector(updateDateField:) forControlEvents:UIControlEventValueChanged];
    
            // If the date field has focus, display a date picker instead of keyboard.
            // Set the text to the date currently displayed by the picker.
            self.startDateField.inputView = datePicker;
            datePicker.hidden =NO;
            self.startDateField.text = [self formatDate:datePicker.date];
            self.startDateField.text = [self formatDate:[NSDate date]];
        }
    
//    if (textField.tag == 1) {
//        self.startDateField = textField;
//        
//        // Create a date picker for the date field.
////        UIDatePicker *datePicker = [[UIDatePicker alloc]init];
////        datePicker.datePickerMode = UIDatePickerModeDateAndTime;
////        datePicker.tag = 1;
////        datePicker.minimumDate = [NSDate date];
////        [datePicker setDate:[NSDate date]];
////        [datePicker addTarget:self action:@selector(updateDateField:) forControlEvents:UIControlEventValueChanged];
////        
////        // If the date field has focus, display a date picker instead of keyboard.
////        // Set the text to the date currently displayed by the picker.
////        self.startDateField.inputView = datePicker;
////        datePicker.hidden =YES;
////        self.startDateField.text = [self formatDate:datePicker.date];
//        self.startDateField.text = [self formatDate:[NSDate date]];
//    }
//    else if (textField.tag == 2) {
//        self.endDateField = textField;
//        self.endDateField.text = [self formatDate:[self returnDate]];
////        
////        // Create a date picker for the date field.
////        UIDatePicker *datePicker = [[UIDatePicker alloc]init];
////        datePicker.datePickerMode = UIDatePickerModeDate;
////        datePicker.tag = 2;
//////        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//////        [dateFormatter setDateFormat:@"dd-MMM-yyyy hh-mm a"];
//////        NSDate *date = [dateFormatter dateFromString:self.startDateField.text];
//////        datePicker.minimumDate = date;
//////        [datePicker setDate:date];
////        datePicker.minimumDate = [self returnDate];
////        [datePicker setDate:[self returnDate]];
////        [datePicker addTarget:self action:@selector(updateDateField:) forControlEvents:UIControlEventValueChanged];
////        
////        // If the date field has focus, display a date picker instead of keyboard.
////        // Set the text to the date currently displayed by the picker.
////        self.endDateField.inputView = datePicker;
////        datePicker.hidden =YES;
////        self.endDateField.text = [self formatDate:datePicker.date];
////        
//    }
//    else{
//        
//    }
}

-(NSDate *)returnDate{
    if (![scheduleField.text isKindOfClass:[NSNull class]] && ![totalMedicationDurationField.text isKindOfClass:[NSNull class]]) {
        int i = 0;
        int m = 0;
        if ([scheduleField.text isEqualToString:@"Daily"]) {
            i = 1;
        }
        else if([scheduleField.text isEqualToString:@"Weekly"]){
            i = 7;
        }
        else if([scheduleField.text isEqualToString:@"Monthly"]){
            i = 30;
        }
        else{
            i=1;
        }
        
        m = [totalMedicationDurationField.text intValue];
    
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    dayComponent.day = i*m;
    
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    NSDate *nextDate = [theCalendar dateByAddingComponents:dayComponent toDate:[NSDate date] options:0];
    
    NSLog(@"nextDate: %@ ...", nextDate);
    return nextDate;
    }
    else
        return [NSDate date];
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
    [dateFormatter setDateFormat:@"dd-MMM-yyyy hh-mm a"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return formattedDate;
}


@end
