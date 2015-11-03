//
//  ManageDoctorsClinicSettingsViewController.m
//  Medico
//
//  Created by APPLE on 12/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "ManageDoctorsClinicSettingsViewController.h"
#import "ManageDoctorsClinicSettingsCell.h"

@interface ManageDoctorsClinicSettingsViewController ()

@end

@implementation ManageDoctorsClinicSettingsViewController

- (void)viewDidLoad {
    NSLog(@"ManageDoctorsClinicSettingsViewController.m");
    [super viewDidLoad];
    self.navigationItem.title = @"Manage Clinics";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
      [[self navigationItem] setBackBarButtonItem:backButton];
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"ClinicList" ofType:@"json"];
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:NULL];
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[myJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    _dataArr = [json valueForKeyPath:@"ClinicList"];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:addButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    self.navigationController.navigationBar.barTintColor = [UIColor cyanColor];

    
    
    // Do any additional setup after loading the view.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    ManageDoctorsClinicSettingsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
   /*
    //for(int count = 0;count<_arr.count;count++){
    int row = [indexPath row];
    cell.clinicNameLabel.text = [[_dataArr objectAtIndex:row] objectForKey:@"Name"];
    cell.clinicCityLabel.text = [[_dataArr objectAtIndex:row] objectForKey:@"Location"];
    cell.doctorImage.image = [UIImage imageNamed:@"manageClinics.png"];
    */
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
