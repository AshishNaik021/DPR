//
//  ManageReminderViewController.h
//  Medico
//
//  Created by APPLE on 24/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManageReminderViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    UIActivityIndicatorView *spinner;
}



@property IBOutlet NSArray *reminderArr;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
- (IBAction)add:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *removeButton;
- (IBAction)remove:(id)sender;

@end
