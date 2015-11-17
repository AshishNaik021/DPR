//
//  TemplateDetailViewController.m
//  Medico
//
//  Created by APPLE on 07/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "TemplateDetailViewController.h"
#import "TemplateDetailCell.h"
#import "EditTemplateView.h"

@interface TemplateDetailViewController ()

@end

@implementation TemplateDetailViewController
@synthesize templateNameLabel;
@synthesize templateName = _templateName;
@synthesize templateId = _templateId;
@synthesize templateDataArr;


-(void)fetchTemplateFields{
    NSLog(@"The fetchJson method is called.........");
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/getAllFields?id=%@",_templateId];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    
    NSLog(@"Data in Array==============%@",responseStr);
    
    /* ---------- Code for Writing response data into the file -------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getAllFields.json"];
    [responseStr writeToFile:docPath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
    
    /* ---------- End of Code for Writing response data into the file -------------- */
    
    
}

-(IBAction)editTemplateAction:(id)sender{
    
    EditTemplateView *editTemplate =
    [self.storyboard instantiateViewControllerWithIdentifier:@"EditTemplateView"];
    editTemplate.editFieldArr = templateDataArr;
    [self.navigationController pushViewController:editTemplate animated:YES];
    
}

- (void)viewDidLoad {
    NSLog(@"TemplateDetailViewController.m");
    [super viewDidLoad];
    
    NSLog(@"template id is =%@",_templateId);
    
    //UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleDone target:self action:@selector(editTemplateAction:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:editButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    self.navigationItem.title = _templateName;
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    templateNameLabel.text = _templateName;

    
    [self fetchTemplateFields];
    /* ----------------- Read File For Parse JSON Data -------------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getAllFields.json"];
    NSLog(@"%@",docPath);
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:docPath encoding:NSUTF8StringEncoding error:NULL];
    
    NSError *error = nil;
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    
    templateDataArr = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&error];
    
    NSLog(@"Array------------%@",templateDataArr);

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return templateDataArr.count;
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TemplateDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1" forIndexPath:indexPath];
//    cell.nameLabel.text = [NSString stringWithFormat:@"Name %ld", (long)indexPath.row];
//    cell.systemNameLabel.text = [NSString stringWithFormat:@"Start %ld", (long)indexPath.row];
//    cell.typeLabel.text = [NSString stringWithFormat:@"End %ld", (long)indexPath.row];
  
        
    
    cell.nameLabel.text = [[templateDataArr objectAtIndex:indexPath.row]objectForKey:@"fieldDisplayName"];
    cell.systemNameLabel.text = [[templateDataArr objectAtIndex:indexPath.row]objectForKey:@"fieldName"];
    cell.typeLabel.text = [[templateDataArr objectAtIndex:indexPath.row]objectForKey:@"fieldType"];
    cell.defaultValueLabel.text = [[templateDataArr objectAtIndex:indexPath.row]objectForKey:@"fieldDefaultValue"];
    
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
