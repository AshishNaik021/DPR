//
//  DoctorDetailManageFinanceViewController.m
//  Medico
//
//  Created by APPLE on 30/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DoctorDetailManageFinanceViewController.h"
#import "DoctorLandingPageView.h"

@interface DoctorDetailManageFinanceViewController ()

@end

@implementation DoctorDetailManageFinanceViewController
@synthesize listContentView;
@synthesize listTabButton;
@synthesize chartContentView;
@synthesize chartTabButton;

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
    
    self.navigationItem.title = @"Manage Finance";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    chartContentView.hidden = TRUE;
    self.listTabButton.titleLabel.textColor = [UIColor blackColor];
    [self.listTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    


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

- (IBAction)listTab:(id)sender {
    listContentView.hidden = FALSE;
    chartContentView.hidden = TRUE;
    [listTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [chartTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
}

- (IBAction)chartTab:(id)sender {
    chartContentView.hidden = FALSE;
    listContentView.hidden = TRUE;
    [chartTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [listTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];

}
@end
