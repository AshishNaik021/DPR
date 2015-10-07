//
//  DoctorSettingPageView.m
//  Medico
//
//  Created by APPLE on 07/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DoctorSettingPageView.h"
#import "DoctorLandingPageView.h"

@interface DoctorSettingPageView ()

@end

@implementation DoctorSettingPageView

- (void) homePage:(id)sender{
    DoctorLandingPageView *homePageView =
    [self.storyboard instantiateViewControllerWithIdentifier:@"homePageView"];
    [self.navigationController pushViewController:homePageView animated:YES];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;

    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"MyDemo" ofType:@"json"];
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:NULL];
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[myJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    NSArray *arr = [json valueForKeyPath:@"demo"];
    self.doctorNameLabel.text = [[arr objectAtIndex:0] objectForKey:@"Name"];
    

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

- (IBAction)manageAssistant:(id)sender {
}
- (IBAction)manageTemplate:(id)sender {
}
- (IBAction)manageClinics:(id)sender {
}
- (IBAction)smsNotification:(id)sender {
}
@end
