//
//  PatientClinicAndLabsCell.h
//  Medico
//
//  Created by APPLE on 16/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientClinicAndLabsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *clinicImage;
@property (weak, nonatomic) IBOutlet UIButton *showDetailsButton;
- (IBAction)showDetails:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *clinicNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *clinicSpecialityLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastVisitedLabel;
@property (weak, nonatomic) IBOutlet UIButton *lastAppointmentButton;
@property (weak, nonatomic) IBOutlet UIButton *nextAppointmentButton;
- (IBAction)lastAppointments:(id)sender;
- (IBAction)nextAppointments:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *totalCountButton;
- (IBAction)totalCount:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *lastVisiteTotalCountButton;
- (IBAction)lastVisiteTotalCount:(id)sender;


@end
