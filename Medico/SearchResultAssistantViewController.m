//
//  SearchResultAssistantViewController.m
//  Medico
//
//  Created by APPLE on 14/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "SearchResultAssistantViewController.h"
#import "SearchAssistantCell.h"
#import "DoctorLandingPageView.h"
#import "AddAssistantView.h"
#import "MBProgressHUD.h"

@interface SearchResultAssistantViewController ()

@end

@implementation SearchResultAssistantViewController
@synthesize assistantName = _assistantName;
@synthesize assistantTotal;

-(void)homePage:(id)sender{
    
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
    
}

-(void)fetchSearchAssistants{
    NSLog(@"The fetchJson method is called.........");
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Processing...";

    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    
    
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/searchAssistants?name=ravi"];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    //NSMutableArray *arratList = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"Data in Array==============%@",responseStr);
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    hud = nil;

 
    /* ---------- Code for Writing response data into the file -------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/searchAssistants.json"];
    [responseStr writeToFile:docPath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
    
    /* ---------- End of Code for Writing response data into the file -------------- */
    
    
}


- (void)viewDidLoad {
    NSLog(@"SearchResultAssistantViewController.m");
    [super viewDidLoad];
    
    UIImage *myImage = [UIImage imageNamed:@"ic_home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Search Assistant";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];

    
    
    
    NSLog(@"The name of assistant is----------%@",_assistantName);
    [self fetchSearchAssistants];
    
    /* ----------------- Read File For Parse JSON Data -------------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/searchAssistants.json"];
    NSLog(@"%@",docPath);
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:docPath encoding:NSUTF8StringEncoding error:NULL];
    
    NSError *error = nil;
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    
    assistantTotal = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&error];
    
    
    NSLog(@"MY Assistants--------------%@",assistantTotal);
    
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return assistantTotal.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    SearchAssistantCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    int row = [indexPath row];
    cell.assistantNameLabel.text = [[assistantTotal objectAtIndex:row] objectForKey:@"name"];
    cell.assistantCityLabel.text = [[assistantTotal objectAtIndex:row] objectForKey:@"location"];
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

- (IBAction)search:(id)sender {
}
- (IBAction)addNewAssistant:(id)sender {
    AddAssistantView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"AddAssistantView"];
    [self.navigationController pushViewController:DoctorHome animated:YES];

}
@end
