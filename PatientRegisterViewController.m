//
//  PatientRegisterViewController.m
//  Medico
//
//  Created by Apple on 01/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientRegisterViewController.h"
#import "SMSConfirmationView.h"

@interface PatientRegisterViewController ()

@end

@implementation PatientRegisterViewController


@synthesize checkButton;
@synthesize nameField;
@synthesize patientChecked;
@synthesize emailField;
@synthesize changeImageButton;
@synthesize bloodGroupField;
@synthesize passwordField;
@synthesize mobileField;
@synthesize genderField;
@synthesize dateofBirthField;
@synthesize calendarButton;
@synthesize locationField;
@synthesize allergicToField;
@synthesize readTCButton;
@synthesize nextButton;

@synthesize  keyboardVisible;
@synthesize offset;
@synthesize height;
@synthesize width;
@synthesize screen;
@synthesize scrollHeight;

@synthesize picker;
@synthesize pickerBloodGroupArr;

-(IBAction)readTermConditions:(id)sender{
    
}

-(IBAction)checkButton:(id)sender{
    if(!patientChecked){
        [checkButton setImage:[UIImage imageNamed:@"ic_check_box.png"]forState:UIControlStateNormal];
        patientChecked = YES;
    }
    else if(patientChecked){
        [checkButton setImage:[UIImage imageNamed:@"ic_check_box_outline_blank.png"]forState:UIControlStateNormal];
        patientChecked = NO;
        
    }
}



- (void)viewDidLoad {
    NSLog(@"PatientRegisterViewController.m");
    self.view.userInteractionEnabled = YES;
    [super viewDidLoad];
    self.dateofBirthField.placeholder = @"YYYY-DD-MM";
    patientChecked = NO;
    
    self.navigationItem.title = @"Register As Patient";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    // self.navigationController.navigationBar.backgroundColor = [UIColor cyanColor];//[UIColor colorWithRed:120 green:211 blue:199 alpha:1.0];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    
    dateofBirthField.tag = 6;

    keyboardVisible = NO;
    screen = [[UIScreen mainScreen] bounds];
    width = CGRectGetWidth(screen);
    //Bonus height.
    height = CGRectGetHeight(screen);
    scrollHeight = height + 200;
    [scroll setScrollEnabled:YES];
    [scroll setContentSize:CGSizeMake(width, scrollHeight)];
    
    //picker
    pickerBloodGroupArr = [[NSMutableArray alloc] initWithObjects:@"A+",@"A-",@"B+",@"B-",@"O+",@"O-",@"AB+",@"AB-",nil];
    
    picker = [[UIPickerView alloc] initWithFrame:CGRectMake(20, 450, 300, 200)];
    picker.showsSelectionIndicator = YES;
    picker.hidden = YES;
    picker.delegate = self;
    //picker.tag =2;
    [self.view addSubview:picker];
    
    // Do any additional setup after loading the view.
}

- (NSString *)formatDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"dd-MMM-yyyy"];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return formattedDate;
}

- (void)updateDateField:(id)sender
{
    if (dateofBirthField.isEditing) {
        UIDatePicker *picker = (UIDatePicker*)self.dateofBirthField.inputView;
        self.dateofBirthField.text = [self formatDate:picker.date];
    }
    
}



- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.returnKeyType = UIReturnKeyDone;
    if (textField.tag == 6) {
        self.dateofBirthField = textField;
        
        // Create a date picker for the date field.
        UIDatePicker *datePicker = [[UIDatePicker alloc]init];
        datePicker.datePickerMode = UIDatePickerModeDate;
        datePicker.maximumDate = [NSDate date];
        [datePicker setDate:[NSDate date]];
        [datePicker addTarget:self action:@selector(updateDateField:) forControlEvents:UIControlEventValueChanged];
        
        // If the date field has focus, display a date picker instead of keyboard.
        // Set the text to the date currently displayed by the picker.
        self.dateofBirthField.inputView = datePicker;
        self.dateofBirthField.text = [self formatDate:datePicker.date];
        
    }
}



- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView; {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component; {
    
    return pickerBloodGroupArr.count;
}

-(NSString*) pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return [pickerBloodGroupArr objectAtIndex:row];
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
{
    
    
    bloodGroupField.text = [NSString stringWithFormat:@"%@",pickerBloodGroupArr[row]];
    picker.hidden = YES;
    
    
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if ([textField isEqual:bloodGroupField]) {
        self.picker.hidden = NO;
        //        self.summaryPicker.backgroundColor = [UIColor clearColor];
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
    offset = scroll.contentOffset;
    
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
        // [textField resignFirstResponder];
    }else if (textField.returnKeyType==UIReturnKeyDone) {
        [textField resignFirstResponder];
    }
    
    return YES;
    //    [textField resignFirstResponder];
    //    return YES;
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
-(void)errorAllFieldsMandatory{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"All fields are mandatory." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(void)errorMessageNameNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateName:(NSString *) name{
    
    NSString *nameRegex = @"[a-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:name]){
        [self errorMessageNameNotValid];
        return 0;
    }
    else
        return 1;
}
-(void)errorMessageEmailNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Email." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateEmail:(NSString *) email{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", emailRegex];
    
    if ([emailTest evaluateWithObject:email]){
        return 1;
    }
    else{
        [self errorMessageEmailNotValid];
        return 0;
    }
}
-(void)errorMessagePasswordNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Password." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validatePassword:(NSString *) password{
    if ([password isEqualToString:@""]) {
        [self errorMessagePasswordNotValid];
        return 0;
    }
    else
        return 1;
}
-(void)errorMessageMobileNumberNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Mobile Number." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateMobileNumber:(NSString *) mobileNumber{
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:mobileNumber]){
        [self errorMessageMobileNumberNotValid];
        return 0;
    }
    else
        return 1;
}
-(void)errorMessageBloodGroupNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Blood Group." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
-(BOOL)validateBloodGroup:(NSString *) bloodGroup{
    if ([bloodGroup isEqualToString:@""]) {
        [self errorMessageBloodGroupNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageGenderNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Gender." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateGender:(NSString *) gender{
    BOOL returnvalue = 0;
    if ([gender isEqualToString:@""]) {
        returnvalue = 1;
    }
    else{
        NSString *nameRegex = @"[A-Za-z]+";
        NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
        if ([nameTest evaluateWithObject:gender]) {
            returnvalue = 1;
        }
    }
    
    return returnvalue;
}
-(void)errorMessageDOBNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid date of birth." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
-(BOOL)validateDOB:(NSString *) DOB{
    if (![DOB  isEqualToString:@""])
        return 1;
    else{
        [self errorMessageDOBNotValid];
        return 0;
    }
}

-(void)errorMessageLocationNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Location." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateLocation:(NSString *) location{
    NSString *nameRegex = @"[a-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![location isEqualToString:@""] && [nameTest evaluateWithObject:location]){
        return 1;
    }
    else
        return 0;
}

-(void)errorMessaggeSpecialityNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Speciality." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
-(BOOL)validateAllergicTo:(NSString *) allergicTo{
    BOOL returnValue = 0;
    if ([allergicTo isEqualToString:@""]) {
        returnValue =  1;
    }
    else{
        NSString *nameRegex = @"[a-z]+";
        NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
        
        if([nameTest evaluateWithObject:allergicTo]){
            returnValue = 1;
        }
        else
            returnValue = 0;
    }
    return returnValue;
}
-(BOOL)validateAllFields:(NSString *)name : (NSString *)email : (NSString *)password :(NSString *) mobileNumber : (NSString *)bloodGroup : (NSString *)gender : (NSString *)dateOfBirth : (NSString *)location :(NSString *)allergicTo{
    if ([self validateName:name]
        && [self validateEmail:email]
        && [self validatePassword:password]
        && [self validateMobileNumber:mobileNumber]
        && [self validateBloodGroup:bloodGroup]
        && [self validateGender:gender]
        && [self validateDOB:dateOfBirth]
        && [self validateLocation:location]
        && [self validateAllergicTo:allergicTo]) {
        return 1;
    }
    else{
        return 0;
    }
    
}
- (IBAction)addCalendar:(id)sender {
}
- (IBAction)readTermsConditions:(id)sender {
}

-(void)callValidateAllFields{
    
    if([self validateAllFields:nameField.text
                              :emailField.text
                              :passwordField.text
                              :mobileField.text
                              :bloodGroupField.text
                              :genderField.text
                              :dateofBirthField.text
                              :locationField.text
                              :allergicToField.text]){
        NSLog(@"Sending data to next vc");
        NSArray *objects=[[NSArray alloc]initWithObjects:
                          nameField.text,
                          emailField.text,
                          passwordField.text,
                          mobileField.text,
                          bloodGroupField.text,
                          genderField.text,
                          dateofBirthField.text,
                          locationField.text,
                          allergicToField.text,
                          @"",
                          @"",
                          @"",
                          nil];
        NSArray *keys=[[NSArray alloc]initWithObjects:
                       @"name",
                       @"emailID",
                       @"password",
                       @"mobileNumber",
                       @"bloodGroup",
                       @"gender",
                       @"dateOfBirth",
                       @"location",
                       @"allergicTo",
                       @"cloudLoginId",
                       @"cloudLoginPassword",
                       @"cloudType",
                       nil];
        
        NSDictionary *dict=[NSDictionary dictionaryWithObjects:objects forKeys:keys];
        SMSConfirmationView *viewController =
        [self.storyboard instantiateViewControllerWithIdentifier:@"SMSConfirmationView"];
        viewController.data = dict;
        NSLog(@"is dic copied? %@",viewController.data);
        [self.navigationController pushViewController:viewController animated:YES];
    }
    else {
        NSLog(@"Data invalid");
    }
}
-(void)errorMessaggeCheckBox{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please Agree with terms and conditions to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

- (IBAction)next:(id)sender {
    if ([nameField.text isEqualToString:@""]
        && [emailField.text isEqualToString:@""]
        && [passwordField.text isEqualToString:@""]
        && [mobileField.text isEqualToString:@""]
        && [bloodGroupField.text isEqualToString:@""]
        && [genderField.text isEqualToString:@""]
        && [dateofBirthField.text isEqualToString:@""]
        && [locationField.text isEqualToString:@""]) {
        NSLog(@"All Empty");
        [self errorAllFieldsMandatory];
    }
    else{
        if (patientChecked) {
            NSLog(@"Checked and calling func");
            [self callValidateAllFields];
        }
        else{
            NSLog(@"Check button");
            [self errorMessaggeCheckBox];
        }
    }
}
- (IBAction)addLocation:(id)sender {
}
- (IBAction)changeImage:(id)sender {
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    picker.hidden = YES;
    [self.view endEditing:YES];
}

@end
