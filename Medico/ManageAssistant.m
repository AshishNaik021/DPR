//
//  ManageAssistant.m
//  Medico
//
//  Created by APPLE on 06/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "ManageAssistant.h"
#import "ManageAssistantCell.h"
#import "DoctorLandingPageView.h"
#import "SearchAssistantView.h"

@interface ManageAssistant ()

@end

@implementation ManageAssistant
@synthesize getAssistantArr;


-(void)searchPage:(id)sender{

    SearchAssistantView *SearchAssistantID =
    [self.storyboard instantiateViewControllerWithIdentifier:@"SearchAssistantID"];
    [self.navigationController pushViewController:SearchAssistantID animated:YES];
    }


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
    NSLog(@"ManageAssistant.m");
    [super viewDidLoad];
    [self fetchAllAssistants];
    
    /* ----------------- Read File For Parse JSON Data -------------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getDoctorAssistant.json"];
    NSLog(@"%@",docPath);
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:docPath encoding:NSUTF8StringEncoding error:NULL];
    
    NSError *error = nil;
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    
    getAssistantArr = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&error];
    
    
    NSLog(@"MY Assistants--------------%@",getAssistantArr);
    
    
    self.tableView.backgroundColor = [ UIColor whiteColor ];//colorWithRed:(145/255.0) green:(207/255.0) blue:(79/255.0) alpha:1];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(searchPage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:addButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    self.navigationController.navigationBar.barTintColor = [UIColor cyanColor];
    
  /*  UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAssistant:)];*/
//    UIImage *searchImage = [UIImage imageNamed:@"home.png"];
//    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc]  initWithImage:searchImage style:UIBarButtonItemStylePlain target:self action:@selector(searchPage:)];
//    
//    UIImage *myImage = [UIImage imageNamed:@"home.png"];
//    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
//    
//    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton,searchButton, nil];
//    self.navigationItem.rightBarButtonItems = buttonArr;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return getAssistantArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    ManageAssistantCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
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



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
