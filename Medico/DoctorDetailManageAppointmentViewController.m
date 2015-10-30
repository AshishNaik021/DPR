//
//  DoctorDetailManageAppointmentViewController.m
//  Medico
//
//  Created by APPLE on 21/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DoctorDetailManageAppointmentViewController.h"
#import "DoctorLandingPageView.h"

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
@synthesize profileContentView;
@synthesize profileTabButton;
@synthesize appointmentContentView;
@synthesize appointmentTabButton;

- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}

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
    profileContentView.hidden = TRUE;
    appointmentContentView.hidden = FALSE;
    self.appointmentTabButton.titleLabel.textColor = [UIColor blackColor];
    [self.appointmentTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Manage Appointments";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    

    

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

- (IBAction)profileTab:(id)sender {
    self.profileContentView.hidden = FALSE;
    self.appointmentContentView.hidden = TRUE;
    [self.profileTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.appointmentTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
}
- (IBAction)appointmentTab:(id)sender {
    self.appointmentContentView.hidden = FALSE;
    self.profileContentView.hidden = TRUE;
    [self.profileTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [self.appointmentTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    

}
@end
