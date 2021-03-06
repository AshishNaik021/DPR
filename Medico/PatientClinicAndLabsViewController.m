//
//  PatientClinicAndLabsViewController.m
//  Medico
//
//  Created by APPLE on 16/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientClinicAndLabsViewController.h"
#import "PatientClinicAndLabsCell.h"
#import "PatientClinicProfileAndAppointmentsViewController.h"
#import "PatientLandingPageViewController.h"
#import "PatientYearlyPDFListOfClinicLabViewController.h"

@interface PatientClinicAndLabsViewController ()

@end


@implementation PatientClinicAndLabsViewController
- (void) homePage:(id)sender{
    PatientLandingPageViewController *PatientHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientLandingPageViewController"];
    [self.navigationController pushViewController:PatientHome animated:YES];
    
}

- (void)viewDidLoad {
    NSLog(@"PatientClinicAndLabsViewController.m");
    [super viewDidLoad];
    UIImage *myImage = [UIImage imageNamed:@"ic_home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;

    self.navigationItem.title = @"Clinics And Labs";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];

    // Do any additional setup after loading the view.
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
    
    static NSString *CellIdentifier = @"TableCell";
    PatientClinicAndLabsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //for(int count = 0;count<_arr.count;count++){
    cell.showDetailsButton.tag = indexPath.row;
    [cell.showDetailsButton addTarget:self action:@selector(showDetails:) forControlEvents:UIControlEventTouchUpInside];
    cell.totalCountButton.tag = indexPath.row;
    [cell.totalCountButton addTarget:self action:@selector(totalCount:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
    
}
- (IBAction)showDetails:(id)sender {
    PatientClinicProfileAndAppointmentsViewController *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientClinicProfileAndAppointmentsViewController"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    

    
}

- (IBAction)totalCount:(id)sender {
    PatientYearlyPDFListOfClinicLabViewController *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientYearlyPDFListOfClinicLabViewController"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
    
    
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
