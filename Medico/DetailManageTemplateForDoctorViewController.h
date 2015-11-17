//
//  DetailManageTemplateForDoctorViewController.h
//  Medico
//
//  Created by Apple on 17/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailManageTemplateForDoctorViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property IBOutlet NSString *procedureName;
@property IBOutlet NSArray *templateArr;
@end
