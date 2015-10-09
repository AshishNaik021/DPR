//
//  SearchTemplate.h
//  Medico
//
//  Created by APPLE on 09/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchTemplate : UIViewController <UITableViewDataSource , UITableViewDelegate> {
    
    IBOutlet UITableView *gridTableView;
    
}
-(IBAction)homePage:(id)sender;
@property IBOutlet NSArray *_procedureArr;

@end
