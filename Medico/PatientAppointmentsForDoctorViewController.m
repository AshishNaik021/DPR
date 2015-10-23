//
//  PatientAppointmentsForDoctorViewController.m
//  Medico
//
//  Created by APPLE on 23/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientAppointmentsForDoctorViewController.h"
#import "DoctorLandingPageView.h"
#import "PatientAppointmentsForDoctorCell.h"

@interface PatientAppointmentsForDoctorViewController ()

@end

@implementation PatientAppointmentsForDoctorViewController
@synthesize jsonList;

- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Appiontments";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"getAllPatientAppointment" ofType:@"json"];
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:NULL];
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    NSError *e;
    jsonList = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&e];
    

    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == 0)
        return jsonList.count;
    if (section == 1)
        return jsonList.count;
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
   // DoctorManageAppointmentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //for(int count = 0;count<_arr.count;count++){
    int row = [indexPath row];

    PatientAppointmentsForDoctorCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath.section == 0)
        cell.bookDateLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"appointmentDate"];
        cell.bookTimeLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"bookTime"];
        cell.visitTypeLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"visitType"];
    
    if (indexPath.section == 1)
        cell.bookDateLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"appointmentDate"];
    cell.bookTimeLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"bookTime"];
    cell.visitTypeLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"visitType"];
    
    return cell;
}




- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0)
        return @"Year 2015";
    if (section == 1)
        return @"Year 2014";
    return @"undefined";
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
