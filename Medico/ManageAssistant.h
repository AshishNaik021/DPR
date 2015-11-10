//
//  ManageAssistant.h
//  Medico
//
//  Created by APPLE on 06/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManageAssistant : UITableViewController
@property IBOutlet NSArray *getAssistantArr;

-(IBAction)searchPage:(id)sender;
-(IBAction)homePage:(id)sender;


@end
