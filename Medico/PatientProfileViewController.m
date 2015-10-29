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

@interface PatientProfileViewController ()

@end

@implementation PatientProfileViewController
@synthesize patientArr;
@synthesize arrDoctor;
@synthesize args;

- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    NSLog(@"calling home page of dr");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchJson];
    
   // gridViewTable.backgroundColor = [UIColor clearColor];
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Patient Profile";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    /* ----------------- Read File For Parse JSON Data -------------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/homeCountPatient.json"];
    NSLog(@"%@",docPath);
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:docPath encoding:NSUTF8StringEncoding error:NULL];
    
    NSError *error = nil;
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    
    patientArr = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&error];
    NSDictionary *json1 = [NSJSONSerialization JSONObjectWithData:[myJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    
    arrDoctor = [json1 valueForKeyPath:@"doctors"];
    args = [[NSDictionary alloc] initWithDictionary:[json1 objectForKey:@"appointmentVm"]];
    NSLog(@"arrrDoctor-----%@",arrDoctor);
    NSLog(@"args-----%@",args);


    /*
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"HomeCountPatients" ofType:@"json"];
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:NULL];
    NSError *error = nil;
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    patientArr = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&error];
    NSDictionary *json1 = [NSJSONSerialization JSONObjectWithData:[myJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    
    arrDoctor = [json1 valueForKeyPath:@"doctors"];
    args = [[NSDictionary alloc] initWithDictionary:[json1 objectForKey:@"appointmentVm"]];

  // NSArray *patientArr1 =[json1 valueForKey:@"appointmentVm"];
    NSLog(@"The HomeCountPatients Json File Contains Data---------------%@",arrDoctor);
    NSLog(@"Value of last visited..... %@",[args objectForKey:@"appointmentDate"]);
    */
}



-(void)fetchJson{
    NSLog(@"The fetchJson method is called.........");
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
   // NSString *emailid = emailField.text;
    NSString *emailid = [[NSUserDefaults standardUserDefaults] objectForKey:@"loggedInEmail"];
    NSLog(@"email id for logged in user...%@",emailid);
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/homeCountPatient?id=ak@gmail.com"];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
   
    //NSMutableArray *arratList = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"Data in Array==============%@",responseStr);
    
    /* ---------- Code for Writing response data into the file -------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/homeCountPatient.json"];
    NSLog(@"%@",docPath);
    [responseStr writeToFile:docPath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
    
    /* ---------- End of Code for Writing response data into the file -------------- */

    
    
}
/*
-(void)fetchDetails{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    NSString *emailid = [[NSUserDefaults standardUserDefaults] objectForKey:@"loggedInEmail"];
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000//homeCountPatient?email=%@",emailid];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSMutableArray *arratList = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"Data in Array==============%@",arratList);
    NSLog(@"name of doctor=====%@",[arratList valueForKey:@"name"]);
        
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return arrDoctor.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    PatientProfileTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //for(int count = 0;count<_arr.count;count++){
    int row = [indexPath row];
       cell.patientNameLabel.text = [[arrDoctor objectAtIndex:row] objectForKey:@"name"];
    if (![[arrDoctor objectAtIndex:row] objectForKey:@"lastVisited"]) {
        [cell.lastVisitedButton setTitle:[NSString stringWithFormat:[[arrDoctor objectAtIndex:row] objectForKey:@"lastVisited"]] forState:UIControlStateNormal];
    }
    else
    {
        NSLog(@"aat");
        [cell.lastVisitedButton setTitle:@"Not Visited" forState:UIControlStateNormal];
        NSLog(@"baher");
    }
    
    if (![[arrDoctor objectAtIndex:row] objectForKey:@"previousAppointment"]) {
         [cell.lastAppointmentButton setTitle:[NSString stringWithFormat:[[arrDoctor objectAtIndex:row] objectForKey:@"previousAppointment"]] forState:UIControlStateNormal];
    }
    else
    {
        NSLog(@"aat");
        [cell.lastAppointmentButton setTitle:@"Not Visited" forState:UIControlStateNormal];
        NSLog(@"baher");
    }

    
    
   
 // [cell.appointmentButton setTitle:[NSString stringWithFormat:[args objectForKey:@"appointmentDate"]] forState:UIControlStateNormal];
    [cell.appointmentButton setTitle:[NSString stringWithFormat:@"%@",[args objectForKey:@"appointmentDate"]] forState:UIControlStateNormal];
    //cell.appointmentButton.titleLabel.text = [args objectForKey:@"appointmentDate"];
    
   cell.patientPicture.image = [UIImage imageNamed:@"patientProfile.png"];
    cell.showPatientProfileButton.tag =row;
    [cell.showPatientProfileButton addTarget:self action:@selector(showPatientProfile:) forControlEvents:UIControlEventTouchUpInside];
    cell.getAllAppointmentButton.tag =row;
    [cell.getAllAppointmentButton addTarget:self action:@selector(getAllAppointmnet:) forControlEvents:UIControlEventTouchUpInside];
    cell.lastAppointmentButton.tag =row;
    [cell.lastAppointmentButton addTarget:self action:@selector(lastAppointment:) forControlEvents:UIControlEventTouchUpInside];
    cell.appointmentButton.tag =row;
    [cell.appointmentButton addTarget:self action:@selector(appointment:) forControlEvents:UIControlEventTouchUpInside];


    return cell;
    
}
- (void)appointment:(id)sender {
    DoctorBookAppointmentViewController *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorBookAppointmentViewController"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
}


- (void)lastAppointment:(id)sender {
    LastVisitedConsultationViewController *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"LastVisitedConsultationViewController"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
}
- (void)getAllAppointmnet:(id)sender {
    PatientAppointmentsForDoctorViewController *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientAppointmentsForDoctorViewController"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
}

- (void)showPatientProfile:(id)sender {
    DetailPatientProfileViewController *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DetailPatientProfileViewController"];
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
