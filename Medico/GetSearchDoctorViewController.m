//
//  GetSearchDoctorViewController.m
//  Medico
//
//  Created by Apple on 16/12/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "GetSearchDoctorViewController.h"
#import "GetSearchDoctorCell.h"
#import "DoctorLandingPageView.h"
#import "GetDetailSearchDoctorViewController.h"

@interface GetSearchDoctorViewController ()

@end

@implementation GetSearchDoctorViewController
@synthesize listRadioButton;
@synthesize mapRadioButton;
@synthesize radioButton;
@synthesize map = _map;
@synthesize jsonList;


- (void) homePage:(id)sender{
    DoctorLandingPageView *patient =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:patient animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"GetSearchDoctorViewController.m");
    
    radioButton = NO;
    self.listContentView.hidden = FALSE;
    self.mapContentView.hidden = TRUE;
    UIImage *myImage = [UIImage imageNamed:@"ic_home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Search Doctor";
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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    GetSearchDoctorCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //for(int count = 0;count<_arr.count;count++){
    int row = [indexPath row];
    //    cell.nameLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"name"];
    //    cell.locationLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"location"];
    //    cell.specialtyLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"speciality"];
    //    cell.doctorImage.image = [UIImage imageNamed:@"doctordefault.png"];
    

    
    cell.showDetailsButton.tag = row;
    [cell.showDetailsButton addTarget:self action:@selector(showDetails:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}




-(void)showDetails:(id)sender {
    
    GetDetailSearchDoctorViewController *pdf =
    [self.storyboard instantiateViewControllerWithIdentifier:@"GetDetailSearchDoctorViewController"];
    
    [self.navigationController pushViewController:pdf animated:YES];
    
}





- (IBAction)searchDoctor:(id)sender {
    
}
- (IBAction)listRadio:(id)sender {
    
    [listRadioButton setImage:[UIImage imageNamed:@"ic_radio_button_checked.png"] forState:UIControlStateNormal];
    [mapRadioButton setImage:[UIImage imageNamed:@"ic_radio_button_unchecked.png"] forState:UIControlStateNormal];
    self.mapContentView.hidden = TRUE;
    self.listContentView.hidden = FALSE;
    
}

- (IBAction)mapRadio:(id)sender {
    
    [mapRadioButton setImage:[UIImage imageNamed:@"ic_radio_button_checked.png"] forState:UIControlStateNormal];
    [listRadioButton setImage:[UIImage imageNamed:@"ic_radio_button_unchecked.png"] forState:UIControlStateNormal];
    self.listContentView.hidden = TRUE;
    self.mapContentView.hidden = FALSE;
    
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
