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
@property IBOutlet NSArray *allClinicArr;
@property BOOL *checkDelete;
@end

