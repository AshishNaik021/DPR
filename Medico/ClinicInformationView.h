//
//  ClinicInformationView.h
//  Medico
//
//  Created by APPLE on 09/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClinicInformationView : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *clinicNameField;
@property (weak, nonatomic) IBOutlet UILabel *emailField;
@property (weak, nonatomic) IBOutlet UILabel *mobileField;
@property (weak, nonatomic) IBOutlet UILabel *locationField;
@property (weak, nonatomic) IBOutlet UILabel *serviceField;
@property (weak, nonatomic) IBOutlet UILabel *slotsField;
@property IBOutlet NSArray *totalDetail;

@end
