
//
//  AssistantRegister.m
//  Medico
//
//  Created by APPLE on 05/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "AssistantRegister.h"
#import "SMSConfirmationView.h"

@interface AssistantRegister ()

@end

@implementation AssistantRegister

@synthesize  keyboardVisible;
@synthesize offset;
@synthesize height;
@synthesize width;
@synthesize screen;
@synthesize scrollHeight;
@synthesize scroll;

@synthesize picker;
@synthesize pickerSpeciality;
@synthesize pickerSpecialityArr;
@synthesize pickerProfesionArr;


@synthesize checkButton;
@synthesize professionField;
@synthesize assistantChecked;
@synthesize nameField;
@synthesize emailField;
@synthesize changeImageButton;
@synthesize passwordField;
@synthesize mobileField;
@synthesize genderField;
@synthesize dateofBirthField;
@synthesize calendarButton;
@synthesize locationField;
@synthesize specializationField;
@synthesize readTCButton;
@synthesize nextButton;


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    picker.hidden = YES;
    pickerSpeciality.hidden = YES;
    [self.view endEditing:YES];
}


-(IBAction)checkButton:(id)sender{
    if(!assistantChecked){
        [checkButton setImage:[UIImage imageNamed:@"ic_check_box.png"]forState:UIControlStateNormal];
        assistantChecked = YES;
    }
    else if(assistantChecked){
        [checkButton setImage:[UIImage imageNamed:@"ic_check_box_outline_blank.png"]forState:UIControlStateNormal];
        assistantChecked = NO;
        
    }
}


- (void)viewDidLoad {
    NSLog(@"AssistantRegister.m");
    self.view.userInteractionEnabled = YES;
    [super viewDidLoad];
    self.dateofBirthField.placeholder = @"YYYY-DD-MM";
    
    // UIImage *myImage = [UIImage imageNamed:@"home.png"];
    //  UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    
    //  NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    //  self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Register As Assistant";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    // self.navigationController.navigationBar.backgroundColor = [UIColor cyanColor];//[UIColor colorWithRed:120 green:211 blue:199 alpha:1.0];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    
    dateofBirthField.tag = 6;
    
    assistantChecked = NO;
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
    
    //picker
    pickerProfesionArr = [[NSMutableArray alloc] initWithObjects:@"Select Profession",@"nurse",nil];
    
    pickerSpecialityArr = [[NSMutableArray alloc] initWithObjects:@"Gynachologic",@"Pedriatic", nil];
    
    picker = [[UIPickerView alloc] initWithFrame:CGRectMake(20, 450, 300, 200)];
    picker.showsSelectionIndicator = YES;
    picker.hidden = YES;
    picker.delegate = self;
    picker.tag =2;
    [self.view addSubview:picker];
    
    pickerSpeciality = [[UIPickerView alloc] initWithFrame:CGRectMake(20, 450, 300, 200)];
    pickerSpeciality.showsSelectionIndicator = YES;
    pickerSpeciality.hidden = YES;
    pickerSpeciality.delegate = self;
    pickerSpeciality.tag = 3;
    [self.view addSubview:pickerSpeciality];
    
    
    
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
        datePicker.tag = 2;
        datePicker.minimumDate = [NSDate date];
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
    
    NSInteger retval;
    if (pickerView.tag ==2) {
        retval = pickerProfesionArr.count;
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
        str =[NSString stringWithFormat:@"%@",[pickerProfesionArr objectAtIndex:row]];
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
        professionField.text = [NSString stringWithFormat:@"%@",pickerProfesionArr[row]];
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
    
    if ([textField isEqual:professionField]) {
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
        UIView *next = [[textField superview] viewWithTag:textField.tag+1];
        [next becomeFirstResponder];
        //[textField resignFirstResponder];
    }else if (textField.returnKeyType==UIReturnKeyDone) {
        [textField resignFirstResponder];
    }
    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
        NSString *nameRegex = @"[a-z]+";
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
-(BOOL)validateSpeciality:(NSString *) speciality{
    BOOL returnValue = 0;
    if ([speciality isEqualToString:@""]) {
        returnValue =  1;
    }
    else{
        NSString *nameRegex = @"[a-z]+";
        NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
        
        if([nameTest evaluateWithObject:speciality]){
            returnValue = 1;
        }
        else
            returnValue = 0;
    }
    return returnValue;
}
-(BOOL)validateAllFields:(NSString *)name : (NSString *)email : (NSString *)password :(NSString *) mobileNumber : (NSString *)gender : (NSString *)dateOfBirth : (NSString *)location :(NSString *)speciality{
    if ([self validateName:name]
        && [self validateEmail:email]
        && [self validatePassword:password]
        && [self validateMobileNumber:mobileNumber]
        && [self validateGender:gender]
        && [self validateDOB:dateOfBirth]
        && [self validateLocation:location]
        && [self validateSpeciality:speciality]) {
        return 1;
    }
    else{
        return 0;
    }
}
-(void)callValidateAllFields{
    
    if([self validateAllFields:nameField.text
                              :emailField.text
                              :passwordField.text
                              :mobileField.text
                              :genderField.text
                              :dateofBirthField.text
                              :locationField.text
                              :specializationField.text]){
        NSLog(@"Sending data to next vc");
        NSArray *objects=[[NSArray alloc]initWithObjects:
                          nameField.text,
                          emailField.text,
                          passwordField.text,
                          mobileField.text,
                          genderField.text,
                          dateofBirthField.text,
                          locationField.text,
                          specializationField.text,
                          @"",
                          @"",
                          @"",
                          nil];
        NSArray *keys=[[NSArray alloc]initWithObjects:
                       @"name",
                       @"emailID",
                       @"password",
                       @"mobileNumber",
                       @"gender",
                       @"dateOfBirth",
                       @"location",
                       @"speciality",
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
- (IBAction)addLocation:(id)sender {
}
- (IBAction)manage:(id)sender {
}
- (IBAction)readTermsConditions:(id)sender {
}
- (IBAction)next:(id)sender {
}
@end


