//
//  DetailManageTemplate.m
//  Medico
//
//  Created by APPLE on 05/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DetailManageTemplate.h"
#import "TemplateDetailView.h"
#import "DoctorLandingPageView.h"

@interface DetailManageTemplate ()

@end

@implementation DetailManageTemplate
- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}

- (void)viewDidLoad {
        [super viewDidLoad];
    
    
    if (_pid == 0) {
        _DentalArr = @[@"Dental Flush",
                       @"Cavity Filling",
                       @"Brace Fixing"];
        self.navigationItem.title = _DentalArr[0];
    }
    if (_pid == 1) {
        _DentalArr = @[@"Laparoscopic 1",
                       @"Laparoscopic 2",
                       @"Laparoscopic 3"];
        self.navigationItem.title = _DentalArr[1];
    }
    if (_pid == 2) {
        _DentalArr = @[@"Kidey 1",
                       @"Kidey 2",
                       @"Kidey 3"];
        self.navigationItem.title = _DentalArr[2];
    }
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    
    
    //UIBarButtonItem *homeButton = [[UIBarButtonItem alloc] initWithImage:@"home.png" style:nil target:self action:nil];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton,addButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;

    /*
    _DentalArr = @[@"Dental Flush",
                     @"Cavity Filling",
                     @"Brace Fixing"];
    
    _LaparoscopicArr = @[@"Laparoscopic 1",
                         @"Laparoscopic 2",
                         @"Laparoscopic 3"];
    
    _KidneyArr = @[@"Kidey 1",
                   @"Kidey 2",
                   @"Kidey 3"];
*/
    
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
    return _DentalArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"DetailTableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    cell.textLabel.text = [_DentalArr objectAtIndex:indexPath.row];
    
    
    
    return cell;
    
}
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    /*
     if ([[segue identifier] isEqualToString:@"ShowDetails"]) {
     DetailManageTemplate *detailmanagetemplate = [segue destinationViewController];
     NSIndexPath *myIndex = [self.tableView indexPathForSelectedRow];
     int row = [myIndex row];
     
     }
     */
    
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    TemplateDetailView *templateDetail;
    templateDetail = [segue destinationViewController];
    templateDetail.var = path.row;
    
    
    
    
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"DetailTableCell";
    DetailManageTemplateCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    int row = [indexPath row];
    
    cell.manageLabel.text = _DentalArr[row];
    
    
    
    return cell;
    
}
*/


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
