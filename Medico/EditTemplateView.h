//
//  EditTemplateView.h
//  Medico
//
//  Created by APPLE on 07/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditTemplateView : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    
    IBOutlet UITableView *gridTableView;
    
}
@property NSArray *editFieldArr;
@property (weak, nonatomic) IBOutlet UIButton *addTemplateFieldButton;
- (IBAction)addTemplateField:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *removeTemplateFieldButton;
- (IBAction)removeTemplateField:(id)sender;

@end
