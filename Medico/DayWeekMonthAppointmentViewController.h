//
//  DayWeekMonthAppointmentViewController.h
//  Medico
//
//  Created by APPLE on 30/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DayWeekMonthAppointmentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *dayTabButton;
@property (weak, nonatomic) IBOutlet UIButton *weekTabButton;
@property (weak, nonatomic) IBOutlet UIButton *monthTabButton;
@property (weak, nonatomic) IBOutlet UILabel *monthDateLabel;
@property (weak, nonatomic) IBOutlet UIButton *monthNextDateButton;
@property (weak, nonatomic) IBOutlet UIButton *monthPreviousDateButton;
@property (weak, nonatomic) IBOutlet UITableView *monthTableView;
@property (weak, nonatomic) IBOutlet UILabel *DayDateLabel;
@property (weak, nonatomic) IBOutlet UIButton *dayNextDateButton;
@property (weak, nonatomic) IBOutlet UIButton *dayPreviousDateButton;
@property (weak, nonatomic) IBOutlet UITableView *dayTableView;
@property (weak, nonatomic) IBOutlet UILabel *weekDateLabel;
@property (weak, nonatomic) IBOutlet UIButton *weekNextDateButton;
@property (weak, nonatomic) IBOutlet UIButton *weekPreviousDateButton;
@property (weak, nonatomic) IBOutlet UIButton *weekDay1Button;
@property (weak, nonatomic) IBOutlet UIButton *weekDay2Button;
@property (weak, nonatomic) IBOutlet UIButton *weekDay3Button;
@property (weak, nonatomic) IBOutlet UIButton *weekDay4Button;
@property (weak, nonatomic) IBOutlet UIButton *weekDay5Button;
@property (weak, nonatomic) IBOutlet UIButton *weekDay6Button;
@property (weak, nonatomic) IBOutlet UIButton *weekDay7Button;
@property (weak, nonatomic) IBOutlet UITableView *weekTableView;


- (IBAction)dayTab:(id)sender;
- (IBAction)weekTab:(id)sender;
- (IBAction)monthTab:(id)sender;
- (IBAction)monthNextDate:(id)sender;
- (IBAction)monthPreviousDate:(id)sender;
- (IBAction)dayNextDate:(id)sender;
- (IBAction)dayPreviousDate:(id)sender;
- (IBAction)weekNextDate:(id)sender;
- (IBAction)weekPreviousDate:(id)sender;
- (IBAction)weekDay1:(id)sender;
- (IBAction)weekDay2:(id)sender;
- (IBAction)weekDay3:(id)sender;
- (IBAction)weekDay4:(id)sender;
- (IBAction)weekDay5:(id)sender;
- (IBAction)weekDay6:(id)sender;
- (IBAction)weekDay7:(id)sender;




@property (weak, nonatomic) IBOutlet UIView *dayContentView;
@property (weak, nonatomic) IBOutlet UIView *weekContentView;
@property (weak, nonatomic) IBOutlet UIView *monthContentView;

@end
