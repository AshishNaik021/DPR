//
//  LastVisitedConsultationViewController.h
//  Medico
//
//  Created by APPLE on 24/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LastVisitedConsultationViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *visitedButton;
@property (weak, nonatomic) IBOutlet UIButton *notVisitedButton;
@property (nonatomic) BOOL isVisitedClicked;
@property (nonatomic) BOOL isNotVisitedClicked;
@property (nonatomic) BOOL isVisited;
@property (nonatomic,retain) NSString *star;
- (IBAction)visitedClicked:(id)sender;
@property(nonatomic,retain) NSString *returnString;
- (IBAction)notVisitedClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *reviewsTextField;
@property (weak, nonatomic) IBOutlet UIButton *addVisiteSummaryButton;
- (IBAction)addVisiteSummary:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
- (IBAction)done:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *ratingOneButton;
@property (weak, nonatomic) IBOutlet UIButton *ratingTwoButton;
@property (weak, nonatomic) IBOutlet UIButton *ratingThreeButton;
@property (weak, nonatomic) IBOutlet UIButton *ratingFourButton;
@property (weak, nonatomic) IBOutlet UIButton *ratingFiveButton;
@property (weak, nonatomic) IBOutlet UILabel *labelRating;
@property (weak, nonatomic) IBOutlet UILabel *labelReviews;
@property NSArray *patientArr;



- (IBAction)ratingOne:(id)sender;
- (IBAction)ratingTwo:(id)sender;
- (IBAction)ratingThree:(id)sender;
- (IBAction)ratingFour:(id)sender;
- (IBAction)ratingFive:(id)sender;



@end
