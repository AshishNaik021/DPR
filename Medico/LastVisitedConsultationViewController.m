//
//  LastVisitedConsultationViewController.m
//  Medico
//
//  Created by APPLE on 24/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "LastVisitedConsultationViewController.h"
#import "DoctorLandingPageView.h"

@interface LastVisitedConsultationViewController ()

@end

@implementation LastVisitedConsultationViewController
@synthesize visitedButton;
@synthesize notVisitedButton;
@synthesize isVisited;
@synthesize isNotVisitedClicked;
@synthesize isVisitedClicked;

- (void) homePage:(id)sender{
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"loggedInUserType"] isEqualToString:@"Doctor"]) {
        DoctorLandingPageView *DoctorHome =
        [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
        [self.navigationController pushViewController:DoctorHome animated:YES];
    }
    else{
        NSLog(@"Navigate to patient");
    }
}
- (void)viewDidLoad {
    NSLog(@"LastVisitedConsultationViewController.m");
    [super viewDidLoad];
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Consultations";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    isVisited = NO;
    isNotVisitedClicked = NO;
    isVisitedClicked = NO;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)visitedClicked:(id)sender {
    
}

- (IBAction)notVisitedClicked:(id)sender {
}
@end
