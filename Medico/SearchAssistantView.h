//
//  SearchAssistantView.h
//  Medico
//
//  Created by APPLE on 09/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchAssistantView : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    
    IBOutlet UITableView *gridTableView;

    
}

@property IBOutlet NSArray *assistantTotal;
-(IBAction)homePage:(id)sender;


@end
