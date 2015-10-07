//
//  TemplateDetailViewController.h
//  Medico
//
//  Created by APPLE on 07/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemplateDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    
    IBOutlet UITableView *gridTableView;

}
@property NSInteger var;


@end
