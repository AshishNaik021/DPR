//
//  DoctorAddTemplateSettingViewController.m
//  Medico
//
//  Created by Apple on 16/12/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DoctorAddTemplateSettingViewController.h"

@interface DoctorAddTemplateSettingViewController ()

@end

@implementation DoctorAddTemplateSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"DoctorAddTemplateSettingViewController.m");
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

- (IBAction)addTemplate:(id)sender {
}
- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:Nil];
}
@end
