//
//  ManageTemplateForDoctorViewController.h
//  Medico
//
//  Created by Apple on 17/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManageTemplateForDoctorViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *searchField;
@property IBOutlet NSArray *allProcedureArr;
@property IBOutlet NSArray *procedureArr;

@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property IBOutlet NSString *searchResult;
- (IBAction)searchTemplate:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *categoryField;
@property (weak, nonatomic) IBOutlet UIButton *addCategoryButton;
- (IBAction)addCategory:(id)sender;

@end
