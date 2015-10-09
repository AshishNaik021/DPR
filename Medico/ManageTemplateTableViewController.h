//
//  ManageTemplateTableViewController.h
//  Medico
//
//  Created by Apple on 05/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManageTemplateTableViewController : UITableViewController <UITableViewDataSource, UITabBarDelegate>

@property IBOutlet NSArray *templateArr;

-(IBAction)homePage:(id)sender;
-(IBAction)searchTemplate:(id)sender;

@end
