//
//  ClinicInformationView.m
//  Medico
//
//  Created by APPLE on 09/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "ClinicInformationView.h"

@interface ClinicInformationView ()

@end

@implementation ClinicInformationView

- (void)viewDidLoad {
    [super viewDidLoad];
   // _clinicNameField.text = _totalDetail[0];
    _clinicNameField.text = [[_totalDetail objectAtIndex:0] objectForKey:@"Name"];
    _emailField.text = [[_totalDetail objectAtIndex:0] objectForKey:@"Email"];
    _mobileField.text = [[_totalDetail objectAtIndex:0] objectForKey:@"Mobile"];
    _locationField.text = [[_totalDetail objectAtIndex:0] objectForKey:@"Location"];
    _serviceField.text = [[_totalDetail objectAtIndex:0] objectForKey:@"Services"];
    _slotsField.text = [[_totalDetail objectAtIndex:0] objectForKey:@"Slots"];

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
