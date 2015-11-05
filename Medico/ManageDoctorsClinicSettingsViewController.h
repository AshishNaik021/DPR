//
//  ManageDoctorsClinicSettingsViewController.h
//  Medico
//
//  Created by APPLE on 12/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManageDoctorsClinicSettingsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *gridViewTable;
}
- (IBAction)remove:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *removeButton;
- (IBAction)addNew:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *addNewButton;
@property IBOutlet NSArray *allClinicArr;
@property BOOL *checkDelete;
@end

