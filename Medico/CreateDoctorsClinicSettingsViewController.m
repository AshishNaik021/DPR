//
//  CreateDoctorsClinicSettingsViewController.m
//  Medico
//
//  Created by APPLE on 15/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "CreateDoctorsClinicSettingsViewController.h"
#import "AddSlotsForDoctorClinicSettingViewController.h"
#import "DoctorLandingPageView.h"
#import "PatientLandingPageViewController.h"

@interface CreateDoctorsClinicSettingsViewController ()

@end

@implementation CreateDoctorsClinicSettingsViewController

@synthesize  keyboardVisible;
@synthesize offset;
@synthesize height;
@synthesize width;
@synthesize screen;
@synthesize scrollHeight;
@synthesize scroll;

@synthesize createClinicButton;
@synthesize createClinicNameField;
@synthesize createEmailField;
@synthesize createLandLineField;
@synthesize createLocationTextView;
@synthesize createMobileField;
@synthesize createSlotTextView;
@synthesize alwaysButton;
@synthesize exceptCurrentDayButton;
@synthesize exceptCurrentSlotButton;
@synthesize confirmByDoctorButton;
@synthesize createSpecialtyTextView;
@synthesize exceptDayRadioButton;
@synthesize exceptSlotRadioButton;
@synthesize alwaysRadioButton;
@synthesize confirmDoctorRadioButton;
@synthesize appointment;
@synthesize returnStringClinic;
@synthesize dict;
@synthesize emailid;
@synthesize returnStringSlot;
@synthesize clinicFlag;
@synthesize slotFlag;
@synthesize returnArr;
@synthesize passDictionaryForSlots = _passDictionaryForSlots;
@synthesize passString = _passString;




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

- (void) homePage:(id)sender{
//    DoctorLandingPageView *DoctorHome =
//    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
//    [self.navigationController pushViewController:DoctorHome animated:YES];
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
    NSLog(@"CreateDoctorsClinicSettingsViewController.m");
    [super viewDidLoad];
    
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

    UIImage *myImage = [UIImage imageNamed:@"ic_home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    self.navigationItem.title = @"Add New Clinics";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];

    
    [createSpecialtyTextView.layer setBorderWidth:1.0];
    [createLocationTextView.layer setBorderWidth:1.0];
    [createSlotTextView.layer setBorderWidth:1.0];
    
    clinicFlag = NO;
    slotFlag = NO;
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addSlots:)];
    
    [createSlotTextView addGestureRecognizer:gestureRecognizer];
    
    exceptSlotRadioButton = NO;
    exceptDayRadioButton = NO;
    alwaysRadioButton = NO;
    confirmDoctorRadioButton = NO;
    
    
    
    emailid = [[NSUserDefaults standardUserDefaults] objectForKey:@"loggedInEmail"];
    NSLog(@"email id for logged in user...%@",emailid);
    // Do any additional setup after loading the view.
   
     returnArr = [_passDictionaryForSlots valueForKeyPath:@"schedules"];
    if (returnArr.count == 0) {
        createSlotTextView.text = @"To Add Slots, Click Here!";
    }
    else{
        createSlotTextView.text = @"Slots are added. To change the slots, Click again!";
            }
    NSLog(@"my checking arrr========%@",returnArr);

    //NSLog(@"checking value for particular key........%@",[[checkArr objectAtIndex:0] objectForKey:@"day"]);
       if (_passString) {
        
           NSArray *a = _passString;
           NSLog(@"aaaaaaaaaaaaaaaaaaaaaaaa%@",a);
    NSDictionary *slotDict = [[NSDictionary alloc]init];
    
    slotDict = @{@"clinicId" : @"9",
                 @"doctorId" : emailid,
                 @"schedules" : a};
    
    NSLog(@"my slotDict-----------%@",slotDict);
    
    }
    
    
    
    
    
    
    
    
    
    
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

-(void)errorMessageLandlineNumberNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid Phone Number." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateLandlineNumber:(NSString *) landlineNumber{
    NSString *nameRegex = @"[0-9]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    
    if(![nameTest evaluateWithObject:landlineNumber]){
        [self errorMessageMobileNumberNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessageLocationNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter the location name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateLocation:(NSString *) location{
    
    NSString *nameRegex = @"[a-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:location]){
        [self errorMessageLocationNotValid];
        return 0;
    }
    else
        return 1;
}

-(void)errorMessaggeSpecialityNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter the Speciality." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateSpeciality:(NSString *) speciality{
    
    NSString *nameRegex = @"[a-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:speciality]){
        [self errorMessaggeSpecialityNotValid];
        return 0;
    }
    else
        return 1;
}



-(void)errorMessageOnlineAppointmentNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter valid name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(BOOL)validateOnlineAppointment:(NSString *) name{
    
    NSString *nameRegex = @"[a-z]+";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES [c]%@", nameRegex];
    
    if(![nameTest evaluateWithObject:name]){
        [self errorMessageNameNotValid];
        return 0;
    }
    else
        return 1;
}


-(BOOL)validateAllFields:(NSString *)name : (NSString *)email : (NSString *)mobile :(NSString *) landline : (NSString *)location :(NSString *)speciality{
    if ([self validateName:name]
        && [self validateEmail:email]
        && [self validateMobileNumber:mobile]
        && [self validateLocation:location]
        && [self validateSpeciality:speciality]
        && [self validateLandlineNumber:landline]) {
        return 1;
    }
    else{
        return 0;
    }
    
}



-(void)callValidateAllFields{
    
    if([self validateAllFields:createClinicNameField.text
                              :createEmailField.text
                              :createMobileField.text
                              :createLandLineField.text
                              :createLocationTextView.text
                              :createSpecialtyTextView.text]){
        NSLog(@"Sending data to next vc");
        NSArray *objects=[[NSArray alloc]initWithObjects:
                          createClinicNameField.text,
                          createEmailField.text,
                          createMobileField.text,
                          createLandLineField.text,
                          createLocationTextView.text,
                          createSpecialtyTextView.text,
                          appointment,
                          emailid,
                          @"false",
                          @"null",
                          nil];
        NSArray *keys=[[NSArray alloc]initWithObjects:
                       @"clinicName",
                       @"email",
                       @"mobileNumber",
                       @"landLineNumber",
                       @"location",
                       @"speciality",
                       @"onlineAppointment",
                       @"doctorId",
                       @"selected",
                       @"parameter",
                       nil];
        
        dict = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        
        NSLog(@"The data in the dictionary is************************%@",dict);
        
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                           options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                             error:&error];
        
        if (! jsonData) {
            NSLog(@"Got an error: %@", error);
        } else {
            NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            NSLog(@"jsonstring %@",jsonString);
            
           // [self addClinic];
        }
        
        /*   SMSConfirmationView *viewController =
         [self.storyboard instantiateViewControllerWithIdentifier:@"SMSConfirmationView"];
         viewController.data = dict;
         NSLog(@"is dic copied? %@",viewController.data);
         [self.navigationController pushViewController:viewController animated:YES];*/
    }
    else {
        NSLog(@"Data invalid");
    }
}

-(void)callAddSlotsForClinic :(NSString *)clinicId{
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSString *clinicAdded = clinicId;
    
    
    NSURL * url = [NSURL URLWithString:@"http://139.162.31.36:9000/saveDoctorClinicScheduleTime"];
    
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    //returnArray
    //clinicAdded
    //emailid
    NSDictionary *slotDict = [[NSDictionary alloc]init];
    
    slotDict = @{@"clinicId" : clinicAdded,
                 @"doctorId" : emailid,
                 @"schedules" : returnArr};
    
    NSLog(@"my slotDict-----------%@",slotDict);
    
    NSString *params = [NSString stringWithFormat:@"\{\"clinicId\":\"%@\",\"doctorId\":\"%@\",\"schedules\":\"%@\"}",[slotDict objectForKey:@"clinicId"],[slotDict objectForKey:@"doctorId"],[slotDict objectForKey:@"schedules"]];
    
    NSLog(@"params %@",params);
   [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                                       completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                           NSLog(@"Response:%@ Error : %@\n", response, error);
                                                           //NSLog(@"Response Code:%@",[response valueForKey:@"status code"]);
                                                           if(error == nil)
                                                           {
                                                               returnStringSlot = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                                               NSLog(@"Poonam Data = %@",returnStringSlot);
                                                               NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                               NSLog(@"response status code: %ld", (long)[httpResponse statusCode]);
                                                               if ([httpResponse statusCode] == 200) {
                                                                   
                                                                   [self parseJSONForSlot:returnStringSlot];
                                                                   
                                                               } else {
                                                                   //[self reportError:[httpResponse statusCode]];
                                                                   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                                                                                   message:@"An error occured. Please try again later."
                                                                                                                  delegate:self
                                                                                                         cancelButtonTitle:@"OK"
                                                                                                         otherButtonTitles:nil];
                                                                   [alert show];
                                                                   
                                                               }
                                                           }
                                                           else{
                                                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                                                                               message:@"An error occured. Please try again later."
                                                                                                              delegate:self
                                                                                                     cancelButtonTitle:@"OK"
                                                                                                     otherButtonTitles:nil];
                                                               [alert show];
                                                           }
                                                           
                                                       }];
    [dataTask resume];

}

-(void)parseJSONForSlot : (NSString *)responseData{
    NSString * jsonString = responseData;
    //NSStringEncoding  encoding;
    NSData * jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError * error=nil;
    NSDictionary * parsedData = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    NSLog(@"NSDictionery:%@",parsedData);
    NSString *code = [NSString stringWithFormat:@"%@",[parsedData valueForKey:@"code"]];
    NSString *message = [NSString stringWithFormat:@"%@",[parsedData valueForKey:@"message"]];
    NSLog(@"code:%@",[parsedData valueForKey:@"code"]);
    NSLog(@"message:%@",[parsedData valueForKey:@"message"]);
}

-(void)parseJSONForClinic : (NSString *)responseData{
    NSString * jsonString = responseData;
    NSLog(@"responseData %@",responseData);
    NSLog(@"jsonString %@",jsonString);
    if ([jsonString intValue]) {
        
        [self callAddSlotsForClinic:jsonString];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Successful!" message:@"Successfully Registered." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        alert.tag = 200;
        [alert show];
    }
    else{
        //NSStringEncoding  encoding;
        NSData * jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSError * error=nil;
        NSDictionary * parsedData = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
        NSLog(@"NSDictionery:%@",parsedData);
        /*  NSString *message = [NSString stringWithFormat:[parsedData valueForKey:@"message"]];
         //NSLog(@"userType:%@",[parsedData valueForKey:@"type"]);
         if ([message isEqualToString:@"User Already Exist!"]) {
         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!"
         message:@"User already exists. Please try to Login!"
         delegate:self
         cancelButtonTitle:@"OK"
         otherButtonTitles:nil]; */
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!"
                                                        message:@"Try again later!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        alert.tag = 201;
        [alert show];
        
        
        //    else if ([userType isEqualToString:@"Patient"]){
        //        PatientLandingPageView *patientHome =
        //        [self.storyboard instantiateViewControllerWithIdentifier:@"PatientHome"];
        //        [self.navigationController pushViewController:patientHome animated:YES];
        //    }
        //    else {
        //        AssistantLandingPageView *assistantHome =
        //        [self.storyboard instantiateViewControllerWithIdentifier:@"AssistantHome"];
        //        [self.navigationController pushViewController:assistantHome animated:YES];
        //    }
    }
}

-(void)addClinic{
    //returnString = @"";
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    
    NSURL * url = [NSURL URLWithString:@"http://139.162.31.36:9000/addClinic"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    // NSString * params =[NSString stringWithFormat:@"\{\"bloodGroup\":\"%@\",\"cloudLoginId\":\"\",\"cloudLoginPassword\":\"\",\"cloudType\":\"3\",\"dateOfBirth\":\"%@\",\"emailID\":\"%@\",\"gender\":\"%@\",\"location\":\"%@\",\"mobileNumber\":\"%@\",\"name\":\"%@\",\"password\":\"%@\",\"speciality\":\"%@\"}",[_data objectForKey:@"bloodGroup"],[_data objectForKey:@"dateOfBirth"],[_data objectForKey:@"emailID"],[_data objectForKey:@"gender"],[_data objectForKey:@"location"],[_data objectForKey:@"mobileNumber"],[_data objectForKey:@"name"],[_data objectForKey:@"password"],[_data objectForKey:@"speciality"]];
    
    NSString *params = [NSString stringWithFormat:@"\{\"clinicName\":\"%@\",\"email\":\"%@\",\"mobileNumber\":\"%@\",\"landLineNumber\":\"%@\",\"location\":\"%@\",\"speciality\":\"%@\",\"onlineAppointment\":\"%@\",\"selected\":\"%@\",\"doctorId\":\"%@\",\"parameter\":\"%@\"}",[dict objectForKey:@"clinicName"],[dict objectForKey:@"email"],[dict objectForKey:@"mobileNumber"],[dict objectForKey:@"landLineNumber"],[dict objectForKey:@"location"],[dict objectForKey:@"speciality"],[dict objectForKey:@"onlineAppointment"],[dict objectForKey:@"selected"],[dict objectForKey:@"doctorId"],[dict objectForKey:@"parameter"]];
    
    NSLog(@"params %@",params);
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                                       completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                           NSLog(@"Response:%@ Error : %@\n", response, error);
                                                           //NSLog(@"Response Code:%@",[response valueForKey:@"status code"]);
                                                           if(error == nil)
                                                           {
                                                               returnStringClinic = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                                               NSLog(@"Poonam Data = %@",returnStringClinic);
                                                               NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                               NSLog(@"response status code: %ld", (long)[httpResponse statusCode]);
                                                               if ([httpResponse statusCode] == 200) {

                                                                [self parseJSONForClinic:returnStringClinic];
                                                                   
                                                               } else {
                                                                   //[self reportError:[httpResponse statusCode]];
                                                                   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                                                                                   message:@"An error occured. Please try again later."
                                                                                                                  delegate:self
                                                                                                         cancelButtonTitle:@"OK"
                                                                                                         otherButtonTitles:nil];
                                                                   [alert show];
                                                                   
                                                               }
                                                           }
                                                           else{
                                                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                                                                               message:@"An error occured. Please try again later."
                                                                                                              delegate:self
                                                                                                     cancelButtonTitle:@"OK"
                                                                                                     otherButtonTitles:nil];
                                                               [alert show];
                                                           }
                                                           
                                                       }];
    [dataTask resume];
    
}

//Return String....

-(void)errorMessaggeRadioBox{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning!" message:@"Please select slot for Clinic." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
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

- (IBAction)always:(id)sender {
    if (!alwaysRadioButton) {
        [alwaysButton setImage:[UIImage imageNamed:@"ic_radio_button_checked.png"]forState:UIControlStateNormal];
        alwaysRadioButton = YES;
        [exceptCurrentSlotButton setImage:[UIImage imageNamed:@"ic_radio_button_unchecked.png"]forState:UIControlStateNormal];
        [exceptCurrentDayButton setImage:[UIImage imageNamed:@"ic_radio_button_unchecked.png"]forState:UIControlStateNormal];
        [confirmByDoctorButton setImage:[UIImage imageNamed:@"ic_radio_button_unchecked.png"]forState:UIControlStateNormal];
        exceptDayRadioButton = NO;
        exceptSlotRadioButton = NO;
        confirmDoctorRadioButton = NO;
        appointment =@"Always";
    }
}

- (IBAction)exceptCurrentSlot:(id)sender {
    if (!exceptSlotRadioButton) {
        [exceptCurrentSlotButton setImage:[UIImage imageNamed:@"ic_radio_button_checked.png"]forState:UIControlStateNormal];
        exceptSlotRadioButton = YES;
        
        [exceptCurrentDayButton setImage:[UIImage imageNamed:@"ic_radio_button_unchecked.png"]forState:UIControlStateNormal];
        [alwaysButton setImage:[UIImage imageNamed:@"ic_radio_button_unchecked.png"]forState:UIControlStateNormal];
        [confirmByDoctorButton setImage:[UIImage imageNamed:@"ic_radio_button_unchecked.png"]forState:UIControlStateNormal];
        exceptDayRadioButton = NO;
        alwaysRadioButton = NO;
        confirmDoctorRadioButton = NO;
        appointment =@"Always Except Current Slot";
        
    }
    
}

- (IBAction)exceptCurrentDay:(id)sender {
    if (!exceptDayRadioButton) {
        [exceptCurrentDayButton setImage:[UIImage imageNamed:@"ic_radio_button_checked.png"]forState:UIControlStateNormal];
        exceptDayRadioButton = YES;
        
        
        [exceptCurrentSlotButton setImage:[UIImage imageNamed:@"ic_radio_button_unchecked.png"]forState:UIControlStateNormal];
        [alwaysButton setImage:[UIImage imageNamed:@"ic_radio_button_unchecked.png"]forState:UIControlStateNormal];
        [confirmByDoctorButton setImage:[UIImage imageNamed:@"ic_radio_button_unchecked.png"]forState:UIControlStateNormal];
        exceptSlotRadioButton = NO;
        alwaysRadioButton = NO;
        confirmDoctorRadioButton = NO;
        appointment = @"Always except Day Slot";
    }
    
}

- (IBAction)confirmByDoctor:(id)sender {
    if (!confirmDoctorRadioButton) {
        [confirmByDoctorButton setImage:[UIImage imageNamed:@"ic_radio_button_checked.png"]forState:UIControlStateNormal];
        confirmDoctorRadioButton = YES;
        
        [exceptCurrentSlotButton setImage:[UIImage imageNamed:@"ic_radio_button_unchecked.png"]forState:UIControlStateNormal];
        [exceptCurrentDayButton setImage:[UIImage imageNamed:@"ic_radio_button_unchecked.png"]forState:UIControlStateNormal];
        [alwaysButton setImage:[UIImage imageNamed:@"ic_radio_button_unchecked.png"]forState:UIControlStateNormal];
        exceptDayRadioButton = NO;
        exceptSlotRadioButton = NO;
        alwaysRadioButton = NO;
        appointment = @"Always Confirm By Doctor";
    }
    
    
}
- (IBAction)createClinic:(id)sender {
    if ([createClinicNameField.text isEqualToString:@""]
        && [createEmailField.text isEqualToString:@""]
        && [createMobileField.text isEqualToString:@""]
        && [createLandLineField.text isEqualToString:@""]
        && [createLocationTextView.text isEqualToString:@""]
        && [createSpecialtyTextView.text isEqualToString:@""]) {
        NSLog(@"All Empty");
        [self errorAllFieldsMandatory];
    }
    else{
        if (alwaysRadioButton || exceptDayRadioButton || exceptSlotRadioButton || confirmDoctorRadioButton) {
            NSLog(@"Checked and calling func");
            [self callValidateAllFields];
        }
        else{
            NSLog(@"Check button");
            [self errorMessaggeRadioBox];
        }
    }
    
}
- (IBAction)addSlots:(id)sender {
    AddSlotsForDoctorClinicSettingViewController *slots =
    [self.storyboard instantiateViewControllerWithIdentifier:@"AddSlotsForDoctorClinicSettingViewController"];
    
    [self.navigationController pushViewController:slots animated:YES];
}
@end
