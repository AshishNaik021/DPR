//
//  PatientProfileViewController.h
//  Medico
//
//  Created by APPLE on 09/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientProfileViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *gridViewTable;
}
-(IBAction)homePage:(id)sender;
@property IBOutlet NSArray *patientArr;
@property IBOutlet NSArray *arrDoctor;
@property NSDictionary *args;

@end

