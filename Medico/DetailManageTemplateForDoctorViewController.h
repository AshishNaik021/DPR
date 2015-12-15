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
@property (weak, nonatomic) IBOutlet UITextField *searchField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
- (IBAction)search:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *addTemplateButton;
- (IBAction)addTemplate:(id)sender;

@property IBOutlet NSString *procedureName;
@property IBOutlet NSArray *templateArr;
@end
