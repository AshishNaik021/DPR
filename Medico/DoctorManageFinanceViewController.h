//
//  DoctorManageFinanceViewController.h
//  Medico
//
//  Created by APPLE on 24/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorManageFinanceViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property IBOutlet NSArray *dateArr;
@property IBOutlet NSArray *amountArr;
@property IBOutlet NSArray *totalArr;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

