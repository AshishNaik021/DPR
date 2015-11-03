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

- (void)viewDidLoad {
    NSLog(@"DetailPatientProfileViewController.m");
    [super viewDidLoad];
    
    NSLog(@"Data in pass deta array------------%@",_passPatientData);
//    _patientNameLabel.text = [[_detailArr objectAtIndex:0] objectForKey:@"name"];
//    _patientSpecialityField.text = [[_detailArr objectAtIndex:0] objectForKey:@"speciality"];
//    _lastVisitedField.text = [[_detailArr objectAtIndex:0] objectForKey:@"lastVisited"];
    
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
    NSLog(@" *******************%@",d);
    
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
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"E MMM dd HH:mm:ss Z yyyy"];
        [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
        NSDate *date = [dateFormatter dateFromString:patientDate];
        NSString *copy = [NSString stringWithFormat:@"%@",date];
        [dateFormatter setDateFormat:@"dd-MM-YYYY"];
        NSString *d = [dateFormatter stringFromDate:date];
        dateofBirthField.text = [NSString stringWithFormat:@"%@",d];
    }
    else{
        [dateofBirthField setText:@"Unknown"];
    }
    
    if (![[_passPatientData valueForKey:@"location"] isEqual:[NSNull null]]){
        
        locationField.text = [NSString stringWithFormat:@"%@",[_passPatientData valueForKey:@"location"]];
    }
    else{
        [locationField setText:@"Unknown"];
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
    
    [allergicTextView.layer setBorderWidth:1.0];

    
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
    
  
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"getAllDoctorPatientClinics" ofType:@"json"];
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:NULL];
   NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
   // NSMutableData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    NSError *e;
    jsonList = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&e];
    NSDictionary *json1 = [NSJSONSerialization JSONObjectWithData:[myJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&e];
   arrayList1 = [json1 valueForKeyPath:@"slot1"];
    arrayList2 = [json1 valueForKeyPath:@"slot2"];
    arrayList3 = [json1 valueForKeyPath:@"slot3"];
 
    

   NSLog(@"the data within slot3 array is--------- %@",[[arrayList3 objectAtIndex:0] objectForKey:@"days"]);
    
    
    
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
        return jsonList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    // DoctorManageAppointmentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //for(int count = 0;count<_arr.count;count++){
    
    DetailPatientProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    int row = [indexPath row];

   
    cell.clinicNameLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"clinicName"];
    cell.clinicCityLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"clinicLocation"];
    cell.mobileNoLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"contactNumber"];
    
    cell.slot1DayLabel.text = [[arrayList1 objectAtIndex:row] objectForKey:@"days"];
    cell.slot2DayLabel.text = [[arrayList2 objectAtIndex:row] objectForKey:@"days"];
   cell.slot3DayLabel.text = [[arrayList3 objectAtIndex:row] objectForKey:@"days"];

    cell.slot1TimeLabel.text = [[arrayList1 objectAtIndex:row] objectForKey:@"startTimes"];
    cell.slot2TimeLabel.text = [[arrayList2 objectAtIndex:row] objectForKey:@"startTimes"];
   cell.slot3TimeLabel.text = [[arrayList3 objectAtIndex:row] objectForKey:@"startTimes"];
    
    cell.slot1AppointmentLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"onlineAppointment"];
    cell.slot2AppointmentLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"onlineAppointment"];
    cell.slot3AppointmentLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"onlineAppointment"];


    
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

@end
