//
//  DoctorManageAppointmentsViewController.m
//  Medico
//
//  Created by APPLE on 21/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DoctorManageAppointmentsViewController.h"
#import "DoctorManageAppointmentCell.h"
#import "DoctorLandingPageView.h"
#import "DoctorDetailManageAppointmentViewController.h"

@interface DoctorManageAppointmentsViewController ()

@end

@implementation DoctorManageAppointmentsViewController
@synthesize jsonList;
@synthesize slot1Arr;
@synthesize slot2Arr;
@synthesize slot3Arr;


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
    
    self.navigationItem.title = @"Manage Appointments";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"getAllDoctorClinics" ofType:@"json"];
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:NULL];
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    NSError *e;
    jsonList = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&e];
   
    NSDictionary *jsonSubDict = [NSJSONSerialization JSONObjectWithData:[myJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&e];
    slot1Arr = [jsonSubDict valueForKeyPath:@"shift1"];
    slot2Arr = [jsonSubDict valueForKeyPath:@"shift2"];
    slot3Arr = [jsonSubDict valueForKeyPath:@"shift3"];
    
    //NSLog(@"total list of array.......%@",[[jsonList objectAtIndex:1] objectForKey:@"clinicName"]);
    NSLog(@"total list of array.......%lu",(unsigned long)jsonList.count);
    NSLog(@"total list of array.......%@",[jsonList valueForKey:@"clinicName"]);


    NSLog(@"total list of shift1 array.......%@",[slot1Arr valueForKey:@"appointmentCount"]);
    NSLog(@"total list of shift2 array.......%@",slot2Arr);
    NSLog(@"total list of shift3 array.......%@",slot3Arr);


    
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
    DoctorManageAppointmentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //for(int count = 0;count<_arr.count;count++){
    int row = [indexPath row];
    cell.clinicNameLabel.text = [jsonList valueForKey:@"clinicName"];
    cell.slot1Label.text = [slot1Arr valueForKey:@"shiftTime"];
     cell.slot2Label.text = [slot2Arr valueForKey:@"shiftTime"];
     cell.slot3Label.text = [slot3Arr valueForKey:@"shiftTime"];
  [cell.slot1TotalAppointmentCountButton setTitle:[slot1Arr valueForKey:@"appointmentCount"] forState:UIControlStateNormal];
    [cell.slot2TotalAppointmentCountButton setTitle:[slot2Arr valueForKey:@"appointmentCount"] forState:UIControlStateNormal];
    [cell.slot3TotalAppointmentCountButton setTitle:[slot3Arr valueForKey:@"appointmentCount"] forState:UIControlStateNormal];
    cell.clinicImage.image = [UIImage imageNamed:@"manageClinics.png"];
    cell.downArrowButton.tag = indexPath.row;
    [cell.downArrowButton addTarget:self action:@selector(downArrow:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
    
}
- (IBAction)downArrow:(id)sender {
    DoctorDetailManageAppointmentViewController *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorDetailManageAppointmentViewController"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
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
