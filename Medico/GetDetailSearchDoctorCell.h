//
//  GetDetailSearchDoctorCell.h
//  Medico
//
//  Created by Apple on 16/12/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GetDetailSearchDoctorCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *clinicNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *clinicCityLabel;
@property (weak, nonatomic) IBOutlet UILabel *clinicShift1DaysLabel;
@property (weak, nonatomic) IBOutlet UILabel *clinicShift1TimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *clinicContactLabel;
@property (weak, nonatomic) IBOutlet UIButton *clinicShift1BookAppButton;
@property (weak, nonatomic) IBOutlet UILabel *clinicShift2DaysLabel;
@property (weak, nonatomic) IBOutlet UILabel *clinicShift2TimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *clinicShift2BookAppButton;
@property (weak, nonatomic) IBOutlet UIButton *clinicShift3BookAppButton;
@property (weak, nonatomic) IBOutlet UILabel *clinicShift3DaysLabel;
@property (weak, nonatomic) IBOutlet UILabel *clinicShift3TimeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *clinicLocationImage;
@property (weak, nonatomic) IBOutlet UIImageView *clinicShift1ClockImage;
@property (weak, nonatomic) IBOutlet UIImageView *clinicShift2ClockImage;
@property (weak, nonatomic) IBOutlet UIImageView *clinicShift3ClockImage;






- (IBAction)clinicShift3BookApp:(id)sender;
- (IBAction)clinicShift2BookApp:(id)sender;
- (IBAction)clinicShift1BookApp:(id)sender;


@end
