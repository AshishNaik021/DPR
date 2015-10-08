//
//  SearchClinicView.h
//  Medico
//
//  Created by APPLE on 08/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
BOOL nameRadioClicked;
BOOL phoneRadioClicked;
BOOL emailradioClicked;

@interface SearchClinicView : UIViewController <UITableViewDataSource , UITableViewDelegate>


@property IBOutlet NSArray *dataArr;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
- (IBAction)search:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *searchField;
@property (weak, nonatomic) IBOutlet UIButton *nameRadiobutton;
- (IBAction)nameRadio:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *phoneRadioButton;
- (IBAction)phoneRadio:(id)sender;
- (IBAction)emailRadio:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *emailRadioButton;

@end
