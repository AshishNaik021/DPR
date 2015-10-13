//
//  PatientSettingPageViewController.m
//  Medico
//
//  Created by APPLE on 13/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientSettingPageViewController.h"

@interface PatientSettingPageViewController ()

@end

@implementation PatientSettingPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Settings";
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"MyDemo" ofType:@"json"];
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:NULL];
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[myJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    NSArray *arr = [json valueForKeyPath:@"demo"];
    self.patientNameLabel.text = [[arr objectAtIndex:0] objectForKey:@"Name"];

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

- (IBAction)manageProfile:(id)sender {
}
- (IBAction)termsAndCondition:(id)sender {
}
- (IBAction)howItWorks:(id)sender {
}
- (IBAction)rateThisApp:(id)sender {
}
@end
