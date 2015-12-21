//
//  PatientManageAppointmentViewController.h
//  Medico
//
//  Created by Apple on 09/12/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientManageAppointmentViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *addManageAppointmentButton;
- (IBAction)addManageAppointment:(id)sender;

@end
