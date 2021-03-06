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
@property NSArray *subArr;

@property (weak, nonatomic) IBOutlet UILabel *templateNameLabel;
@property IBOutlet NSString *templateName;
@property IBOutlet NSString *templateId;
@property IBOutlet NSArray *templateDataArr;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
- (IBAction)add:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
- (IBAction)save:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *DeleteButton;
- (IBAction)Delete:(id)sender;


@end
