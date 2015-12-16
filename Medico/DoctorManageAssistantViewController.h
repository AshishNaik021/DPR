//
//  DoctorManageAssistantViewController.h
//  Medico
//
//  Created by Apple on 16/12/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorManageAssistantViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property IBOutlet NSArray *getAssistantArr;
@property (weak, nonatomic) IBOutlet UIButton *addAssistantButton;
- (IBAction)addAssistant:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *removeButton;
- (IBAction)remove:(id)sender;

-(IBAction)searchPage:(id)sender;
@end
