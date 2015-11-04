//
//  ManageDoctorsClinicSettingsCell.h
//  Medico
//
//  Created by APPLE on 12/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManageDoctorsClinicSettingsCell : UITableViewCell
@property IBOutlet UILabel *clinicNameLabel;
@property IBOutlet UILabel *clinicCityLabel;
@property IBOutlet UIImageView *doctorImage;
@property IBOutlet UIButton *deleteClinicButton;
-(IBAction)deleteClinic:(id)sender;
@property BOOL checkDelete;
@end
