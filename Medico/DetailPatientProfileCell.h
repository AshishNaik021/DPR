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
@property (weak, nonatomic) IBOutlet UILabel *slot1StartTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot1AppointmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot2DayLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot3DayLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot2StartTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot3StartTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot2AppointmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot3AppointmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot1EndTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot2EndTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot3EndTimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *slot1BookOnlineButton;
- (IBAction)slot1BookOnline:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *slot2BookOnlineButton;
- (IBAction)slot2BookOnline:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *slot3BookOnlineButton;
- (IBAction)slot3BookOnline:(id)sender;


@end
