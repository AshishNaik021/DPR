//
//  YearlyCountAppointmentForPatientDoctorConsultationCell.h
//  Medico
//
//  Created by Apple on 25/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YearlyCountAppointmentForPatientDoctorConsultationCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *bookDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *bookTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *visiteTypeLabel;

@property (weak, nonatomic) IBOutlet UIButton *detailButton;
- (IBAction)detail:(id)sender;


@end
