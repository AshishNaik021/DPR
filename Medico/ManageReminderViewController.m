//
//  ManageReminderViewController.m
//  Medico
//
//  Created by APPLE on 24/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "ManageReminderViewController.h"
#import "DoctorLandingPageView.h"
#import "ManageReminderCell.h"
#import "ReminderDetailsViewController.h"

@interface ManageReminderViewController ()

@end

@implementation ManageReminderViewController
@synthesize reminderArr;

- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Reminder";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"getNotifications" ofType:@"json"];
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:NULL];
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    NSError *e;
    
    NSDictionary *json1 = [NSJSONSerialization JSONObjectWithData:[myJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&e];
    
    reminderArr = [json1 valueForKeyPath:@"reminders"];
    NSLog(@"array------%@",reminderArr);
    
    //reminderArr = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&e];
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return reminderArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    ManageReminderCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //for(int count = 0;count<_arr.count;count++){
    int row = [indexPath row];
    
    if (![[[reminderArr objectAtIndex:row] objectForKey:@"title"] isEqual:[NSNull null]]) {
       cell.reminderTitleLabel.text = [[reminderArr objectAtIndex:row] objectForKey:@"title"];
    }
    else
    {
        NSLog(@"aat");
        cell.reminderTitleLabel.text = @"";
        NSLog(@"baher");
    }

    
  //  cell.reminderTitleLabel.text = [[reminderArr objectAtIndex:row] objectForKey:@"title"];
    
    cell.reminderDateLabel.text = [[reminderArr objectAtIndex:row] objectForKey:@"date"];
    cell.reminderTimeLabel.text = [[reminderArr objectAtIndex:row] objectForKey:@"time"];
    
    //[cell.lastVisitedButton setTitle:[NSString stringWithFormat:[[arrDoctor objectAtIndex:row] objectForKey:@"lastVisited"]] forState:UIControlStateNormal];
    
    return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"Details"]) {
        ReminderDetailsViewController *cliniInformation = [segue destinationViewController];
        NSIndexPath *myIndex = [self.tableView indexPathForSelectedRow];
        int row = [myIndex row];
        cliniInformation.detailReminderArray = @[reminderArr[row]];
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
