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

@interface SearchClinicView : UIViewController <UITableViewDataSource , UITableViewDelegate> {
   
    IBOutlet UITableView *gridTableView;
    
}

@property IBOutlet NSArray *dataArr;

@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UITextField *searchField;
@property (weak, nonatomic) IBOutlet UIButton *nameRadiobutton;
@property (weak, nonatomic) IBOutlet UIButton *phoneRadioButton;
@property (weak, nonatomic) IBOutlet UIButton *emailRadioButton;
@property (weak, nonatomic) IBOutlet UIImageView *totalClinicImage;
@property (weak, nonatomic) IBOutlet UILabel *totalClinicLabel;

- (IBAction)search:(id)sender;
- (IBAction)nameRadio:(id)sender;
- (IBAction)phoneRadio:(id)sender;
- (IBAction)emailRadio:(id)sender;
-(IBAction)homePage:(id)sender;

@end
