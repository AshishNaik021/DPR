//
//  DoctorManageFinanceViewController.m
//  Medico
//
//  Created by APPLE on 24/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DoctorManageFinanceViewController.h"
#import "DoctorManageFinanceCell.h"
#import "DoctorLandingPageView.h"
#import "DoctorDetailManageFinanceViewController.h"

@interface DoctorManageFinanceViewController ()

@end

@implementation DoctorManageFinanceViewController
@synthesize dateArr;
@synthesize amountArr;
@synthesize totalArr;

- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}


- (void)viewDidLoad {
    NSLog(@"DoctorManageFinanceViewController.m");
    [super viewDidLoad];
    
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Manage Finance";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    dateArr = @[@"25-Jan-2014",
               @"20-Feb-2013",
               @"02-Mar-2015",
               @"10-Jan-2014"];
    
    amountArr = @[@"200 USD",
                  @"100 USD",
                  @"500 USD",
                  @"800 USD"];
    
    totalArr =@[@"2",
                @"4",
                @"2",
                @"3"];

    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == 0)
        return dateArr.count;
    if (section == 1)
        return dateArr.count;
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    // DoctorManageAppointmentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //for(int count = 0;count<_arr.count;count++){
    int row = [indexPath row];
    
    DoctorManageFinanceCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    /*
    if (indexPath.section == 0)
        cell.dateLabel.text = dateArr[row];
    cell.amountLabel.text = amountArr[row];
    cell.totalLabel.text = totalArr[row];
    
    if (indexPath.section == 1)
    cell.dateLabel.text = dateArr[row];
    cell.amountLabel.text =amountArr[row];
    cell.totalLabel.text =totalArr[row];
 */
    return cell;
}




- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0)
        return @"Year 2015";
    if (section == 1)
        return @"Year 2014";
    return @"undefined";
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"Details"]) {
        DoctorDetailManageFinanceViewController *cliniInformation = [segue destinationViewController];
        NSIndexPath *myIndex = [self.tableView indexPathForSelectedRow];
        int row = [myIndex row];
        //cliniInformation.detailReminderArray = @[reminderArr[row]];
    }
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
