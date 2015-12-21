//
//  PatientSearchDoctorViewController.m
//  Medico
//
//  Created by APPLE on 20/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientSearchDoctorViewController.h"
#import "PatientLandingPageViewController.h"
#import "DoctorLandingPageView.h"
#import "PatientDetailSearchDoctorViewController.h"
#import "PatientSearchDoctorCell.h"

@interface PatientSearchDoctorViewController ()

@end

@implementation PatientSearchDoctorViewController

- (void)viewDidLoad {
    NSLog(@"PatientSearchDoctorViewController.m");
    [super viewDidLoad];
    UIImage *myImage = [UIImage imageNamed:@"ic_home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    
    self.navigationItem.title = @"Search Doctor";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) homePage:(id)sender{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *type = [NSString stringWithFormat:[ud valueForKey:@"loggedInUserType"]];
    if ([type isEqualToString:@"Patient"]) {
        PatientLandingPageViewController *PatientHome =
        [self.storyboard instantiateViewControllerWithIdentifier:@"PatientLandingPageViewController"];
        [self.navigationController pushViewController:PatientHome animated:YES];
    }
    else{
        DoctorLandingPageView *docHome = [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
        [self.navigationController pushViewController:docHome animated:YES];
        
    }
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
    PatientSearchDoctorCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //for(int count = 0;count<_arr.count;count++){
    cell.doctorSpecialityLabel.text = @"Dentist";
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
    
    PatientDetailSearchDoctorViewController *templateDetailView = [segue destinationViewController];
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
//    PatientDetailSearchDoctorViewController *search =
//    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientDetailSearchDoctorViewController"];
//    [self.navigationController pushViewController:search animated:YES];

}

- (IBAction)pediatricianDoctor:(id)sender {
}
- (IBAction)dermatologistDoctor:(id)sender {
}

- (IBAction)dentistDoctor:(id)sender {
}

- (IBAction)gynecologistDoctor:(id)sender {
}

- (IBAction)generalPhysicianDoctor:(id)sender {
}
- (IBAction)homeopathyDoctor:(id)sender {
}

- (IBAction)ayurvedaDoctor:(id)sender {
}

- (IBAction)acupunctureDoctor:(id)sender {
}
@end
