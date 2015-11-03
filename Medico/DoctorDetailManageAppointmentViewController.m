//
//  DoctorDetailManageAppointmentViewController.m
//  Medico
//
//  Created by APPLE on 21/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DoctorDetailManageAppointmentViewController.h"
#import "DoctorLandingPageView.h"
#import "DoctorManageAppointmentsViewController.h"

@interface DoctorDetailManageAppointmentViewController ()

@end

@implementation DoctorDetailManageAppointmentViewController
@synthesize passDataArr = _passDataArr;
@synthesize passDataDict = _passDataDict;

@synthesize clinicNameLabel;
@synthesize slot1AppLabel;
@synthesize slot1totalAppButton;
@synthesize slot2AppLabel;
@synthesize slot2TotalAppButton;
@synthesize slot3AppLabel;
@synthesize slot3TotalAppButton;
@synthesize detailAppArr;
@synthesize detailSlot1 = _detailSlot1;
@synthesize detailSlot2 = _detailSlot2;
@synthesize detailSlot3 = _detailSlot3;
@synthesize profileContentView;
@synthesize profileTabButton;
@synthesize appointmentContentView;
@synthesize appointmentTabButton;
@synthesize slot1DaysLabel;
@synthesize slot1TimeLabel;
@synthesize slot1AppButton;
@synthesize slot2AppButton;
@synthesize slot2DaysLabel;
@synthesize slot2TimeLabel;
@synthesize slot3AppButton;
@synthesize slot3DaysLabel;
@synthesize slot3TimeLabel;
@synthesize addressTextView;
@synthesize profileAssistantField;
@synthesize profileEmailField;
@synthesize profileLandlineField;
@synthesize profileLocationField;
@synthesize profilePracticeNameField;
@synthesize profileServicesTextView;
@synthesize clinicName = _clinicName;
@synthesize clinicJson;
@synthesize mobile;
@synthesize totalAppointmentButton;



- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}

-(void)fetchCliniProfile{
    NSLog(@"-------------------------------------------------------");
    NSLog(@"The fetchJson method is called.........");
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSLog(@"email id for logged in user...%@",_clinicName);
    
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/searchClinic?clinicName=%@",_clinicName];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
  //  NSLog(@"Data from web Service in responceStr------%@",responseStr);
    /* ---------- Code for Writing response data into the file -------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/searchClinic.json"];
    NSLog(@"%@",docPath);
    [responseStr writeToFile:docPath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
    
    /* ---------- End of Code for Writing response data into the file -------------- */

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    clinicNameLabel.text = [_passDataArr valueForKey:@"clinicName"];
    _clinicName = [_passDataArr valueForKey:@"clinicName"];
    NSLog(@"name Of Clinic:---------------%@",[_passDataArr valueForKey:@"totalAppointmentCount"]);
    
    if (![[_passDataArr valueForKey:@"totalAppointmentCount"] isEqual:[NSNull null]]) {
            [totalAppointmentButton setTitle:[NSString stringWithFormat:@"%@",[_passDataArr valueForKey:@"totalAppointmentCount"]] forState:UIControlStateNormal];
        
    }
    else
    {
        [totalAppointmentButton setTitle:@"0" forState:UIControlStateNormal];
    }

    
    
    
    [self fetchCliniProfile];
    /* ----------------- Read File For Parse JSON Data -------------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/searchClinic.json"];
    NSLog(@"%@",docPath);
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:docPath encoding:NSUTF8StringEncoding error:NULL];
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    NSError *e;
    clinicJson = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&e];
    
    NSLog(@"CliniJson------------%@",clinicJson);
    
    NSLog(@"Count for the array--------%lu",(unsigned long)clinicJson.count);
    
    int n = clinicJson.count;
    
    if (n > 1) {
        NSLog(@"More than 1 array object.....");
        NSLog(@"%@",clinicJson[0]);
       // [profileEmailField setText:@"value"];
   /*    if (![[[clinicJson objectAtIndex:0] objectForKey:@"email"] isEqual:[NSNull null]]){

           [profileEmailField setText:[[clinicJson objectAtIndex:0] objectForKey:@"email"]];
        }
        else{
            [profileEmailField setText:@""];
        }
        if (![[[clinicJson objectAtIndex:0] objectForKey:@"landLineNumber"] isEqual:[NSNull null]]){
            
            profileLandlineField.text = [NSString stringWithFormat:@"%@",[[clinicJson objectAtIndex:0] objectForKey:@"landLineNumber"]];
            NSLog(@"%@",profileLandlineField.text);
        }
        else{
            [profileLandlineField setText:@""];
        }
        
        if (![[[clinicJson objectAtIndex:0] objectForKey:@"mobileNumber"] isEqual:[NSNull null]]){
            
            [profileMobileField setText:[NSString stringWithFormat:@"%@",[[clinicJson objectAtIndex:0] objectForKey:@"mobileNumber"]]];
            NSLog(@"%@",profileMobileField.text);

        }
        else{
            [profileMobileField setText:@""];
        }
        
        if (![[[clinicJson objectAtIndex:0] objectForKey:@"location"] isEqual:[NSNull null]]){
            
            [profileLocationField setText:[NSString stringWithFormat:@"%@",[[clinicJson objectAtIndex:0] objectForKey:@"location"]]];
        }
        else{
            [profileLocationField setText:@""];
        }
        
        if (![[[clinicJson objectAtIndex:0] objectForKey:@"address"] isEqual:[NSNull null]]){
           
            [addressTextView setText:[NSString stringWithFormat:@"%@",[[clinicJson objectAtIndex:0] objectForKey:@"address"]]];
        }
        else{
            [profileMobileField setText:@""];
        }
        
        if (![[[clinicJson objectAtIndex:0] objectForKey:@"speciality"] isEqual:[NSNull null]]){
            
            [profileServicesTextView setText:[NSString stringWithFormat:@"%@",[[clinicJson objectAtIndex:0] objectForKey:@"speciality"]]];
        }
        else{
            [profileServicesTextView setText:@""];
        }
        */
      
        
    }

    else{
        NSLog(@"array contains only one object....");
        NSLog(@"%@",clinicJson[0]);
     /*   if (![[[clinicJson objectAtIndex:0] objectForKey:@"email"] isEqual:[NSNull null]]){
            
            [profileEmailField setText:[[clinicJson objectAtIndex:0] objectForKey:@"email"]];
        }
        else{
            [profileEmailField setText:@""];
        }

        if (![[[clinicJson objectAtIndex:0] objectForKey:@"landLineNumber"] isEqual:[NSNull null]]){
            
            [profileLandlineField setText:[NSString stringWithFormat:@"%@",[[clinicJson objectAtIndex:0] objectForKey:@"landLineNumber"]]];
        }
        else{
            [profileLandlineField setText:@""];
        }
        if (![[[clinicJson objectAtIndex:0] objectForKey:@"mobileNumber"] isEqual:[NSNull null]]){
            
            [profileMobileField setText:[NSString stringWithFormat:@"%@",[[clinicJson objectAtIndex:0] objectForKey:@"mobileNumber"]]];
        }
        else{
            [profileMobileField setText:@""];
        }
        
        if (![[[clinicJson objectAtIndex:0] objectForKey:@"location"] isEqual:[NSNull null]]){
            
            [profileLocationField setText:[NSString stringWithFormat:@"%@",[[clinicJson objectAtIndex:0] objectForKey:@"location"]]];
        }
        else{
            [profileLocationField setText:@""];
        }
        
        if (![[[clinicJson objectAtIndex:0] objectForKey:@"address"] isEqual:[NSNull null]]){
            
            [addressTextView setText:[NSString stringWithFormat:@"%@",[[clinicJson objectAtIndex:0] objectForKey:@"address"]]];
        }
        else{
            [profileMobileField setText:@""];
        }
        
        if (![[[clinicJson objectAtIndex:0] objectForKey:@"speciality"] isEqual:[NSNull null]]){
            
            [profileServicesTextView setText:[NSString stringWithFormat:@"%@",[[clinicJson objectAtIndex:0] objectForKey:@"speciality"]]];
        }
        else{
            [profileServicesTextView setText:@""];
        }
        */

    }
    
    
    
    
    
    if (![_detailSlot1 isEqual:[NSNull null]]) {
        if (![[_detailSlot1 valueForKey:@"shiftTime"] isEqual:[NSNull null]]) {
            slot1AppLabel.text = [_detailSlot1 valueForKey:@"shiftTime"];
        }
    }
    else
    {
        slot1AppLabel.text = @"";
    }
    
    if (![_detailSlot2 isEqual:[NSNull null]]) {
        if (![[_detailSlot2 valueForKey:@"shiftTime"] isEqual:[NSNull null]]) {
            slot2AppLabel.text = [_detailSlot2 valueForKey:@"shiftTime"];
        }
    }
    else
    {
        slot2AppLabel.text = @"";
    }
    
    if (![_detailSlot3 isEqual:[NSNull null]]) {
        if (![[_detailSlot3 valueForKey:@"shiftTime"] isEqual:[NSNull null]]) {
            slot3AppLabel.text = [_detailSlot3 valueForKey:@"shiftTime"];
        }
    }
    else
    {
        slot3AppLabel.text = @"";
    }
    
    if (![_detailSlot1 isEqual:[NSNull null]]) {
        if (![[_detailSlot1 valueForKey:@"days"] isEqual:[NSNull null]]) {
            slot1DaysLabel.text = [_detailSlot1 valueForKey:@"days"];
        }
    }
    else
    {
        slot1DaysLabel.text = @"Not Available!";
    }
    
    if (![_detailSlot2 isEqual:[NSNull null]]) {
        if (![[_detailSlot2 valueForKey:@"days"] isEqual:[NSNull null]]) {
            slot2DaysLabel.text = [_detailSlot2 valueForKey:@"days"];
        }
    }
    else
    {
        slot2DaysLabel.text = @"Not Available!";
    }
    
    if (![_detailSlot3 isEqual:[NSNull null]]) {
        if (![[_detailSlot3 valueForKey:@"days"] isEqual:[NSNull null]]) {
            slot3DaysLabel.text = [_detailSlot3 valueForKey:@"days"];
        }
    }
    else
    {
        slot3DaysLabel.text = @"Not Available!";
    }
    
    
    
    

    if (![_detailSlot1 isEqual:[NSNull null]]) {
        if (![[_detailSlot1 valueForKey:@"shiftTime"] isEqual:[NSNull null]]) {
            slot1TimeLabel.text = [_detailSlot1 valueForKey:@"shiftTime"];
        }
    }
    else
    {
        slot1TimeLabel.text = @"";
    }
    
    if (![_detailSlot2 isEqual:[NSNull null]]) {
        if (![[_detailSlot2 valueForKey:@"shiftTime"] isEqual:[NSNull null]]) {
            slot2TimeLabel.text = [_detailSlot2 valueForKey:@"shiftTime"];
        }
    }
    else
    {
        slot2TimeLabel.text = @"";
    }
    
    
    if (![_detailSlot3 isEqual:[NSNull null]]) {
        if (![[_detailSlot3 valueForKey:@"shiftTime"] isEqual:[NSNull null]]) {
            slot3TimeLabel.text = [_detailSlot3 valueForKey:@"shiftTime"];
        }
    }
    else
    {
        slot3TimeLabel.text = @"";
    }

    
   // slot1AppLabel.text = [_detailSlot1[0] objectForKey:@"shiftTime"];
   // slot2AppLabel.text = [_detailSlot2[0] objectForKey:@"shiftTime"];
   //  slot3AppLabel.text = [_detailSlot3[0] objectForKey:@"shiftTime"];
    
  
    if (![_detailSlot1 isEqual:[NSNull null]]) {
        if (![[_detailSlot1 valueForKey:@"appointmentCount"] isEqual:[NSNull null]]) {
            [slot1totalAppButton setTitle:[NSString stringWithFormat:@"%@",[_detailSlot1 valueForKey:@"appointmentCount"]] forState:UIControlStateNormal];
        }
    }
    else
    {
        [slot1totalAppButton setTitle:@"" forState:UIControlStateNormal];
    }
    
    if (![_detailSlot2 isEqual:[NSNull null]]) {
        if (![[_detailSlot2 valueForKey:@"appointmentCount"] isEqual:[NSNull null]]) {
            [slot2TotalAppButton setTitle:[NSString stringWithFormat:@"%@",[_detailSlot2 valueForKey:@"appointmentCount"]] forState:UIControlStateNormal];
        }
    }
    else
    {
        [slot2TotalAppButton setTitle:@"" forState:UIControlStateNormal];
    }
    
    if (![_detailSlot3 isEqual:[NSNull null]]) {
        if (![[_detailSlot3 valueForKey:@"appointmentCount"] isEqual:[NSNull null]]) {
            [slot3TotalAppButton setTitle:[NSString stringWithFormat:@"%@",[_detailSlot3 valueForKey:@"appointmentCount"]] forState:UIControlStateNormal];
        }
    }
    else
    {
        [slot3TotalAppButton setTitle:@"" forState:UIControlStateNormal];
    }
    
    
    
    
    if (![_detailSlot1 isEqual:[NSNull null]]) {
        if (![[_detailSlot1 valueForKey:@"appointmentCount"] isEqual:[NSNull null]]) {
            [slot1AppButton setTitle:[NSString stringWithFormat:@"%@",[_detailSlot1 valueForKey:@"appointmentCount"]] forState:UIControlStateNormal];
        }
    }
    else
    {
        [slot1AppButton setTitle:@"" forState:UIControlStateNormal];
    }

    if (![_detailSlot2 isEqual:[NSNull null]]) {
        if (![[_detailSlot2 valueForKey:@"appointmentCount"] isEqual:[NSNull null]]) {
            [slot2AppButton setTitle:[NSString stringWithFormat:@"%@",[_detailSlot2 valueForKey:@"appointmentCount"]] forState:UIControlStateNormal];
        }
    }
    else
    {
        [slot2AppButton setTitle:@"" forState:UIControlStateNormal];
    }
    if (![_detailSlot3 isEqual:[NSNull null]]) {
        if (![[_detailSlot3 valueForKey:@"appointmentCount"] isEqual:[NSNull null]]) {
            [slot3AppButton setTitle:[NSString stringWithFormat:@"%@",[_detailSlot3 valueForKey:@"appointmentCount"]] forState:UIControlStateNormal];
        }
    }
    else
    {
        [slot3AppButton setTitle:@"" forState:UIControlStateNormal];
    }


    
    //[slot1totalAppButton setTitle:[_detailSlot1[0] objectForKey:@"appointmentCount"] forState:UIControlStateNormal];
   // [slot2TotalAppButton setTitle:[_detailSlot2[0] objectForKey:@"appointmentCount"] forState:UIControlStateNormal];
  //  [slot3TotalAppButton setTitle:[_detailSlot3[0] objectForKey:@"appointmentCount"] forState:UIControlStateNormal];

    profileContentView.hidden = TRUE;
    appointmentContentView.hidden = FALSE;
    self.appointmentTabButton.titleLabel.textColor = [UIColor blackColor];
    [self.appointmentTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Manage Appointments";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    [profileServicesTextView.layer setBorderWidth:1.0];
    [addressTextView.layer setBorderWidth:1.0];


    

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

- (IBAction)profileTab:(id)sender {
    self.profileContentView.hidden = FALSE;
    self.appointmentContentView.hidden = TRUE;
    [self.profileTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.appointmentTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    if (![[[clinicJson objectAtIndex:0] objectForKey:@"email"] isEqual:[NSNull null]]){
        
        [profileEmailField setText:[[clinicJson objectAtIndex:0] objectForKey:@"email"]];
    }
    else{
        [profileEmailField setText:@"Unknown"];
    }
    
    if (![[[clinicJson objectAtIndex:0] objectForKey:@"landLineNumber"] isEqual:[NSNull null]]){
        
        profileLandlineField.text = [NSString stringWithFormat:@"%@",[[clinicJson objectAtIndex:0] objectForKey:@"landLineNumber"]];
        NSLog(@"%@",profileLandlineField.text);
    }
    else{
        [profileLandlineField setText:@"Unknown"];
    }
    
    if (![[[clinicJson objectAtIndex:0] objectForKey:@"mobileNumber"] isEqual:[NSNull null]]){
        
        mobile.text = [NSString stringWithFormat:@"%@",[[clinicJson objectAtIndex:0] objectForKey:@"mobileNumber"]];
        NSLog(@"%@",mobile.text);
    }
    else{
        [mobile setText:@"Unknown"];
    }
    
    if (![[[clinicJson objectAtIndex:0] objectForKey:@"location"] isEqual:[NSNull null]]){
        
        [profileLocationField setText:[NSString stringWithFormat:@"%@",[[clinicJson objectAtIndex:0] objectForKey:@"location"]]];
    }
    else{
        [profileLocationField setText:@"Unknown"];
    }
    
    if (![[[clinicJson objectAtIndex:0] objectForKey:@"address"] isEqual:[NSNull null]]){
        
        [addressTextView setText:[NSString stringWithFormat:@"%@",[[clinicJson objectAtIndex:0] objectForKey:@"address"]]];
    }
    else{
        [addressTextView setText:@"Unknown"];
    }
    
    if (![[[clinicJson objectAtIndex:0] objectForKey:@"speciality"] isEqual:[NSNull null]]){
        
        [profileServicesTextView setText:[NSString stringWithFormat:@"%@",[[clinicJson objectAtIndex:0] objectForKey:@"speciality"]]];
    }
    else{
        [profileServicesTextView setText:@"Unknown"];
    }

    
    
}
- (IBAction)appointmentTab:(id)sender {
    self.appointmentContentView.hidden = FALSE;
    self.profileContentView.hidden = TRUE;
    [self.profileTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [self.appointmentTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    

}
- (IBAction)hideDetails:(id)sender {
    DoctorManageAppointmentsViewController *manageApp =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorManageAppointmentsViewController"];
    [self.navigationController pushViewController:manageApp animated:YES];
}
- (IBAction)slot1TotalApp:(id)sender {
}
- (IBAction)slot2TotalApp:(id)sender {
}
- (IBAction)slot3TotalApp:(id)sender {
}
- (IBAction)totalAppointment:(id)sender {
}
@end
