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

@interface PatientClinicAndLabsViewController ()

@end

@implementation PatientClinicAndLabsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    
    return cell;
    
}
- (IBAction)showDetails:(id)sender {
    PatientClinicProfileAndAppointmentsViewController *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientClinicProfileAndAppointmentsViewController"];
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
