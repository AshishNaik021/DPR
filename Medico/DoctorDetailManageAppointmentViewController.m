//
//  DoctorDetailManageAppointmentViewController.m
//  Medico
//
//  Created by APPLE on 21/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DoctorDetailManageAppointmentViewController.h"

@interface DoctorDetailManageAppointmentViewController ()

@end

@implementation DoctorDetailManageAppointmentViewController
@synthesize clinicNameLabel;
@synthesize slot1AppLabel;
@synthesize slot1totalAppButton;
@synthesize slot2AppLabel;
@synthesize slot2TotalAppButton;
@synthesize slot3AppLabel;
@synthesize slot3TotalAppButton;
@synthesize detailAppArr;
@synthesize detailSlot1;
@synthesize detailSlot2;
@synthesize detailSlot3;


- (void)viewDidLoad {
    [super viewDidLoad];
//    clinicNameLabel.text = [detailAppArr[0] objectForKey:@"clinicName"];
//    slot1AppLabel.text = [detailSlot1[0] objectForKey:@"shiftTime"];
//    slot2AppLabel.text = [detailSlot2[0] objectForKey:@"shiftTime"];
//     slot3AppLabel.text = [detailSlot3[0] objectForKey:@"shiftTime"];
//    [slot1totalAppButton setTitle:[detailSlot1[0] objectForKey:@"appointmentCount"] forState:UIControlStateNormal];
//    [slot2TotalAppButton setTitle:[detailSlot2[0] objectForKey:@"appointmentCount"] forState:UIControlStateNormal];
//    [slot3TotalAppButton setTitle:[detailSlot3[0] objectForKey:@"appointmentCount"] forState:UIControlStateNormal];
//
    

    // Do any additional setup after loading the view.
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
