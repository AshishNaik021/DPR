//
//  PatientClinicAndLabsCell.m
//  Medico
//
//  Created by APPLE on 16/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientClinicAndLabsCell.h"


@implementation PatientClinicAndLabsCell

- (void)awakeFromNib {
    NSLog(@"PatientClinicAndLabsCell.m");
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)showDetails:(id)sender {
//    DoctorLandingPageView *DoctorHome =
//    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
//    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}
- (IBAction)lastAppointments:(id)sender {
}

- (IBAction)nextAppointments:(id)sender {
}
- (IBAction)totalCount:(id)sender {
}
- (IBAction)lastVisiteTotalCount:(id)sender {
}
@end
