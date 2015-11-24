//
//  PatientDoctorConsultationsViewController.m
//  Medico
//
//  Created by Apple on 24/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientDoctorConsultationsViewController.h"
#import "PatientDoctorConsultationsCell.h"
#import "PatientLandingPageViewController.h"
#import "DetailPatientDoctorConsultationsViewController.h"

@interface PatientDoctorConsultationsViewController ()

@end

@implementation PatientDoctorConsultationsViewController


- (void) patientHomePage:(id)sender{
    PatientLandingPageViewController *PatientHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientLandingPageViewController"];
    [self.navigationController pushViewController:PatientHome animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Consultations";
    
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(patientHomePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;

    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
   PatientDoctorConsultationsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    int row = [indexPath row];

    cell.showDetailsButton.tag =row;
    [cell.showDetailsButton addTarget:self action:@selector(showDetails:) forControlEvents:UIControlEventTouchUpInside];

    return cell;
    
}
- (void)showDetails:(id)sender {
    UIButton *senderButton = (UIButton *)sender;
    int n = senderButton.tag;
   /*
    AllDetailInformationViewController *allInfo =
    [self.storyboard instantiateViewControllerWithIdentifier:@"AllDetailInformationViewController"];
    allInfo.summaryTimePassData = [[patientAppointmentArr objectAtIndex:n] valueForKey:@"bookTime"];
    allInfo.summaryDoctorIDPassData = [[patientAppointmentArr objectAtIndex:n] valueForKey:@"doctorId"];
    appointmentDate = [NSDate dateWithTimeIntervalSinceNow:(int)[[patientAppointmentArr objectAtIndex:n] objectForKey:@"appointmentDate"]];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    date = [formatter stringFromDate:appointmentDate];
    */
    
    DetailPatientDoctorConsultationsViewController *details =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DetailPatientDoctorConsultationsViewController"];
    
    [self.navigationController pushViewController:details animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addDoctor:(id)sender {
}
@end
