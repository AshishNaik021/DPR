//
//  PatientDetailSearchClinicViewController.m
//  Medico
//
//  Created by Apple on 10/12/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientDetailSearchClinicViewController.h"
#import "PatientDetailSearchClinicCell.h"
#import "PatientLandingPageViewController.h"
#import "PatientClinicProfileAndAppointmentsViewController.h"
#import "PatientYearlyPDFListOfClinicLabViewController.h"

@interface PatientDetailSearchClinicViewController ()

@end

@implementation PatientDetailSearchClinicViewController
@synthesize listRadioButton;
@synthesize mapRadioButton;
@synthesize radioButton;
@synthesize map = _map;


- (void) homePage:(id)sender{
    PatientLandingPageViewController *patient =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientLandingPageViewController"];
    [self.navigationController pushViewController:patient animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"PatientDetailSearchClinicViewController.m");
    radioButton = NO;
    self.listContentView.hidden = FALSE;
    self.mapContentView.hidden = TRUE;
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Search Clinic/Labs";
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
    PatientDetailSearchClinicCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //for(int count = 0;count<_arr.count;count++){
    int row = [indexPath row];
    //    cell.nameLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"name"];
    //    cell.locationLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"location"];
    //    cell.specialtyLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"speciality"];
    //    cell.doctorImage.image = [UIImage imageNamed:@"doctordefault.png"];
    
    cell.getAllAppointmentButton.tag = row;
    [cell.getAllAppointmentButton addTarget:self action:@selector(getAllAppointment:) forControlEvents:UIControlEventTouchUpInside];
    
//    cell.bookOnlineButton.tag = row;
//    [cell.bookOnlineButton addTarget:self action:@selector(bookOnline:) forControlEvents:UIControlEventTouchUpInside];
//    
    cell.showDetailsButton.tag = row;
    [cell.showDetailsButton addTarget:self action:@selector(showDetails:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (void)showDetails:(id)sender {
    
    PatientClinicProfileAndAppointmentsViewController *profile =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientClinicProfileAndAppointmentsViewController"];
    [self.navigationController pushViewController:profile animated:YES];
}

- (void)getAllAppointment:(id)sender {
    
    PatientYearlyPDFListOfClinicLabViewController *pdf =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientYearlyPDFListOfClinicLabViewController"];
    [self.navigationController pushViewController:pdf animated:YES];
}

- (IBAction)listRadio:(id)sender {
    
    [listRadioButton setImage:[UIImage imageNamed:@"checkRadio.png"] forState:UIControlStateNormal];
    [mapRadioButton setImage:[UIImage imageNamed:@"unchechRadio.png"] forState:UIControlStateNormal];
    self.mapContentView.hidden = TRUE;
    self.listContentView.hidden = FALSE;
    
}

- (IBAction)mapRadio:(id)sender {
    
    [mapRadioButton setImage:[UIImage imageNamed:@"checkRadio.png"] forState:UIControlStateNormal];
    [listRadioButton setImage:[UIImage imageNamed:@"unchechRadio.png"] forState:UIControlStateNormal];
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
