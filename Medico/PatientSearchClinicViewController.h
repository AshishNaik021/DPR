//
//  PatientSearchClinicViewController.h
//  Medico
//
//  Created by Apple on 10/12/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientSearchClinicViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITextField *searchClinicField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
- (IBAction)search:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *addNewClinicButton;
- (IBAction)addNewClinic:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
