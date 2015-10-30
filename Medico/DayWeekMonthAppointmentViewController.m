//
//  DayWeekMonthAppointmentViewController.m
//  Medico
//
//  Created by APPLE on 30/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DayWeekMonthAppointmentViewController.h"
#import "DoctorLandingPageView.h"

@interface DayWeekMonthAppointmentViewController ()

@end

@implementation DayWeekMonthAppointmentViewController
@synthesize dayContentView;
@synthesize dayTabButton;
@synthesize weekContentView;
@synthesize weekTabButton;
@synthesize monthContentView;
@synthesize monthTabButton;


- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
     UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton,addButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Manage Appointments";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    weekContentView.hidden = TRUE;
    monthContentView.hidden = TRUE;
    self.dayTabButton.titleLabel.textColor = [UIColor blackColor];
    [self.dayTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    


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

- (IBAction)dayTab:(id)sender {
    dayContentView.hidden = FALSE;
    weekContentView.hidden = TRUE;
    monthContentView.hidden = TRUE;
    [dayTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [weekTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [monthTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    
}

- (IBAction)weekTab:(id)sender {
    weekContentView.hidden = FALSE;
    dayContentView.hidden = TRUE;
    monthContentView.hidden = TRUE;
    [weekTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [dayTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [monthTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
}

- (IBAction)monthTab:(id)sender {
    monthContentView.hidden = FALSE;
    weekContentView.hidden = TRUE;
    dayContentView.hidden = TRUE;
    [monthTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [weekTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [dayTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
}

- (IBAction)monthNextDate:(id)sender {
}

- (IBAction)monthPreviousDate:(id)sender {
}

- (IBAction)dayNextDate:(id)sender {
}

- (IBAction)dayPreviousDate:(id)sender {
}

- (IBAction)weekNextDate:(id)sender {
}

- (IBAction)weekPreviousDate:(id)sender {
}

- (IBAction)weekDay1:(id)sender {
}

- (IBAction)weekDay2:(id)sender {
}

- (IBAction)weekDay3:(id)sender {
}

- (IBAction)weekDay4:(id)sender {
}

- (IBAction)weekDay5:(id)sender {
}

- (IBAction)weekDay6:(id)sender {
}

- (IBAction)weekDay7:(id)sender {
}
@end
