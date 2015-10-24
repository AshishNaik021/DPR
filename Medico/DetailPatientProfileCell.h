//
//  DetailPatientProfileCell.h
//  Medico
//
//  Created by APPLE on 23/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailPatientProfileCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *clinicNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *clinicCityLabel;
@property (weak, nonatomic) IBOutlet UILabel *mobileNoLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot1DayLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot1TimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot1AppointmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot2DayLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot3DayLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot2TimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot3TimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot2AppointmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot3AppointmentLabel;


@end
