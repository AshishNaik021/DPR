//
//  DoctorManageAppointmentsViewController.h
//  Medico
//
//  Created by APPLE on 21/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoctorDetailManageAppointmentViewController.h"

@interface DoctorManageAppointmentsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    UIActivityIndicatorView *spinner;
}

@property IBOutlet NSMutableArray *jsonList;
@property IBOutlet NSMutableArray *slot1Arr;
@property IBOutlet NSMutableArray *slot2Arr;
@property IBOutlet NSMutableArray *slot3Arr;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property IBOutlet DoctorDetailManageAppointmentViewController *detailManage;

@end
