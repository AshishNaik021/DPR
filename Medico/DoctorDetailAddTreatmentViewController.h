//
//  DoctorDetailAddTreatmentViewController.h
//  Medico
//
//  Created by APPLE on 24/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorDetailAddTreatmentViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property IBOutlet NSArray *subprocedureArr;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
