//
//  PatientManageAppointmentViewController.m
//  Medico
//
//  Created by Apple on 09/12/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientManageAppointmentViewController.h"
#import "PatientLandingPageViewController.h"
#import "PatientManageAppointmentCell.h"
#import "PatientNewAppointmentViewController.h"
#import "PatientPDFDocumentViewController.h"
#import "DetailPatientDoctorConsultationsViewController.h"

@interface PatientManageAppointmentViewController ()

@end

@implementation PatientManageAppointmentViewController

- (void) homePage:(id)sender{
    PatientLandingPageViewController *PatientHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientLandingPageViewController"];
    [self.navigationController pushViewController:PatientHome animated:YES];
    
}

- (void) addNewAppointment:(id)sender{
//    PatientNewAppointmentViewController *PatientHome =
//    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientNewAppointmentViewController"];
//    [self.navigationController pushViewController:PatientHome animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"PatientManageAppointmentViewController.m");
    
//    UIImage *myImage = [UIImage imageNamed:@"home.png"];
//    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
//   // UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewAppointment:)];
//    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
//    self.navigationItem.rightBarButtonItems = buttonArr;
    UIImage *myImage = [UIImage imageNamed:@"ic_home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];

    
    
    self.navigationItem.title = @"Appointments";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 3;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == 0) {
        return 0;
    }
    if (section == 1)
        return 1;
    if (section == 2)
        return 1;
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    int row = [indexPath row];
    
    PatientManageAppointmentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath.section == 1){
        
        cell.showDocumentsButton.tag =row;
        [cell.showDocumentsButton addTarget:self action:@selector(showDocuments:) forControlEvents:UIControlEventTouchUpInside];
        
        cell.appointmentDateButton.tag = row;
        [cell.appointmentDateButton addTarget:self action:@selector(appointmentDate:) forControlEvents:UIControlEventTouchUpInside];
        
        cell.appointmentTimeButton.tag = row;
        [cell.appointmentTimeButton addTarget:self action:@selector(appointmentDate:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    if (indexPath.section == 2){
        
        cell.showDocumentsButton.tag =row;
        [cell.showDocumentsButton addTarget:self action:@selector(showDocuments:) forControlEvents:UIControlEventTouchUpInside];
        
        cell.appointmentDateButton.tag = row;
        [cell.appointmentDateButton addTarget:self action:@selector(appointmentDate:) forControlEvents:UIControlEventTouchUpInside];
        
        cell.appointmentTimeButton.tag = row;
        [cell.appointmentTimeButton addTarget:self action:@selector(appointmentDate:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return cell;
}

-(void)showDocuments:(id)sender {
    
    PatientPDFDocumentViewController *pdf =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientPDFDocumentViewController"];
    
    [self.navigationController pushViewController:pdf animated:YES];
    
}

-(void)appointmentDate:(id)sender {
    
    DetailPatientDoctorConsultationsViewController *detail =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DetailPatientDoctorConsultationsViewController"];
    detail.value = @"a";
    [self.navigationController pushViewController:detail animated:YES];
    
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if (section == 0)
        return @"Upcoming Appointment";
    if (section == 1)
        return @"Past Appointment";
    return @"";
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return @"";
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

- (IBAction)addManageAppointment:(id)sender {
    PatientNewAppointmentViewController *PatientHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientNewAppointmentViewController"];
    [self.navigationController pushViewController:PatientHome animated:YES];
}
@end
