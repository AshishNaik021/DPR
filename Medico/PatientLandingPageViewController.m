//
//  PatientLandingPageViewController.m
//  Medico
//
//  Created by APPLE on 15/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientLandingPageViewController.h"
#import "PatientLandingCell.h"

@interface PatientLandingPageViewController ()

@end

@implementation PatientLandingPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _image = @[@"default.png",
               @"default.png",
               @"default.png",
               @"default.png"];
    
    _titleName = @[@"Doctor Consultations",
                   @"Manage Appointments",
                   @"Clinics and Labs",
                   @"Medicine Alarm"];
    
    _total = @[@"2",
               @"4",
               @"10",
               @"5"];
    self.navigationItem.title = @"Welcome";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _titleName.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    PatientLandingCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //for(int count = 0;count<_arr.count;count++){
    int row = [indexPath row];
    cell.titleLabel.text = _titleName[row];
    cell.numberLabel.text = _total[row];
    cell.image.image = [UIImage imageNamed:_image[row]];
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

- (IBAction)logout:(id)sender {
}
@end
