//
//  PatientDetailSearchDoctorCell.h
//  Medico
//
//  Created by APPLE on 21/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientDetailSearchDoctorCell : UITableViewCell

@property IBOutlet UILabel *nameLabel;
@property IBOutlet UILabel *specialtyLabel;
@property IBOutlet UILabel *locationLabel;
@property IBOutlet UIImageView *doctorImage;
@property (weak, nonatomic) IBOutlet UIButton *showDetailsButton;
- (IBAction)showDetails:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *getAllAppointmentButton;
- (IBAction)getAllAppointment:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *bookOnlineButton;
- (IBAction)bookOnline:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *addDoctorButton;
- (IBAction)addDoctor:(id)sender;

@end
