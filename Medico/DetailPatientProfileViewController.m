//
//  DetailPatientProfileViewController.m
//  Medico
//
//  Created by APPLE on 10/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DetailPatientProfileViewController.h"
#import "DoctorLandingPageView.h"
#import "DetailPatientProfileCell.h"

@interface DetailPatientProfileViewController ()

@end

@implementation DetailPatientProfileViewController
@synthesize jsonList;

- (IBAction)profileTab:(id)sender {
//    self.profileContainerView.hidden = FALSE;
//    self.appointmentContainerView.hidden = TRUE;
//    self.appointmentTabButton.backgroundColor = [UIColor clearColor];
//    self.profileTabButton.backgroundColor = [UIColor colorWithRed:(212/255.0) green:(255/255.0) blue:(203/255.0) alpha:1];
    self.profileView.hidden = FALSE;
    self.appointmentView.hidden = TRUE;
    [self.profileTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.appointmentTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
}

- (IBAction)appointmentTab:(id)sender {
//    self.appointmentContainerView.hidden = FALSE;
//    self.profileContainerView.hidden = TRUE;
//    self.profileTabButton.backgroundColor = [UIColor clearColor];
//    self.appointmentTabButton.backgroundColor = [UIColor colorWithRed:(212/255.0) green:(255/255.0) blue:(203/255.0) alpha:1];
    self.appointmentView.hidden = FALSE;
    self.profileView.hidden = TRUE;
    [self.profileTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [self.appointmentTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    

}

- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _patientNameLabel.text = [[_detailArr objectAtIndex:0] objectForKey:@"name"];
    _patientSpecialityField.text = [[_detailArr objectAtIndex:0] objectForKey:@"speciality"];
    _lastVisitedField.text = [[_detailArr objectAtIndex:0] objectForKey:@"lastVisited"];
   _patientPicture.image = [UIImage imageNamed:@"patientProfile.png"];
    
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Patient Profile";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    self.appointmentView.hidden = TRUE;
    
    self.profileTabButton.titleLabel.textColor = [UIColor blackColor];
    [self.profileTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"getAllDoctorPatientClinics" ofType:@"json"];
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:NULL];
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    NSError *e;
    jsonList = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&e];
    NSLog(@"The Array=================%@",jsonList);
    NSLog(@"name of clinic===========%@",[[jsonList objectAtIndex:0]objectForKey:@"slot1"]);
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
        return jsonList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    // DoctorManageAppointmentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //for(int count = 0;count<_arr.count;count++){
    
    DetailPatientProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    int row = [indexPath row];

   
    cell.clinicNameLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"clinicName"];
    cell.clinicCityLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"clinicLocation"];
    cell.mobileNoLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"contactNumber"];
    NSLog(@"Slot1:::%@",[[jsonList objectAtIndex:row] objectForKey:@"slot1"]);
//    cell.slot1Text.text = [[jsonList objectAtIndex:row] objectForKey:@"slot1"];
//    cell.slot2Text.text = [[jsonList objectAtIndex:row] objectForKey:@"slot2"];
//    cell.slot3Text.text = [[jsonList objectAtIndex:row] objectForKey:@"slot3"];

    
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
