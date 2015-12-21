//
//  YearlyCountAppointmentForPatientDoctorConsultationViewController.h
//  Medico
//
//  Created by Apple on 25/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YearlyCountAppointmentForPatientDoctorConsultationViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *addNewAppointmentButton;
- (IBAction)addNewAppointment:(id)sender;



@end
