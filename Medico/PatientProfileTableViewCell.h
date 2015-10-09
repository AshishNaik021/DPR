//
//  PatientProfileTableViewCell.h
//  Medico
//
//  Created by APPLE on 09/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientProfileTableViewCell : UITableViewCell

@property IBOutlet UILabel *patientNameLabel;
@property IBOutlet UILabel *specialistLabel;
@property IBOutlet UILabel *lastVisitedLabel;
@property IBOutlet UIImageView *patientPicture;

@end
