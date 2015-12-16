//
//  DoctorManageAssistantViewController.m
//  Medico
//
//  Created by Apple on 16/12/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DoctorManageAssistantViewController.h"
#import "DoctorLandingPageView.h"
#import "DoctorManageAssistantCell.h"
#import "SearchResultAssistantViewController.h"

@interface DoctorManageAssistantViewController ()

@end

@implementation DoctorManageAssistantViewController
@synthesize getAssistantArr;

-(void)homePage:(id)sender{
    
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
    
}

-(void)fetchAllAssistants{
    NSLog(@"The fetchJson method is called.........");
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSString *emailid = [[NSUserDefaults standardUserDefaults] objectForKey:@"loggedInEmail"];
    NSLog(@"email id for logged in user...%@",emailid);
    
    
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/getDoctorAssistant?id=%@",emailid];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    //NSMutableArray *arratList = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"Data in Array==============%@",responseStr);
    
    /* ---------- Code for Writing response data into the file -------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getDoctorAssistant.json"];
    [responseStr writeToFile:docPath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
    
    /* ---------- End of Code for Writing response data into the file -------------- */
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"DoctorManageAssistantViewController.m");
    [self fetchAllAssistants];
    
    
    UIImage *myImage = [UIImage imageNamed:@"ic_home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Manage Assistant";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    /* ----------------- Read File For Parse JSON Data -------------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getDoctorAssistant.json"];
    NSLog(@"%@",docPath);
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:docPath encoding:NSUTF8StringEncoding error:NULL];
    
    NSError *error = nil;
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    
    getAssistantArr = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&error];
    
    
    NSLog(@"MY Assistants--------------%@",getAssistantArr);

    // Do any additional setup after loading the view.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return getAssistantArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    DoctorManageAssistantCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    int row = [indexPath row];
    
    if (![[[getAssistantArr objectAtIndex:row] objectForKey:@"name"] isEqual:[NSNull null]]){
        cell.assistantNameLabel.text = [[getAssistantArr objectAtIndex:row] objectForKey:@"name"];
    }
    else{
        cell.assistantNameLabel.text = @"Unknown";
    }
    
    if (![[[getAssistantArr objectAtIndex:row] objectForKey:@"location"] isEqual:[NSNull null]]){
        cell.assistantCityLabel.text = [[getAssistantArr objectAtIndex:row] objectForKey:@"location"];
    }
    else{
        cell.assistantCityLabel.text = @"Unknown";
    }
    
    
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

- (IBAction)addAssistant:(id)sender {
    
    SearchResultAssistantViewController *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"SearchResultAssistantViewController"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
}
- (IBAction)remove:(id)sender {
}
@end
