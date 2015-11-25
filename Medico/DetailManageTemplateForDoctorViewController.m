//
//  DetailManageTemplateForDoctorViewController.m
//  Medico
//
//  Created by Apple on 17/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DetailManageTemplateForDoctorViewController.h"
#import "DetailManageTemplateForDoctorCell.h"
#import "TemplateDetailViewController.h"


@interface DetailManageTemplateForDoctorViewController ()

@end

@implementation DetailManageTemplateForDoctorViewController
@synthesize procedureName = _procedureName;
@synthesize templateArr;


-(void)fetchProcedureTemplates{
    NSLog(@"The fetchJson method is called.........");
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSString *emailid = [[NSUserDefaults standardUserDefaults] objectForKey:@"loggedInEmail"];
    
    NSLog(@"email id for logged in user...%@",emailid);
    NSLog(@"%@",_procedureName);
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/getAllTemplates?id=%@&procedureName=%@",emailid,_procedureName];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
   
    NSLog(@"Data in Array==============%@",responseStr);
    
    /* ---------- Code for Writing response data into the file -------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getAllTemplates.json"];
    [responseStr writeToFile:docPath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
    
    /* ---------- End of Code for Writing response data into the file -------------- */
    
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"DetailManageTemplateForDoctorViewController.m");

    NSLog(@"Name======%@",_procedureName);
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:addButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    self.navigationItem.title = _procedureName;
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    

    
    [self fetchProcedureTemplates];
    
    /* ----------------- Read File For Parse JSON Data -------------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getAllTemplates.json"];
    NSLog(@"%@",docPath);
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:docPath encoding:NSUTF8StringEncoding error:NULL];
    
    NSError *error = nil;
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    
    templateArr = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&error];
    
    NSLog(@"Array------------%@",templateArr);

    // Do any additional setup after loading the view.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return templateArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    DetailManageTemplateForDoctorCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
        cell.templateLabel.text = [[templateArr objectAtIndex:indexPath.row]objectForKey:@"templateName"];
    return cell;
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"ShowDetails"]) {
        TemplateDetailViewController *detailmanagetemplate = [segue destinationViewController];
        NSIndexPath *myIndex = [self.tableView indexPathForSelectedRow];
        
        int row = [myIndex row];
        
        detailmanagetemplate.templateName = [NSString stringWithFormat:@"%@",[[templateArr objectAtIndex:row]objectForKey:@"templateName"]];
        detailmanagetemplate.templateId = [NSString stringWithFormat:@"%@",[[templateArr objectAtIndex:row]objectForKey:@"templateId"]];
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
