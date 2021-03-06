//
//  SearchPatientForDoctorViewController.m
//  Medico
//
//  Created by APPLE on 21/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "SearchPatientForDoctorViewController.h"
#import "DoctorLandingPageView.h"
#import "SearchPatientForDoctorCell.h"
#import "PatientAppointmentsForDoctorViewController.h"
#import "DetailPatientProfileViewController.h"

@interface SearchPatientForDoctorViewController ()

@end

@implementation SearchPatientForDoctorViewController
@synthesize jsonList;

- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}
- (void)viewDidLoad {
    NSLog(@"SearchPatientForDoctorViewController.m");
    [super viewDidLoad];
    UIImage *myImage = [UIImage imageNamed:@"ic_home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Search Patient";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"searchPatient" ofType:@"json"];
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:NULL];
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    NSError *e;
    jsonList = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&e];

    // Do any additional setup after loading the view.
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
    SearchPatientForDoctorCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //for(int count = 0;count<_arr.count;count++){
    int row = [indexPath row];
    cell.nameLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"name"];
    cell.locationlabel.text = [[jsonList objectAtIndex:row] objectForKey:@"location"];
    cell.patientImage.image = [UIImage imageNamed:@"patientProfile.png"];
    cell.showAppointmentButton.tag = row;
    [cell.showAppointmentButton addTarget:self action:@selector(showAppointment:) forControlEvents:UIControlEventTouchUpInside];
    cell.patientDetailButton.tag =row;
    [cell.patientDetailButton addTarget:self action:@selector(patientDetail:) forControlEvents:UIControlEventTouchUpInside];

    return cell;
    
}
     - (IBAction)showAppointment:(id)sender {
     PatientAppointmentsForDoctorViewController *patientAppoint =
     [self.storyboard instantiateViewControllerWithIdentifier:@"PatientAppointmentsForDoctorViewController"];
     [self.navigationController pushViewController:patientAppoint animated:YES];
     }

-(void)patientDetail:(id)sender{
    DetailPatientProfileViewController *patientAppoint =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DetailPatientProfileViewController"];
    [self.navigationController pushViewController:patientAppoint animated:YES];
    
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
