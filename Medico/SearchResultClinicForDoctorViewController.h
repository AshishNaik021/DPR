//
//  SearchResultClinicForDoctorViewController.h
//  Medico
//
//  Created by Apple on 05/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultClinicForDoctorViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *catagoryLabel;
@property IBOutlet NSArray *catagoryClinicArr;
@property IBOutlet NSString *searchCatagory;
@property (weak, nonatomic) IBOutlet UIButton *createNewButton;
@property IBOutlet NSMutableArray *CopyArr;
- (IBAction)createNew:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
- (IBAction)search:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *searchField;

@end
