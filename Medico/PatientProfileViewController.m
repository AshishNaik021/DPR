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
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // gridViewTable.backgroundColor = [UIColor clearColor];
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Patient Profile";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"HomeCountPatients" ofType:@"json"];
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:NULL];
    NSError *error = nil;
//    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[myJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
//    _patientArr = [json valueForKeyPath:@"PatientProfile"];
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    patientArr = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&error];
    NSDictionary *json1 = [NSJSONSerialization JSONObjectWithData:[myJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    
    arrDoctor = [json1 valueForKeyPath:@"doctors"];
  //  NSDictionary *argsValues
    args = [[NSDictionary alloc] initWithDictionary:[json1 objectForKey:@"appointmentVm"]];

  // NSArray *patientArr1 =[json1 valueForKey:@"appointmentVm"];
    NSLog(@"The HomeCountPatients Json File Contains Data---------------%@",arrDoctor);
    NSLog(@"Value of last visited..... %@",[args objectForKey:@"appointmentDate"]);//(unsigned long)patientArr1.count);//objectForKey:@"visitType");
    
}


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
 [cell.lastVisitedButton setTitle:[NSString stringWithFormat:[[arrDoctor objectAtIndex:row] objectForKey:@"lastVisited"]] forState:UIControlStateNormal];
    [cell.lastAppointmentButton setTitle:[NSString stringWithFormat:[[arrDoctor objectAtIndex:row] objectForKey:@"previousAppointment"]] forState:UIControlStateNormal];
   [cell.appointmentButton setTitle:[NSString stringWithFormat:[args objectForKey:@"appointmentDate"]] forState:UIControlStateNormal];
    
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
