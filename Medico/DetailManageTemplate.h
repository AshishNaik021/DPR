//
//  DetailManageTemplate.h
//  Medico
//
//  Created by APPLE on 05/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailManageTemplate : UITableViewController <UITableViewDataSource, UITabBarDelegate>


@property IBOutlet NSArray *DentalArr;
@property IBOutlet NSArray *LaparoscopicArr;
@property IBOutlet NSArray *KidneyArr;
@property NSInteger pid;
-(IBAction)homePage:(id)sender;

@end
