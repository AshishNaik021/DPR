//
//  PatientLandingPageViewController.m
//  Medico
//
//  Created by APPLE on 15/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientLandingPageViewController.h"
#import "PatientLandingCell.h"
#import "LoginPage.h"

@interface PatientLandingPageViewController ()

@end

@implementation PatientLandingPageViewController
@synthesize patientName = _patientName;
@synthesize patientEmail = _patientEmail;
@synthesize pNameLabel;

-(void)setName{
    //    NSString *cameFrom = [self navigationController.v]
    //    NSLog(@"%@",[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2]);
    //
    //    NSString *string = [NSString stringWithFormat:[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2]];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    if ([[ud objectForKey:@"loggedInUserType"] isEqualToString:@"Patient"]) {
        pNameLabel.text = [ud objectForKey:@"loggedInPatient"];
        self.patientName = [ud objectForKey:@"loggedInPatient"];
        NSLog(@"Login name was set");
    }
    else
        NSLog(@"Name Not Set");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _image = @[@"default.png",
               @"default.png",
               @"default.png",
               @"default.png"];
    
    _titleName = @[@"Doctor Consultations",
                   @"Manage Appointments",
                   @"Clinics and Labs",
                   @"Medicine Alarm"];
    
    _total = @[@"2",
               @"4",
               @"10",
               @"5"];
    self.navigationItem.title = @"Welcome";
//    pNameLabel.text = _patientName;
    self.navigationItem.hidesBackButton = YES;

//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
  //  [[self navigationItem] setBackBarButtonItem:backButton];
    [self setName];

    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _titleName.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    PatientLandingCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //for(int count = 0;count<_arr.count;count++){
    int row = [indexPath row];
    cell.titleLabel.text = _titleName[row];
    cell.numberLabel.text = _total[row];
    cell.image.image = [UIImage imageNamed:_image[row]];
    return cell;
    
}




- (IBAction)logout:(id)sender {
    
    LoginPage *loginPage =
    [self.storyboard instantiateViewControllerWithIdentifier:@"LoginPage"];
    [self.navigationController pushViewController:loginPage animated:YES];
    NSLog(@"Logged Out");    
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
