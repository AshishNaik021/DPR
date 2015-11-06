//
//  SearchClinicView.m
//  Medico
//
//  Created by APPLE on 08/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "SearchClinicView.h"
#import "SearchClinicCell.h"
#import "DoctorLandingPageView.h"
#import "ClinicInformationView.h"
#import "SearchResultClinicForDoctorViewController.h"

@interface SearchClinicView ()

@end

@implementation SearchClinicView


- (IBAction)homeopathy:(id)sender {
    SearchResultClinicForDoctorViewController *searchResult =
    [self.storyboard instantiateViewControllerWithIdentifier:@"SearchResultClinicForDoctorViewController"];
    
    searchResult.searchCatagory = @"Homeopathy";
    
    [self.navigationController pushViewController:searchResult animated:YES];
    
    
}

- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}

- (void)viewDidLoad {
    NSLog(@"SearchClinicView.m");
    [super viewDidLoad];
    
    
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Search Clinics";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
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

- (IBAction)pediatrician:(id)sender {
    
    SearchResultClinicForDoctorViewController *searchResult =
    [self.storyboard instantiateViewControllerWithIdentifier:@"SearchResultClinicForDoctorViewController"];
    
    searchResult.searchCatagory = @"pediatric";
    
    [self.navigationController pushViewController:searchResult animated:YES];
    
    
}

- (IBAction)dentist:(id)sender {
    SearchResultClinicForDoctorViewController *searchResult =
    [self.storyboard instantiateViewControllerWithIdentifier:@"SearchResultClinicForDoctorViewController"];
    
    searchResult.searchCatagory = @"Dentist";
    
    [self.navigationController pushViewController:searchResult animated:YES];
    
    
}

- (IBAction)generalPhysician:(id)sender {
    SearchResultClinicForDoctorViewController *searchResult =
    [self.storyboard instantiateViewControllerWithIdentifier:@"SearchResultClinicForDoctorViewController"];
    
    searchResult.searchCatagory = @"General Physician";
    
    [self.navigationController pushViewController:searchResult animated:YES];
    
    
}

- (IBAction)accupuncture:(id)sender {
    SearchResultClinicForDoctorViewController *searchResult =
    [self.storyboard instantiateViewControllerWithIdentifier:@"SearchResultClinicForDoctorViewController"];
    
    searchResult.searchCatagory = @"Accupuncture";
    
    [self.navigationController pushViewController:searchResult animated:YES];
    
    
}

- (IBAction)dermatologist:(id)sender {
    SearchResultClinicForDoctorViewController *searchResult =
    [self.storyboard instantiateViewControllerWithIdentifier:@"SearchResultClinicForDoctorViewController"];
    
    searchResult.searchCatagory = @"Dermatologist";
    
    [self.navigationController pushViewController:searchResult animated:YES];
    
    
}

- (IBAction)aurveda:(id)sender {
    SearchResultClinicForDoctorViewController *searchResult =
    [self.storyboard instantiateViewControllerWithIdentifier:@"SearchResultClinicForDoctorViewController"];
    
    searchResult.searchCatagory = @"Aurveda";
    
    [self.navigationController pushViewController:searchResult animated:YES];
    
    
}

- (IBAction)addClinic:(id)sender {
    
}

- (IBAction)search:(id)sender {
}


- (IBAction)gynecologist:(id)sender {
    SearchResultClinicForDoctorViewController *searchResult =
    [self.storyboard instantiateViewControllerWithIdentifier:@"SearchResultClinicForDoctorViewController"];
    
    searchResult.searchCatagory = @"Gynachologic";
    
    [self.navigationController pushViewController:searchResult animated:YES];
    
    
}
@end
