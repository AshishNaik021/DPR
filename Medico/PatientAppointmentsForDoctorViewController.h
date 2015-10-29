//
//  PatientAppointmentsForDoctorViewController.h
//  Medico
//
//  Created by APPLE on 23/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientAppointmentsForDoctorViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property IBOutlet NSArray *jsonList;

@end

