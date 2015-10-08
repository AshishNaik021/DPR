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
#import "SearchAssistant.h"

@interface ManageAssistant ()

@end

@implementation ManageAssistant

-(void)searchPage:(id)sender{

    SearchAssistant *SearchAssistantID =
    [self.storyboard instantiateViewControllerWithIdentifier:@"SearchAssistantID"];
    [self.navigationController pushViewController:SearchAssistantID animated:YES];
    }


-(void)homePage:(id)sender{
    
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [ UIColor colorWithRed:(145/255.0) green:(207/255.0) blue:(79/255.0) alpha:1];
    
    _assistantNameArr = @[@"Pooja Shah",
                     @"Ankita Oza",
                     @"Priya Sonone",
                     @"Neha Dhawale"];
    
    _assistantCityArr = @[@"Pune, India",
                          @"Pune, India",
                          @"Mumbai, India",
                          @"Nagpur, India"];
    
    _assistantProfileArr = @[@"Lab Assistent",
                             @"Nurse",
                             @"Nurse",
                             @"Lab Assistent"];
    
   /* UIImage *assistantImage = [UIImage imageNamed: @"assistance.png"];
    [_assistantImg setImage:assistantImage];
    
    UIImage *btnImage = [UIImage imageNamed:@"delete.png"];
    [_deleteAssistantButton setImage:btnImage forState:UIControlStateNormal];
    */
    
    
  /*  UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAssistant:)];*/
    UIImage *searchImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc]  initWithImage:searchImage style:UIBarButtonItemStylePlain target:self action:@selector(searchPage:)];
    
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton,searchButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
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
    return _assistantNameArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    ManageAssistantCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    int row = [indexPath row];
    cell.assistantNameLabel.text = _assistantNameArr[row];
    cell.assistantCityLabel.text = _assistantCityArr[row];
    cell.assistantProfileLabel.text = _assistantProfileArr[row];
    cell.assistantImg.image = [UIImage imageNamed:@"assistance.png"];
    cell.deleteAssistantButton = _assistantNameArr[row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
