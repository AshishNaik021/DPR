//
//  PatientDoctorConsultationsCell.h
//  Medico
//
//  Created by Apple on 24/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientDoctorConsultationsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *doctorProfileImage;
@property (weak, nonatomic) IBOutlet UIButton *showDetailsButton;
@property (weak, nonatomic) IBOutlet UILabel *doctorNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *totalCountButton;
@property (weak, nonatomic) IBOutlet UILabel *doctorSpecialtyLabel;
@property (weak, nonatomic) IBOutlet UIButton *lastVisitedButton;
@property (weak, nonatomic) IBOutlet UIButton *lastAppointmentButton;
@property (weak, nonatomic) IBOutlet UIButton *nextAppointmentButton;


- (IBAction)showDetails:(id)sender;
- (IBAction)totalCount:(id)sender;
- (IBAction)lastVisited:(id)sender;
- (IBAction)lastAppointment:(id)sender;
- (IBAction)nextAppointment:(id)sender;






@end
