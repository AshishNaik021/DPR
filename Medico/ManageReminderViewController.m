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
#import "AddNewReminderForDoctorViewController.h"

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
    NSLog(@"ManageReminderViewController.m");
    [super viewDidLoad];

    spinner = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(150, 225, 20, 30)];
    [spinner setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    spinner.color = [UIColor blueColor];
    spinner.center=self.view.center;
    [self.view addSubview:spinner];

    UIImage *myImage = [UIImage imageNamed:@"ic_home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;

        
    self.navigationItem.title = @"Reminder";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    //    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"getNotifications" ofType:@"json"];
    //    NSString *myJson = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:NULL];
    //    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    //    NSError *e;
    //
    //    NSDictionary *json1 = [NSJSONSerialization JSONObjectWithData:[myJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&e];
    //
    //    reminderArr = [json1 valueForKeyPath:@"reminders"];
    //    NSLog(@"array------%@",reminderArr);
    
    //reminderArr = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&e];
    [self fetchNotification];
    [self scheduleNotificationForDate];
}
-(BOOL)checkInternetConnection{
    //        [self.view endEditing:YES];
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
    NSURL *scriptUrl = [NSURL URLWithString:@"http://www.msftncsi.com/ncsi.txt"];
    NSData *data = [NSData dataWithContentsOfURL:scriptUrl];
    if (data){
        NSLog(@"Device is connected to the internet");
//        [spinner stopAnimating];
        return 1;
    } else{
        [spinner stopAnimating];
        NSLog(@"Device is not connected to the internet");
        return 0;
    }
}

-(void)threadStartAnimating:(id)data
{
    [spinner startAnimating];
    [self.view setUserInteractionEnabled:NO];
    
}

-(void)fetchNotification{
    NSLog(@"fetchNotification Method is called....");
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSString *emailid = [[NSUserDefaults standardUserDefaults] valueForKey:@"loggedInEmail"];
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/getNotification?email=%@",emailid];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSData *json = [responseStr dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *json1 = [NSJSONSerialization JSONObjectWithData:json options:NSJSONWritingPrettyPrinted error:&error];
    reminderArr = [json1 valueForKeyPath:@"reminders"];
    
    //NSMutableArray *arratList = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"Data in Array==============%@",reminderArr);
    for (int i =0 ; i<[reminderArr count]; i++) {
        NSLog(@"Data in Array at index %d ==============%@",i,reminderArr[i]);
    }
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
        // NSLog(@"aat");
        cell.reminderTitleLabel.text = @"Unknown";
        //rNSLog(@"baher");
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
//test for alarm
- (void)scheduleNotificationForDate
{
    
    NSLog(@"alarm");
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    if (localNotif == nil) return;
    NSDate *fireTime = [[NSDate date] addTimeInterval:10]; // adds 10 secs
    localNotif.fireDate = fireTime;
    localNotif.alertBody = @"Reminder!";
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
    NSLog(@"alarm1");
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

- (IBAction)add:(id)sender {
    NSLog(@"Add");
    AddNewReminderForDoctorViewController *addReminder =
    [self.storyboard instantiateViewControllerWithIdentifier:@"AddNewReminderForDoctorViewController"];
    [self.navigationController pushViewController:addReminder animated:YES];
    if([self checkInternetConnection]){
        [spinner stopAnimating];
    }
    else{
        [spinner stopAnimating];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please try again later!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}
- (IBAction)remove:(id)sender {
    NSLog(@"Remove");
    if([self checkInternetConnection]){
        [spinner stopAnimating];
    }
    else{
        [spinner stopAnimating];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please try again later!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

-(void)addNotification{
    
}
-(void)removeNotification{
    
}
@end
