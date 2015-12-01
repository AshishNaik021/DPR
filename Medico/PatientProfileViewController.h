//
//  PatientProfileViewController.h
//  Medico
//
//  Created by APPLE on 09/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientProfileViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

-(IBAction)homePage:(id)sender;
- (IBAction)nextAppointment:(id)sender;
@property IBOutlet NSArray *patientArr;
@property IBOutlet NSArray *arrDoctor;
@property NSDictionary *args;
@property (weak, nonatomic) IBOutlet UIButton *nextAppointmentButton;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
