//
//  PatientDetailSearchDoctorViewController.m
//  Medico
//
//  Created by APPLE on 20/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientDetailSearchDoctorViewController.h"
#import "PatientDetailSearchDoctorCell.h"
#import "DoctorLandingPageView.h"
#import "DetailPatientDoctorConsultationsViewController.h"
#import "YearlyCountAppointmentForPatientDoctorConsultationViewController.h"

@interface PatientDetailSearchDoctorViewController ()

@end

@implementation PatientDetailSearchDoctorViewController
@synthesize listRadioButton;
@synthesize mapRadioButton;
@synthesize radioButton;
@synthesize map = _map;
@synthesize jsonList;

- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}


- (void)viewDidLoad {
    NSLog(@"PatientDetailSearchDoctorViewController.m");
    [super viewDidLoad];
    radioButton = NO;
    self.listContentView.hidden = FALSE;
    self.mapContentView.hidden = TRUE;
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Search Doctor";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
   /*
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"searchDoctor" ofType:@"json"];
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:NULL];
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    NSError *e;
    jsonList = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&e];
    */
    

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
    PatientDetailSearchDoctorCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //for(int count = 0;count<_arr.count;count++){
    int row = [indexPath row];
//    cell.nameLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"name"];
//    cell.locationLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"location"];
//    cell.specialtyLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"speciality"];
//    cell.doctorImage.image = [UIImage imageNamed:@"doctordefault.png"];
    
    cell.getAllAppointmentButton.tag = row;
    [cell.getAllAppointmentButton addTarget:self action:@selector(getAllAppointment:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.bookOnlineButton.tag = row;
    [cell.bookOnlineButton addTarget:self action:@selector(bookOnline:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.showDetailsButton.tag = row;
    [cell.showDetailsButton addTarget:self action:@selector(showDetails:) forControlEvents:UIControlEventTouchUpInside];

return cell;
}

-(void)getAllAppointment:(id)sender {
    
    YearlyCountAppointmentForPatientDoctorConsultationViewController *pdf =
    [self.storyboard instantiateViewControllerWithIdentifier:@"YearlyCountAppointmentForPatientDoctorConsultationViewController"];
    
    [self.navigationController pushViewController:pdf animated:YES];
    
}

-(void)bookOnline:(id)sender {
    
     DetailPatientDoctorConsultationsViewController *pdf =
     [self.storyboard instantiateViewControllerWithIdentifier:@"DetailPatientDoctorConsultationsViewController"];
    pdf.value = @"a";
     [self.navigationController pushViewController:pdf animated:YES];
    
}

-(void)showDetails:(id)sender {
    
     DetailPatientDoctorConsultationsViewController *pdf =
     [self.storyboard instantiateViewControllerWithIdentifier:@"DetailPatientDoctorConsultationsViewController"];
    
     [self.navigationController pushViewController:pdf animated:YES];
    
}





- (IBAction)searchDoctor:(id)sender {
    
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
@end
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

