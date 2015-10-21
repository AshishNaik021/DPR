//
//  DoctorManageAppointmentsViewController.h
//  Medico
//
//  Created by APPLE on 21/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorManageAppointmentsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property IBOutlet NSMutableArray *jsonList;


@end
