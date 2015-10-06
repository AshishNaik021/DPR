//
//  ManageAssistant.h
//  Medico
//
//  Created by APPLE on 06/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManageAssistant : UITableViewController
@property IBOutlet NSArray *assistantNameArr;
@property IBOutlet NSArray *assistantCityArr;
@property IBOutlet NSArray *assistantProfileArr;

-(IBAction)addAssistant:(id)sender;
-(IBAction)homePage:(id)sender;



@end
