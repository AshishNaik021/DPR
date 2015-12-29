//
//  SymptomsHistoryViewController.m
//  Medico
//
//  Created by APPLE on 26/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "SymptomsHistoryViewController.h"
#import "DoctorLandingPageView.h"
#import "SymptomsHistoryCell.h"
#import "MBProgressHUD.h"




@interface SymptomsHistoryViewController ()

@end

@implementation SymptomsHistoryViewController

@synthesize symptomArr;
@synthesize summaryDatePassData = _summaryDatePassData;
@synthesize summaryPatientEmailPassData = _summaryPatientEmailPassData;
@synthesize summaryTimePassData =_summaryTimePassData;
@synthesize summaryDoctorIDPassData = _summaryDoctorIDPassData;


- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}

- (void)viewDidLoad {
    NSLog(@"SymptomsHistoryViewController.m");
    [super viewDidLoad];
    UIImage *myImage = [UIImage imageNamed:@"ic_home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;

    
    self.navigationItem.title = @"Symptoms History";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];

    NSLog(@"Date----------------%@",_summaryDatePassData);
    NSLog(@"Time-----------------%@",_summaryTimePassData);
    NSLog(@"patient Email----------%@",_summaryPatientEmailPassData);
    NSLog(@"DoctorId---------------%@",_summaryDoctorIDPassData);
    

    [self fetchAllSympHistory];
    
    // Do any additional setup after loading the view.
}

-(void)fetchAllSympHistory{
    
    NSLog(@"The fetchJson method is called.........");
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Processing...";
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    // NSString *emailid = emailField.text;
    
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/getAllHistory?doctorId=%@&patientId=%@&appointmentDate=%@&appointmentTime=%@",_summaryDoctorIDPassData,_summaryPatientEmailPassData,_summaryDatePassData,_summaryTimePassData];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    hud = nil;
    
    NSMutableArray *arratList = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"Data in Array+++++++++++++++++++++++++++++++++++++++++++++++++++%@",responseStr);
    
    //    /* ---------- Code for Writing response data into the file -------------- */
    //
    //    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getAllPatientInformation.json"];
    //    NSLog(@"%@",docPath);
    //    [responseStr writeToFile:docPath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
    //
    //    /* ---------- End of Code for Writing response data into the file -------------- */
    //
    
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
    SymptomsHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    int row = [indexPath row];
    
//    if (![[[reminderArr objectAtIndex:row] objectForKey:@"title"] isEqual:[NSNull null]]) {
//        cell.reminderTitleLabel.text = [[reminderArr objectAtIndex:row] objectForKey:@"title"];
//    }
//    else
//    {
//        cell.reminderTitleLabel.text = @"Unknown";
//    }
//    
//    
//    
//    cell.reminderDateLabel.text = [[reminderArr objectAtIndex:row] objectForKey:@"date"];
//    cell.reminderTimeLabel.text = [[reminderArr objectAtIndex:row] objectForKey:@"time"];
    
    
    return cell;
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
