//
//  ManageTemplateTableViewController.m
//  Medico
//
//  Created by Apple on 05/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "ManageTemplateTableViewController.h"
#import "DetailManageTemplate.h"
#import "DoctorLandingPageView.h"
#import "SearchTemplate.h"
@interface ManageTemplateTableViewController ()

@end

@implementation ManageTemplateTableViewController

- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}
- (void) searchTemplate:(id)sender{
    SearchTemplate *search =
    [self.storyboard instantiateViewControllerWithIdentifier:@"search"];
    [self.navigationController pushViewController:search animated:NO];
    
}


- (void)viewDidLoad {
    NSLog(@"ManageTemplateTableViewController.m");
    [super viewDidLoad];
    
   // self.tableView.backgroundColor = [ UIColor colorWithRed:(145/255.0) green:(207/255.0) blue:(79/255.0) alpha:1];
    
    _templateArr = @[@"Dental Procedures",
                     @"Laparoscopic Procedures",
                     @"Kidney Procedures"];
    
   
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIImage *searchImage = [UIImage imageNamed:@"default.png"];
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc]  initWithImage:searchImage style:UIBarButtonItemStylePlain target:self action:@selector(searchTemplate:)];
    
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    

    
    //UIBarButtonItem *homeButton = [[UIBarButtonItem alloc] initWithImage:@"home.png" style:nil target:self action:nil];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
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
    return _templateArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   /*
    // Configure the cell...
    cell.textLabel.text = [_templateArr objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    */
    
    return cell;
    
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
   
    //if ([[segue identifier] isEqualToString:@"ShowDetails"]) {
        DetailManageTemplate *detailmanagetemplate = [segue destinationViewController];
        NSIndexPath *myIndex = [self.tableView indexPathForSelectedRow];
        int row = [myIndex row];
      /*  detailmanagetemplate.DetailArr = @[_templateArr[row]]
        ;
       detailmanagetemplate.pid = myIndex.row;*/
   // }
}

  /*  NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    DetailManageTemplate *detailManage;
    detailManage = [segue destinationViewController];
    detailManage.DetailArr = _templateArr[path.row];
    detailManage.pid = path.row;
    
    
    
    
    }    */


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
