//
//  PatientDoctorConsultationsViewController.h
//  Medico
//
//  Created by Apple on 24/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientDoctorConsultationsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *addDoctorButton;
- (IBAction)addDoctor:(id)sender;

@end
