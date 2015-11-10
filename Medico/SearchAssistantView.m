//
//  SearchAssistantView.m
//  Medico
//
//  Created by APPLE on 09/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "SearchAssistantView.h"
#import "DoctorLandingPageView.h"
#import "SearchAssistantCell.h"
#import "SearchResultAssistantViewController.h"

@interface SearchAssistantView ()

@end

@implementation SearchAssistantView
@synthesize assistantName;
@synthesize searchButton;
@synthesize searchNameField;

- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}

- (void)viewDidLoad {
    NSLog(@"SearchAssistantView.m");
    [super viewDidLoad];
    
   // gridTableView.backgroundColor = [UIColor clearColor];
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Search Assistants";
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

- (IBAction)search:(id)sender {
    
    SearchResultAssistantViewController *searchResult = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchResultAssistantViewController"];
    searchResult.assistantName = searchNameField.text;
    [self.navigationController pushViewController:searchResult animated:YES];
    
}
@end
