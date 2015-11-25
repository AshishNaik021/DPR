//
//  ManageTemplateForDoctorViewController.m
//  Medico
//
//  Created by Apple on 17/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "ManageTemplateForDoctorViewController.h"
#import "ManageTemplateForDoctorCell.h"
#import "DetailManageTemplateForDoctorViewController.h"


@interface ManageTemplateForDoctorViewController ()

@end

@implementation ManageTemplateForDoctorViewController
@synthesize allProcedureArr;
@synthesize searchButton;
@synthesize searchField;
@synthesize searchResult;


-(IBAction)searchTemplateFunction:(id)sender{
    
    DetailManageTemplateForDoctorViewController *detailTemplate =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DetailManageTemplateForDoctorViewController"];
    [self.navigationController pushViewController:detailTemplate animated:YES];
    
}

-(void)fetchAllTemplates{
    NSLog(@"The fetchJson method is called.........");
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSString *emailid = [[NSUserDefaults standardUserDefaults] objectForKey:@"loggedInEmail"];
    
    NSLog(@"email id for logged in user...%@",emailid);
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/getDoctorProcedures?doctorId=%@",emailid];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    //NSMutableArray *arratList = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"Data in Array==============%@",responseStr);
    
    /* ---------- Code for Writing response data into the file -------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getDoctorProcedures.json"];
    [responseStr writeToFile:docPath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
    
    /* ---------- End of Code for Writing response data into the file -------------- */
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"ManageTemplateForDoctorViewController.m");
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(searchTemplateFunction:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:addButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    self.navigationItem.title = @"Manage Template";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    
    [self fetchAllTemplates];
    
    /* ----------------- Read File For Parse JSON Data -------------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getDoctorProcedures.json"];
    NSLog(@"%@",docPath);
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:docPath encoding:NSUTF8StringEncoding error:NULL];
    
    NSError *error = nil;
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    
    allProcedureArr = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&error];

    // Do any additional setup after loading the view.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return allProcedureArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    ManageTemplateForDoctorCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   
     // Configure the cell...
    cell.procedureNameLabel.text = [[allProcedureArr objectAtIndex:indexPath.row]objectForKey:@"procedureName"];
    return cell;
    
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"ShowDetails"]) {
    DetailManageTemplateForDoctorViewController *detailmanagetemplate = [segue destinationViewController];
    NSIndexPath *myIndex = [self.tableView indexPathForSelectedRow];
    
        int row = [myIndex row];
        
     detailmanagetemplate.procedureName = [NSString stringWithFormat:@"%@",[[allProcedureArr objectAtIndex:row]objectForKey:@"procedureName"]];
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

-(void)errorMessageSearchNotValid{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please enter Procedure Name." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

- (IBAction)searchTemplate:(id)sender {
    if ([searchField.text isEqualToString:@""]) {
        [self errorMessageSearchNotValid];
    }
    else{
    searchResult = searchField.text;
    NSLog(@"search String=%@",searchResult);


    }
}
@end
