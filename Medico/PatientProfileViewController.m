//
//  PatientProfileViewController.m
//  Medico
//
//  Created by APPLE on 09/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientProfileViewController.h"
#import "DoctorLandingPageView.h"
#import "PatientProfileTableViewCell.h"
#import "DetailPatientProfileViewController.h"
#import "PatientAppointmentsForDoctorViewController.h"
#import "LastVisitedConsultationViewController.h"
#import "DoctorBookAppointmentViewController.h"
#import "LastVisitedConsultationViewController.h"
#import "AllDetailInformationViewController.h"
#import "MBProgressHUD.h"

@interface PatientProfileViewController ()

@end

@implementation PatientProfileViewController
@synthesize patientArr;
@synthesize arrDoctor;
@synthesize args;

- (IBAction)redirectToListofAppointment:(id)sender {
}

- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    NSLog(@"calling home page of dr");
}



- (void)viewDidLoad {
    NSLog(@"PatientProfileViewController.m");
    [super viewDidLoad];
  //  self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.bounds.size.width, 0.01f)];

    [self fetchJson];
    
    // gridViewTable.backgroundColor = [UIColor clearColor];
    UIImage *myImage = [UIImage imageNamed:@"ic_home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Patient Profile";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    
    /* ----------------- Read File For Parse JSON Data -------------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getAllPatientInformation.json"];
    NSLog(@"%@",docPath);
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:docPath encoding:NSUTF8StringEncoding error:NULL];
    
    NSError *error = nil;
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    
    patientArr = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&error];
    NSDictionary *json1 = [NSJSONSerialization JSONObjectWithData:[myJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    
    NSLog(@">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>%@",patientArr);
    
    //    arrDoctor = [json1 valueForKeyPath:@"doctors"];
    //    args = [[NSDictionary alloc] initWithDictionary:[json1 objectForKey:@"appointmentVm"]];
    //    NSLog(@"arrrDoctor-----%@",arrDoctor);
    //    NSLog(@"args-----%@",args);
    
    
}



-(void)fetchJson{
    NSLog(@"The fetchJson method is called.........");
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Processing...";
    
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    // NSString *emailid = emailField.text;
    NSString *emailid = [[NSUserDefaults standardUserDefaults] objectForKey:@"loggedInEmail"];
    NSLog(@"email id for logged in user...%@",emailid);
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/getAllPatientInformation?doctorId=%@",emailid];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    //NSMutableArray *arratList = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"Data in Array==============%@",responseStr);
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    hud = nil;

    /* ---------- Code for Writing response data into the file -------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getAllPatientInformation.json"];
    NSLog(@"%@",docPath);
    [responseStr writeToFile:docPath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
    
    /* ---------- End of Code for Writing response data into the file -------------- */
    
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return patientArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    PatientProfileTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    int row = (int)[indexPath row];
    
    cell.patientNameLabel.text = [[patientArr objectAtIndex:row] objectForKey:@"name"];
    
    if (![[[patientArr objectAtIndex:row] objectForKey:@"lastVisited"] isEqual:[NSNull null]]) {
        
        [cell.lastVisitedButton setTitle:[NSString stringWithFormat:@"%@",[[patientArr objectAtIndex:row] objectForKey:@"lastVisited"]] forState:UIControlStateNormal];
        
        if ([cell.lastVisitedButton.titleLabel.text length] == 0) {
            [cell.lastVisitedButton setTitle:@"Not Visited" forState:UIControlStateNormal];
        }
    }
    else
    {
        [cell.lastVisitedButton setTitle:@"Not Visited" forState:UIControlStateNormal];
    }
    
    
    if (![[[patientArr objectAtIndex:row] objectForKey:@"appointmentDate"] isEqual:[NSNull null]]) {
        
//        NSString *appDate = [[patientArr objectAtIndex:row] objectForKey:@"appointmentDate"];
//        NSString *appTime = [[patientArr objectAtIndex:row] objectForKey:@"appointmentTime"];
        
        NSString *concat = [NSString stringWithFormat:@"%@ %@",[[patientArr objectAtIndex:row] objectForKey:@"appointmentDate"],[[patientArr objectAtIndex:row] objectForKey:@"appointmentTime"]];
        NSLog(@"%lu",(unsigned long)[concat length]);
        
        [cell.lastAppointmentButton setTitle:concat forState:UIControlStateNormal];
        if ([cell.lastAppointmentButton.titleLabel.text length] == 1) {
            [cell.lastAppointmentButton setTitle:@"Not Booked" forState:UIControlStateNormal];
        }
        
    }
    else
    {
        [cell.lastAppointmentButton setTitle:@"Not Booked" forState:UIControlStateNormal];
    }
    
    if (![[[patientArr objectAtIndex:row] objectForKey:@"appointmentTime"] isEqual:[NSNull null]]) {
        [cell.appointmentButton setTitle:[NSString stringWithFormat:@"%@",[[patientArr objectAtIndex:row] objectForKey:@"appointmentTime"]] forState:UIControlStateNormal];
        if ([cell.appointmentButton.titleLabel.text length] == 0) {
            [cell.appointmentButton setTitle:@"Not Booked" forState:UIControlStateNormal];
        }
        
    }
    else
    {
        [cell.appointmentButton setTitle:@"Not Booked" forState:UIControlStateNormal];
    }
    if (![[[patientArr objectAtIndex:row] objectForKey:@"bookDate"] isEqual:[NSNull null]]) {
        
        NSString *concat = [NSString stringWithFormat:@"%@ %@",[[patientArr objectAtIndex:row] objectForKey:@"bookDate"],[[patientArr objectAtIndex:row] objectForKey:@"bookTime"]];
        
        [cell.nextAppointmentButton setTitle:concat forState:UIControlStateNormal];
        if ([cell.nextAppointmentButton.titleLabel.text length] == 1) {
            [cell.nextAppointmentButton setTitle:@"Not Booked" forState:UIControlStateNormal];
        }
        
    }
    else
    {
        [cell.nextAppointmentButton setTitle:@"Not Booked" forState:UIControlStateNormal];
    }
    
    if (![[[patientArr objectAtIndex:row] objectForKey:@"bookTime"] isEqual:[NSNull null]]) {
        
        
        
        [cell.nextTimeAppointmentButton setTitle:[NSString stringWithFormat:@"%@",[[patientArr objectAtIndex:row] objectForKey:@"bookTime"]] forState:UIControlStateNormal];
        if ([cell.nextTimeAppointmentButton.titleLabel.text length] == 0) {
            [cell.nextTimeAppointmentButton setTitle:@"Not Booked" forState:UIControlStateNormal];
        }
        
    }
    else
    {
        [cell.nextTimeAppointmentButton setTitle:@"Not Booked" forState:UIControlStateNormal];
    }
    
    
    
    // [cell.appointmentButton setTitle:[NSString stringWithFormat:[args objectForKey:@"appointmentDate"]] forState:UIControlStateNormal];
    /*
     NSDate *appointmentDate = [NSDate dateWithTimeIntervalSince1970:(int)[args objectForKey:@"appointmentDate"]];
     
     NSLog(@"Appointment Date----- %@",appointmentDate);
     NSString *date = [NSString stringWithFormat:@"%@",appointmentDate];
     NSLog(@"before-----%@", date);
     
     NSRange range = [date rangeOfString:@"+"];
     date = [date substringToIndex:range.location];
     
     NSLog(@"after-----%@", date);
     */
    /* --------------- different methods to remove subString form string ----------------
     if ([date length] > 0)
     {
     date = [date substringToIndex:[date length] - 5];
     }
     
     
     NSRange tldr = [date rangeOfString:@"+0000"];
     
     if (tldr.location != NSNotFound) {
     date = [date stringByReplacingCharactersInRange:tldr withString:@""];
     NSLog(@"removed-----%@", date);
     }
     */
    
    [cell.getAllAppointmentButton setTitle:[NSString stringWithFormat:@"%@",[[patientArr objectAtIndex:row] objectForKey:@"totalAppointment"]] forState:UIControlStateNormal];
    
    // [cell.appointmentButton setTitle:[NSString stringWithFormat:date] forState:UIControlStateNormal];
    
   // cell.patientPicture.image = [UIImage imageNamed:@"patientProfile.png"];
    cell.showPatientProfileButton.tag =row;
    [cell.showPatientProfileButton addTarget:self action:@selector(showPatientProfile:) forControlEvents:UIControlEventTouchUpInside];
    cell.getAllAppointmentButton.tag =row;
    [cell.getAllAppointmentButton addTarget:self action:@selector(getAllAppointmnet:) forControlEvents:UIControlEventTouchUpInside];
    cell.lastAppointmentButton.tag =row;
    [cell.lastAppointmentButton addTarget:self action:@selector(lastAppointment:) forControlEvents:UIControlEventTouchUpInside];
    cell.appointmentButton.tag =row;
    [cell.appointmentButton addTarget:self action:@selector(appointment:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.lastVisitedButton.tag =row;
    [cell.lastVisitedButton addTarget:self action:@selector(lastVisited:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.nextAppointmentButton.tag =row;
    [cell.nextAppointmentButton addTarget:self action:@selector(nextAppointment:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.nextTimeAppointmentButton.tag =row;
    [cell.nextTimeAppointmentButton addTarget:self action:@selector(nextAppointment:) forControlEvents:UIControlEventTouchUpInside];
    
    
    return cell;
    
}

- (void)nextAppointment:(id)sender {
    UIButton *senderButton = (UIButton *)sender;
    int n = (int)senderButton.tag;
    NSLog(@"patientArr:%@",patientArr);
        DoctorBookAppointmentViewController *summary =
        [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorBookAppointmentViewController"];
        summary.patientEmailPassData = [[patientArr objectAtIndex:n] valueForKey:@"emailID"];
        summary.doctorIdPassData = [[patientArr objectAtIndex:n] valueForKey:@"doctorId"];
        summary.appointmentDatePassData = [[patientArr objectAtIndex:n] valueForKey:@"bookDate"];
        summary.appointmentTimePassData = [[patientArr objectAtIndex:n] valueForKey:@"bookTime"];
    summary.patientArr = patientArr;
        [self.navigationController pushViewController:summary animated:YES];

}



- (void)nextTimeAppointment:(id)sender {
    DoctorBookAppointmentViewController *summary =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorBookAppointmentViewController"];
    [self.navigationController pushViewController:summary animated:YES];
}

- (void)appointment:(id)sender {
    DoctorBookAppointmentViewController *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorBookAppointmentViewController"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
}



- (void)lastVisited:(id)sender {
    UIButton *senderButton = (UIButton *)sender;
    int n = (int)senderButton.tag;
    
    if (![[[patientArr objectAtIndex:n] objectForKey:@"lastVisited"] isEqual:[NSNull null]]){
        
       // if (![[[patientArr objectAtIndex:n] objectForKey:@"lastVisitedTime"] isEqual:[NSNull null]] ) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"There is no last visited summary." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];

    
  //  }
    }
    else{
        AllDetailInformationViewController *summary =
        [self.storyboard instantiateViewControllerWithIdentifier:@"AllDetailInformationViewController"];
        summary.summaryPatientEmailPassData = [[patientArr objectAtIndex:n] valueForKey:@"emailID"];
        summary.summaryDoctorIDPassData = [[patientArr objectAtIndex:n] valueForKey:@"doctorId"];
        summary.summaryDatePassData = [[patientArr objectAtIndex:n] valueForKey:@"lastVisited"];
        summary.summaryTimePassData = [[patientArr objectAtIndex:n] valueForKey:@"lastVisitedTime"];
        [self.navigationController pushViewController:summary animated:YES];
        
    }
}




- (void)lastAppointment:(id)sender {
    UIButton *senderButton = (UIButton *)sender;
    NSLog(@"current Row=%ld",(long)senderButton.tag);
    int n = (int)senderButton.tag;
    LastVisitedConsultationViewController *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"LastVisitedConsultationViewController"];
    DoctorHome.patientArr = patientArr[n];
    NSLog(@"patientArr printing :%@",DoctorHome.patientArr);
    [self.navigationController pushViewController:DoctorHome animated:YES];
}
- (void)getAllAppointmnet:(id)sender {
    UIButton *senderButton = (UIButton *)sender;
    int n = (int)senderButton.tag;
    
    PatientAppointmentsForDoctorViewController *appForDoctor =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientAppointmentsForDoctorViewController"];
    /* ------------------------------------------ */
    appForDoctor.patientEmailIdForCallAPI = [[patientArr objectAtIndex:n] valueForKey:@"emailID"];
    appForDoctor.doctorIdForCallAPI = [[patientArr objectAtIndex:n] valueForKey:@"doctorId"];
    [self.navigationController pushViewController:appForDoctor animated:YES];
}

- (void)showPatientProfile:(id)sender {
    UIButton *senderButton = (UIButton *)sender;
    NSLog(@"current Row=%ld",(long)senderButton.tag);
    int n = (int)senderButton.tag;
    
    DetailPatientProfileViewController *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DetailPatientProfileViewController"];
    DoctorHome.passPatientData = patientArr[n];
    [self.navigationController pushViewController:DoctorHome animated:YES];
}


/*
 -(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
 
 if ([[segue identifier] isEqualToString:@"ShowDetails"]) {
 DetailPatientProfileViewController *detailPatientProfile = [segue destinationViewController];
 NSIndexPath *myIndex = [gridViewTable indexPathForSelectedRow];
 int row = [myIndex row];
 detailPatientProfile.detailArr = @[_patientArr[row]];
 }
 
 }
 */



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
