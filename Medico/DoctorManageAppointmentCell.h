//
//  DoctorManageAppointmentCell.h
//  Medico
//
//  Created by APPLE on 21/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorManageAppointmentCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *clinicImage;
@property (weak, nonatomic) IBOutlet UIButton *downArrowButton;
- (IBAction)downArrow:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *clinicNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *slot1Label;
@property (weak, nonatomic) IBOutlet UILabel *slot2Label;
@property (weak, nonatomic) IBOutlet UILabel *slot3Label;



@end
