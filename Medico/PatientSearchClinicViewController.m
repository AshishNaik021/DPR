//
//  PatientSearchClinicViewController.m
//  Medico
//
//  Created by Apple on 10/12/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientSearchClinicViewController.h"
#import "PatientLandingPageViewController.h"
#import "PatientDetailSearchClinicViewController.h"
#import "CreateDoctorsClinicSettingsViewController.h"
#import "PatientSearchClinicCell.h"

@interface PatientSearchClinicViewController ()

@end

@implementation PatientSearchClinicViewController

- (void) homePage:(id)sender{
    PatientLandingPageViewController *PatientHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientLandingPageViewController"];
    [self.navigationController pushViewController:PatientHome animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"PatientSearchClinicViewController.m");
    
    UIImage *myImage = [UIImage imageNamed:@"ic_home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    
    self.navigationItem.title = @"Search Clinic & Labs";
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
    PatientSearchClinicCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //for(int count = 0;count<_arr.count;count++){
    cell.specialityClinicLabel.text = @"Dentist";
    return cell;
    
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    /*
     if ([[segue identifier] isEqualToString:@"ShowDetails"]) {
     DetailManageTemplate *detailmanagetemplate = [segue destinationViewController];
     NSIndexPath *myIndex = [self.tableView indexPathForSelectedRow];
     int row = [myIndex row];
     
     }
     */
    
    /* NSIndexPath *path = [self.tableView indexPathForSelectedRow];
     TemplateDetailViewController *templateDetail;
     templateDetail = [segue destinationViewController];
     templateDetail.var = path.row;
     */
    
    PatientDetailSearchClinicViewController *templateDetailView = [segue destinationViewController];
    NSIndexPath *myIndex = [self.tableView indexPathForSelectedRow];
    int row = [myIndex row];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)search:(id)sender {
    PatientDetailSearchClinicViewController *PatientHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientDetailSearchClinicViewController"];
    [self.navigationController pushViewController:PatientHome animated:YES];
}
- (IBAction)addNewClinic:(id)sender {
    CreateDoctorsClinicSettingsViewController *addClinic =
    [self.storyboard instantiateViewControllerWithIdentifier:@"CreateDoctorsClinicSettingsViewController"];
    [self.navigationController pushViewController:addClinic animated:YES];
}
@end
