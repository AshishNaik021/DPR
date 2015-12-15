//
//  DetailPatientProfileViewController.m
//  Medico
//
//  Created by APPLE on 10/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DetailPatientProfileViewController.h"
#import "DoctorLandingPageView.h"
#import "DetailPatientProfileCell.h"
#import "PatientProfileViewController.h"
#import "PatientAppointmentsForDoctorViewController.h"
#import "LastVisitedConsultationViewController.h"

@interface DetailPatientProfileViewController ()

@end

@implementation DetailPatientProfileViewController
@synthesize jsonList;
@synthesize arrayList1;
@synthesize arrayList2;
@synthesize arrayList3;
@synthesize passPatientData = _passPatientData;
@synthesize emailField;
@synthesize allergicTextView;
@synthesize lastVisitedField;
@synthesize locationField;
@synthesize mobileField;
@synthesize dateofBirthField;
@synthesize bloodGroupField;
@synthesize genderField;
@synthesize hidePatientDetailButton;
@synthesize patientNameLabel;
@synthesize patientSpecialityField;
@synthesize locationTextView;
@synthesize getAllClinic;
@synthesize allAppointmentButton;
@synthesize patientDetailsArray = _patientDetailsArray;
@synthesize patientDetailsDict = _patientDetailsDict;
@synthesize appointmentTabButton;
@synthesize appointmentView;
@synthesize description;
@synthesize debugDescription;
@synthesize patientPicture = _patientPicture;


- (IBAction)profileTab:(id)sender {
//    self.profileContainerView.hidden = FALSE;
//    self.appointmentContainerView.hidden = TRUE;
//    self.appointmentTabButton.backgroundColor = [UIColor clearColor];
//    self.profileTabButton.backgroundColor = [UIColor colorWithRed:(212/255.0) green:(255/255.0) blue:(203/255.0) alpha:1];
    self.profileView.hidden = FALSE;
    self.appointmentView.hidden = TRUE;
    [self.profileTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.appointmentTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    
    
    
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

- (IBAction)appointmentTab:(id)sender {
//    self.appointmentContainerView.hidden = FALSE;
//    self.profileContainerView.hidden = TRUE;
//    self.profileTabButton.backgroundColor = [UIColor clearColor];
//    self.appointmentTabButton.backgroundColor = [UIColor colorWithRed:(212/255.0) green:(255/255.0) blue:(203/255.0) alpha:1];
    self.appointmentView.hidden = FALSE;
    self.profileView.hidden = TRUE;
    [self.profileTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [self.appointmentTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    

}

- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}

-(void)fetchAllDoctorPatientClinic{
    
    NSLog(@"The fetchJson method is called.........");
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    // NSString *emailid = emailField.text;
    NSString *emailid = [[NSUserDefaults standardUserDefaults] objectForKey:@"loggedInEmail"];
    NSLog(@"email id for logged in user...%@",emailid);
    NSString *patientID = [_passPatientData valueForKey:@"patientId"];
    
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/getAllDoctorPatientClinics?doctorId=%@&patientId=%@",emailid,patientID];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    //NSMutableArray *arratList = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"Data in Array==============%@",responseStr);
    
    /* ---------- Code for Writing response data into the file -------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getAllDoctorPatientClinics.json"];
    [responseStr writeToFile:docPath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
    
    /* ---------- End of Code for Writing response data into the file -------------- */
    
  
    
}

- (void)viewDidLoad {
    NSLog(@"DetailPatientProfileViewController.m");
    [super viewDidLoad];
    
    emailField.userInteractionEnabled = NO;
    mobileField.userInteractionEnabled = NO;
    genderField.userInteractionEnabled = NO;
    dateofBirthField.userInteractionEnabled = NO;
    locationTextView.userInteractionEnabled = NO;
    bloodGroupField.userInteractionEnabled = NO;
    allergicTextView.userInteractionEnabled = NO;
    
    
    [self fetchAllDoctorPatientClinic];
    [self readAndDisplayData];
    
}
-(void)readAndDisplayData{
    /* ----------------- Read File For Parse JSON Data -------------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getAllDoctorPatientClinics.json"];
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:docPath encoding:NSUTF8StringEncoding error:NULL];
    
    NSError *error = nil;
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    
    getAllClinic = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&error];
    
    NSDictionary *json1 = [NSJSONSerialization JSONObjectWithData:[myJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    
    arrayList1 = [json1 valueForKeyPath:@"slot1"];
    arrayList2 = [json1 valueForKeyPath:@"slot2"];
    arrayList3 = [json1 valueForKeyPath:@"slot3"];
    NSLog(@"Slot1>>>>>>>>>>>>>>>>>%@",arrayList1);
    NSLog(@"Slot2>>>>>>>>>>>>>>>>>%@",arrayList2);
    NSLog(@"Slot3>>>>>>>>>>>>>>>>>%@",arrayList3);
    
    /* ----------------------------------------------------------------------------- */
    patientNameLabel.text = [_passPatientData valueForKey:@"name"];
    
    if (![[_passPatientData valueForKey:@"speciality"] isEqual:[NSNull null]]){
        
        patientSpecialityField.text = [NSString stringWithFormat:@"%@",[_passPatientData valueForKey:@"speciality"]];
    }
    else{
        patientSpecialityField.text = @"";
    }
    
    if (![[_passPatientData valueForKey:@"lastVisited"] isEqual:[NSNull null]]){
        
        lastVisitedField.text = [NSString stringWithFormat:@"%@",[_passPatientData valueForKey:@"lastVisited"]];
    }
    else{
        lastVisitedField.text = @"";
    }
    
    
    /*
     NSString *patientDate =[_passPatientData valueForKey:@"dateOfBirth"];
     NSLog(@"Date is-------%@",patientDate);
     
     //    [format setDateFormat:@"E MMM dd HH:mm:ss Z yyyy"];
     NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
     [dateFormatter setDateFormat:@"E MMM dd HH:mm:ss Z yyyy"];
     [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
     NSDate *date = [dateFormatter dateFromString:patientDate];
     NSString *copy = [NSString stringWithFormat:@"%@",date];
     [dateFormatter setDateFormat:@"dd-MM-YYYY"];
     
     NSString *d = [dateFormatter stringFromDate:date];
     NSLog(@" *******************%@",d);*/
    
    /*NSString *date = [NSString stringWithFormat:@"%@",appointmentDate];
     NSLog(@"before-----%@", date);
     
     NSRange range = [date rangeOfString:@"+"];
     date = [date substringToIndex:range.location];
     
     NSLog(@"after-----%@", date);*/
    
    
    if (![[_passPatientData valueForKey:@"emailID"] isEqual:[NSNull null]]){
        
        emailField.text = [NSString stringWithFormat:@"%@",[_passPatientData valueForKey:@"emailID"]];
    }
    else{
        [emailField setText:@"Unknown"];
    }
    
    if (![[_passPatientData valueForKey:@"mobileNumber"] isEqual:[NSNull null]]){
        
        mobileField.text = [NSString stringWithFormat:@"%@",[_passPatientData valueForKey:@"mobileNumber"]];
    }
    else{
        [mobileField setText:@"Unknown"];
    }
    
    if (![[_passPatientData valueForKey:@"gender"] isEqual:[NSNull null]]){
        
        genderField.text = [NSString stringWithFormat:@"%@",[_passPatientData valueForKey:@"gender"]];
    }
    else{
        [genderField setText:@"Unknown"];
    }
    
    if (![[_passPatientData valueForKey:@"dateOfBirth"] isEqual:[NSNull null]]){
        /*
         NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
         [dateFormatter setDateFormat:@"E MMM dd HH:mm:ss Z yyyy"];
         [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
         NSDate *date = [dateFormatter dateFromString:patientDate];
         NSString *copy = [NSString stringWithFormat:@"%@",date];
         [dateFormatter setDateFormat:@"dd-MM-YYYY"];
         NSString *d = [dateFormatter stringFromDate:date];*/
        dateofBirthField.text = [NSString stringWithFormat:@"%@",[_passPatientData valueForKey:@"dateOfBirth"]];
    }
    else{
        [dateofBirthField setText:@"Unknown"];
    }
    
    if (![[_passPatientData valueForKey:@"location"] isEqual:[NSNull null]]){
        
        locationTextView.text = [NSString stringWithFormat:@"%@",[_passPatientData valueForKey:@"location"]];
    }
    else{
        [locationTextView setText:@"Unknown"];
    }
    
    if (![[_passPatientData valueForKey:@"blood_group"] isEqual:[NSNull null]]){
        
        bloodGroupField.text = [NSString stringWithFormat:@"%@",[_passPatientData valueForKey:@"blood_group"]];
    }
    else{
        [bloodGroupField setText:@"Unknown"];
    }
    
    if (![[_passPatientData valueForKey:@"allergic_to"] isEqual:[NSNull null]]){
        
        allergicTextView.text = [NSString stringWithFormat:@"%@",[_passPatientData valueForKey:@"allergic_to"]];
    }
    else{
        [allergicTextView setText:@"Unknown"];
    }
    
    [allAppointmentButton setTitle:[NSString stringWithFormat:@"%@",[_passPatientData valueForKey:@"totalAppointment"]] forState:UIControlStateNormal];
    
    [allergicTextView.layer setBorderWidth:1.0];
    [locationTextView.layer setBorderWidth:1.0];
    
    
    _patientPicture.image = [UIImage imageNamed:@"patientProfile.png"];
    
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Patient Profile";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    self.appointmentView.hidden = TRUE;
    
    
    self.profileTabButton.titleLabel.textColor = [UIColor blackColor];
    [self.profileTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    /*NSString *fileName = [[NSBundle mainBundle] pathForResource:@"ClinicList" ofType:@"json"];
     NSString *myJson = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:NULL];
     NSError *error = nil;
     NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[myJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
     _dataArr = [json valueForKeyPath:@"ClinicList"];*/
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
        return getAllClinic.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    
    DetailPatientProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    int row = [indexPath row];

    if (![[[getAllClinic objectAtIndex:row] objectForKey:@"clinicName"] isEqual:[NSNull null]]){
        cell.clinicNameLabel.text = [[getAllClinic objectAtIndex:row] objectForKey:@"clinicName"];
    }
    else{
        cell.clinicNameLabel.text = @"";
    }
    if (![[[getAllClinic objectAtIndex:row] objectForKey:@"clinicLocation"] isEqual:[NSNull null]]){
        cell.clinicCityLabel.text = [[getAllClinic objectAtIndex:row] objectForKey:@"clinicLocation"];
    }
    else{
        cell.clinicCityLabel.text = @"";
    }
    if (![[[getAllClinic objectAtIndex:row] objectForKey:@"contactNumber"] isEqual:[NSNull null]]){
        cell.mobileNoLabel.text = [[getAllClinic objectAtIndex:row] objectForKey:@"contactNumber"];
    }
    else{
        cell.mobileNoLabel.text = @"";
    }

    //cell.clinicNameLabel.text = [[getAllClinic objectAtIndex:row] objectForKey:@"clinicName"];
   // cell.clinicCityLabel.text = [[getAllClinic objectAtIndex:row] objectForKey:@"clinicLocation"];
   // cell.mobileNoLabel.text = [[getAllClinic objectAtIndex:row] objectForKey:@"contactNumber"];
    
    if (![[[arrayList1 objectAtIndex:row] objectForKey:@"days"] isEqual:[NSNull null]]){
        cell.slot1DayLabel.text = [[arrayList1 objectAtIndex:row] objectForKey:@"days"];
    }
    else{
        cell.slot1DayLabel.text = @"";
    }
    
    if (![[[arrayList2 objectAtIndex:row] objectForKey:@"days"] isEqual:[NSNull null]]){
        cell.slot2DayLabel.text = [[arrayList2 objectAtIndex:row] objectForKey:@"days"];
    }
    else{
        cell.slot2DayLabel.text = @"";
    }
    if (![[[arrayList3 objectAtIndex:row] objectForKey:@"days"] isEqual:[NSNull null]]){
        cell.slot3DayLabel.text = [[arrayList3 objectAtIndex:row] objectForKey:@"days"];
    }
    else{
        cell.slot3DayLabel.text = @"";
    }
    
    
    //cell.slot1DayLabel.text = [[arrayList1 objectAtIndex:row] objectForKey:@"days"];
   // cell.slot2DayLabel.text = [[arrayList2 objectAtIndex:row] objectForKey:@"days"];
   //cell.slot3DayLabel.text = [[arrayList3 objectAtIndex:row] objectForKey:@"days"];

    if (![[[arrayList1 objectAtIndex:row] objectForKey:@"startTimes"] isEqual:[NSNull null]]){
        cell.slot1StartTimeLabel.text = [[arrayList1 objectAtIndex:row] objectForKey:@"startTimes"];
    }
    else{
        cell.slot1StartTimeLabel.text = @"";
    }
    if (![[[arrayList2 objectAtIndex:row] objectForKey:@"startTimes"] isEqual:[NSNull null]]){
        cell.slot2StartTimeLabel.text = [[arrayList2 objectAtIndex:row] objectForKey:@"startTimes"];
    }
    else{
        cell.slot2StartTimeLabel.text = @"";
    }
    if (![[[arrayList3 objectAtIndex:row] objectForKey:@"startTimes"] isEqual:[NSNull null]]){
        cell.slot3StartTimeLabel.text = [[arrayList3 objectAtIndex:row] objectForKey:@"startTimes"];
    }
    else{
        cell.slot3StartTimeLabel.text = @"";
    }


    
   // cell.slot1StartTimeLabel.text = [[arrayList1 objectAtIndex:row] objectForKey:@"startTimes"];
   // cell.slot2StartTimeLabel.text = [[arrayList2 objectAtIndex:row] objectForKey:@"startTimes"];
 //  cell.slot3StartTimeLabel.text = [[arrayList3 objectAtIndex:row] objectForKey:@"startTimes"];
    
    if (![[[arrayList1 objectAtIndex:row] objectForKey:@"endTimes"] isEqual:[NSNull null]]){
        cell.slot1EndTimeLabel.text = [[arrayList1 objectAtIndex:row] objectForKey:@"endTimes"];
    }
    else{
        cell.slot1EndTimeLabel.text = @"";
    }
    if (![[[arrayList2 objectAtIndex:row] objectForKey:@"endTimes"] isEqual:[NSNull null]]){
        cell.slot2EndTimeLabel.text = [[arrayList2 objectAtIndex:row] objectForKey:@"endTimes"];
    }
    else{
        cell.slot2EndTimeLabel.text = @"";
    }
    if (![[[arrayList3 objectAtIndex:row] objectForKey:@"endTimes"] isEqual:[NSNull null]]){
        cell.slot3EndTimeLabel.text = [[arrayList3 objectAtIndex:row] objectForKey:@"endTimes"];
    }
    else{
        cell.slot3EndTimeLabel.text = @"";
    }


    
   // cell.slot1EndTimeLabel.text = [[arrayList1 objectAtIndex:row] objectForKey:@"endTimes"];
    //cell.slot2EndTimeLabel.text = [[arrayList2 objectAtIndex:row] objectForKey:@"endTimes"];
    //cell.slot3EndTimeLabel.text = [[arrayList3 objectAtIndex:row] objectForKey:@"endTimes"];

    
    if (![[[getAllClinic objectAtIndex:row] objectForKey:@"onlineAppointment"] isEqual:[NSNull null]]){
        cell.slot1AppointmentLabel.text = [[getAllClinic objectAtIndex:row] objectForKey:@"onlineAppointment"];
    }
    else{
        cell.slot1AppointmentLabel.text = @"";
    }
    if (![[[getAllClinic objectAtIndex:row] objectForKey:@"onlineAppointment"] isEqual:[NSNull null]]){
        cell.slot2AppointmentLabel.text = [[getAllClinic objectAtIndex:row] objectForKey:@"onlineAppointment"];
    }
    else{
        cell.slot2AppointmentLabel.text = @"";
    }
    if (![[[getAllClinic objectAtIndex:row] objectForKey:@"onlineAppointment"] isEqual:[NSNull null]]){
        cell.slot3AppointmentLabel.text = [[getAllClinic objectAtIndex:row] objectForKey:@"onlineAppointment"];
    }
    else{
        cell.slot3AppointmentLabel.text = @"";
    }


    
   // cell.slot1AppointmentLabel.text = [[getAllClinic objectAtIndex:row] objectForKey:@"onlineAppointment"];
    //cell.slot2AppointmentLabel.text = [[getAllClinic objectAtIndex:row] objectForKey:@"onlineAppointment"];
    //cell.slot3AppointmentLabel.text = [[getAllClinic objectAtIndex:row] objectForKey:@"onlineAppointment"];


    
    return cell;
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

- (IBAction)hidePatientDetail:(id)sender {
    PatientProfileViewController *patientProfile =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientProfileViewController"];
    [self.navigationController pushViewController:patientProfile animated:YES];
    

    
}
- (IBAction)allAppointment:(id)sender {
    PatientAppointmentsForDoctorViewController *appForDoctor =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientAppointmentsForDoctorViewController"];
    /* ------------------------------------------ */
    appForDoctor.patientEmailIdForCallAPI = [_passPatientData valueForKey:@"emailID"];
    appForDoctor.doctorIdForCallAPI = [_passPatientData valueForKey:@"doctorId"];
    [self.navigationController pushViewController:appForDoctor animated:YES];
}
@end
