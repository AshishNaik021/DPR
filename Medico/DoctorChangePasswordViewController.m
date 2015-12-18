//
//  DoctorChangePasswordViewController.m
//  Medico
//
//  Created by APPLE on 13/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DoctorChangePasswordViewController.h"
#import "ChangePasswordViewController.h"

@interface DoctorChangePasswordViewController ()

@end

@implementation DoctorChangePasswordViewController
@synthesize checkButton;
@synthesize  keyboardVisible;
@synthesize offset;
@synthesize height;
@synthesize width;
@synthesize screen;
@synthesize scrollHeight;
@synthesize scroll;
@synthesize doctor;

@synthesize picker;
@synthesize pickerBloodGroupArr;
@synthesize pickerSpecialityArr;
@synthesize pickerSpeciality;

@synthesize doctorProfileArr;
@synthesize nameField;
@synthesize emailField;
@synthesize passwordField;
@synthesize mobileField;
@synthesize genderField;
@synthesize dateoBirthField;
@synthesize locationField;
@synthesize bloodGroupField;
@synthesize specializationField;



-(void)fetchDoctorProfile{
    
    NSLog(@"The fetchJson method is called.........");
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSString *emailid = [[NSUserDefaults standardUserDefaults] objectForKey:@"loggedInEmail"];
    
    NSLog(@"email id for logged in user...%@",emailid);
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/getProfileDoctor?email=%@",emailid];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    //NSMutableArray *arratList = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"Data in Array==============%@",responseStr);
    
    /* ---------- Code for Writing response data into the file -------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getDoctorProcedures.json"];
    [responseStr writeToFile:docPath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
    
    /* ---------- End of Code for Writing response data into the file -------------- */
    
    
    
}

- (void)viewDidLoad {
    NSLog(@"DoctorChangePasswordViewController.m");
    [super viewDidLoad];
    
    [self fetchDoctorProfile];
    
    /* ----------------- Read File For Parse JSON Data -------------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getDoctorProcedures.json"];
    NSLog(@"%@",docPath);
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:docPath encoding:NSUTF8StringEncoding error:NULL];
    
    NSError *error = nil;
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    
    doctorProfileArr = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&error];
    
    //picker
    pickerBloodGroupArr = [[NSMutableArray alloc] initWithObjects:@"A+",@"A-",@"B+",@"B-",@"O+",@"O-",@"AB+",@"AB-",nil];
    
    pickerSpecialityArr = [[NSMutableArray alloc] initWithObjects:@"Gynachologic",@"Pedriatic", nil];
    
    picker = [[UIPickerView alloc] initWithFrame:CGRectMake(20, 400, 300, 200)];
    picker.showsSelectionIndicator = YES;
    picker.hidden = YES;
    picker.delegate = self;
    picker.tag =2;
    [self.view addSubview:picker];
    
    pickerSpeciality = [[UIPickerView alloc] initWithFrame:CGRectMake(20, 400, 300, 200)];
    pickerSpeciality.showsSelectionIndicator = YES;
    pickerSpeciality.hidden = YES;
    pickerSpeciality.delegate = self;
    pickerSpeciality.tag = 3;
    [self.view addSubview:pickerSpeciality];
    
    
    
    if (![[doctorProfileArr valueForKey:@"name"] isEqual:[NSNull null]]){
        nameField.text = [doctorProfileArr valueForKey:@"name"];
    }
    else{
        nameField.text = @"NA";
    }
    
    if (![[doctorProfileArr valueForKey:@"emailID"] isEqual:[NSNull null]]){
        emailField.text = [doctorProfileArr valueForKey:@"emailID"];
    }
    else{
        emailField.text = @"NA";
    }
    
    if (![[doctorProfileArr valueForKey:@"password"] isEqual:[NSNull null]]){
        passwordField.text = [doctorProfileArr valueForKey:@"password"];
    }
    else{
        passwordField.text = @"NA";
    }
    
    if (![[doctorProfileArr valueForKey:@"mobileNumber"] isEqual:[NSNull null]]){
        mobileField.text = [doctorProfileArr valueForKey:@"mobileNumber"];
    }
    else{
        mobileField.text = @"NA";
    }
    
    if (![[doctorProfileArr valueForKey:@"gender"] isEqual:[NSNull null]]){
        genderField.text = [doctorProfileArr valueForKey:@"gender"];
    }
    else{
        genderField.text = @"NA";
    }
    
    if (![[doctorProfileArr valueForKey:@"dateOfBirth"] isEqual:[NSNull null]]){
        dateoBirthField.text = [doctorProfileArr valueForKey:@"dateOfBirth"];
    }
    else{
        dateoBirthField.text = @"NA";
    }
    
    if (![[doctorProfileArr valueForKey:@"location"] isEqual:[NSNull null]]){
        locationField.text = [doctorProfileArr valueForKey:@"location"];
    }
    else{
        locationField.text = @"NA";
    }
    
    if (![[doctorProfileArr valueForKey:@"bloodGroup"] isEqual:[NSNull null]]){
        bloodGroupField.text = [doctorProfileArr valueForKey:@"bloodGroup"];
    }
    else{
        bloodGroupField.text = @"NA";
    }
    
    if (![[doctorProfileArr valueForKey:@"speciality"] isEqual:[NSNull null]]){
        specializationField.text = [doctorProfileArr valueForKey:@"speciality"];
    }
    else{
        specializationField.text = @"NA";
    }
    
    
    
    
    
    keyboardVisible = NO;
    screen = [[UIScreen mainScreen] bounds];
    width = CGRectGetWidth(screen);
    //Bonus height.
    height = CGRectGetHeight(screen);
    scrollHeight = height + 200;
    NSLog(@"Width is--- %f",width);
    NSLog(@"Height is--- %f",height);
    [scroll setScrollEnabled:YES];
    [scroll setContentSize:CGSizeMake(width, scrollHeight)];
    
    
    doctor = NO;
    self.navigationItem.title = @"Profile";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    
    // Do any additional setup after loading the view.
    
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView; {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component; {
    
    NSInteger retval;
    if (pickerView.tag ==2) {
        retval = pickerBloodGroupArr.count;
    }
    else if(pickerView.tag == 3){
        retval = pickerSpecialityArr.count;
    }
    return retval;
    
    
    //return pickerBloodGroupArr.count;
    
}
-(NSString*) pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *str;
    if (pickerView.tag == 2) {
        str =[NSString stringWithFormat:@"%@",[pickerBloodGroupArr objectAtIndex:row]];
    }
    else if(pickerView.tag == 3){
        str = [NSString stringWithFormat:@"%@",pickerSpecialityArr[row]];
    }
    return str;
    
    
    
    //return [pickerBloodGroupArr objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
{
    
    if (pickerView.tag == 2) {
        bloodGroupField.text = [NSString stringWithFormat:@"%@",pickerBloodGroupArr[row]];
        picker.hidden = YES;
    }
    else if (pickerView.tag == 3){
        specializationField.text = [NSString stringWithFormat:@"%@",pickerSpecialityArr[row]];
        pickerSpeciality.hidden = YES;
    }
    else{
        
    }
    
    
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    /*if ([textField isEqual:scheduleField]) {
     self.medSchedule.hidden = NO;
     return NO;
     }
     else if ([textField isEqual:numberOfDosesField]){
     self.dosesPicker.hidden = NO;
     return NO;
     }
     return YES;
     */
    
    if ([textField isEqual:bloodGroupField]) {
        self.picker.hidden = NO;
        //        self.summaryPicker.backgroundColor = [UIColor clearColor];
        return NO;
    }
    else if ([textField isEqual:specializationField]){
        self.pickerSpeciality.hidden = NO;
        return NO;
    }
    return YES;
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
        //        UIView *next = [[textField superview] viewWithTag:textField.tag+1];
        //        [next becomeFirstResponder];
        [textField resignFirstResponder];
    }else if (textField.returnKeyType==UIReturnKeyDone) {
        [textField resignFirstResponder];
    }
    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    picker.hidden = YES;
    pickerSpeciality.hidden = YES;
    [self.view endEditing:YES];
}



/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)changeImage:(id)sender {
}
- (IBAction)addCalendar:(id)sender {
}
- (IBAction)check:(id)sender {
    if(!doctor){
        [checkButton setImage:[UIImage imageNamed:@"ic_check_box.png"]forState:UIControlStateNormal];
        doctor = YES;
    }
    else if(doctor){
        [checkButton setImage:[UIImage imageNamed:@"ic_check_box_outline_blank.png"]forState:UIControlStateNormal];
        doctor = NO;
        
    }
    
}
- (IBAction)readTermsConditions:(id)sender {
}
- (IBAction)changePassword:(id)sender {
    ChangePasswordViewController *changePass =
    [self.storyboard instantiateViewControllerWithIdentifier:@"ChangePasswordViewController"];
    [self.navigationController pushViewController:changePass animated:YES];
}
- (IBAction)save:(id)sender {
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.returnKeyType = UIReturnKeyDone;
    if (textField.tag == 7) {
        self.dateoBirthField = textField;
        
        // Create a date picker for the date field.
        UIDatePicker *datePicker = [[UIDatePicker alloc]init];
        datePicker.datePickerMode = UIDatePickerModeDate;
        datePicker.maximumDate = [NSDate date];
        [datePicker setDate:[NSDate date]];
        [datePicker addTarget:self action:@selector(updateDateField:) forControlEvents:UIControlEventValueChanged];
        
        // If the date field has focus, display a date picker instead of keyboard.
        // Set the text to the date currently displayed by the picker.
        self.dateoBirthField.inputView = datePicker;
        self.dateoBirthField.text = [self formatDate:datePicker.date];
        
    }
}



// Called when the date picker changes.
- (void)updateDateField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.dateoBirthField.inputView;
    self.dateoBirthField.text = [self formatDate:picker.date];
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


@end
