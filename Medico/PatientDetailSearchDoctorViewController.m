//
//  PatientDetailSearchDoctorViewController.m
//  Medico
//
//  Created by APPLE on 20/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientDetailSearchDoctorViewController.h"

@interface PatientDetailSearchDoctorViewController ()

@end

@implementation PatientDetailSearchDoctorViewController
@synthesize listRadioButton;
@synthesize mapRadioButton;
@synthesize radioButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    radioButton = NO;
    self.listContentView.hidden = FALSE;
    self.mapContentView.hidden = TRUE;
    
}




- (IBAction)searchDoctor:(id)sender {
    
}
- (IBAction)listRadio:(id)sender {
    
    [listRadioButton setImage:[UIImage imageNamed:@"checkRadio.png"] forState:UIControlStateNormal];
    [mapRadioButton setImage:[UIImage imageNamed:@"unchechRadio.png"] forState:UIControlStateNormal];
    self.mapContentView.hidden = TRUE;
    self.listContentView.hidden = FALSE;
    
}

- (IBAction)mapRadio:(id)sender {
    
    [mapRadioButton setImage:[UIImage imageNamed:@"checkRadio.png"] forState:UIControlStateNormal];
    [listRadioButton setImage:[UIImage imageNamed:@"unchechRadio.png"] forState:UIControlStateNormal];
    self.listContentView.hidden = TRUE;
    self.mapContentView.hidden = FALSE;

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

