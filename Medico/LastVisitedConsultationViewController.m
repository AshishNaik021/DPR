//
//  LastVisitedConsultationViewController.m
//  Medico
//
//  Created by APPLE on 24/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "LastVisitedConsultationViewController.h"
#import "DoctorLandingPageView.h"

@interface LastVisitedConsultationViewController ()

@end

@implementation LastVisitedConsultationViewController
@synthesize visitedButton;
@synthesize notVisitedButton;
@synthesize isVisited;
@synthesize isNotVisitedClicked;
@synthesize isVisitedClicked;
@synthesize rating;

- (void) homePage:(id)sender{
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"loggedInUserType"] isEqualToString:@"Doctor"]) {
        DoctorLandingPageView *DoctorHome =
        [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
        [self.navigationController pushViewController:DoctorHome animated:YES];
    }
    else{
        NSLog(@"Navigate to patient");
    }
}
- (void)viewDidLoad {
    NSLog(@"LastVisitedConsultationViewController.m");
    [super viewDidLoad];
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Consultations";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    isVisited = NO;
    isNotVisitedClicked = NO;
    isVisitedClicked = NO;
    rating = 0;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
// emptyStar.jpeg
// filledStar.jpeg

- (IBAction)ratingOne:(id)sender{
    [self visitedClickedChangeRadioButton];
    UIImage *ckbtnImage = [UIImage imageNamed:@"filledStar.jpeg"];
    UIImage *unckbtnImage = [UIImage imageNamed:@"emptyStar.jpeg"];
    [self.ratingOneButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingTwoButton setImage:unckbtnImage forState:UIControlStateNormal];
    [self.ratingThreeButton setImage:unckbtnImage forState:UIControlStateNormal];
    [self.ratingFourButton setImage:unckbtnImage forState:UIControlStateNormal];
    [self.ratingFiveButton setImage:unckbtnImage forState:UIControlStateNormal];
    rating = 1;
}
- (IBAction)ratingTwo:(id)sender{
    [self visitedClickedChangeRadioButton];
    UIImage *ckbtnImage = [UIImage imageNamed:@"filledStar.jpeg"];
    UIImage *unckbtnImage = [UIImage imageNamed:@"emptyStar.jpeg"];
    [self.ratingOneButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingTwoButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingThreeButton setImage:unckbtnImage forState:UIControlStateNormal];
    [self.ratingFourButton setImage:unckbtnImage forState:UIControlStateNormal];
    [self.ratingFiveButton setImage:unckbtnImage forState:UIControlStateNormal];
    rating = 2;
}
- (IBAction)ratingThree:(id)sender{
    [self visitedClickedChangeRadioButton];
    UIImage *ckbtnImage = [UIImage imageNamed:@"filledStar.jpeg"];
    UIImage *unckbtnImage = [UIImage imageNamed:@"emptyStar.jpeg"];
    [self.ratingOneButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingTwoButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingThreeButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingFourButton setImage:unckbtnImage forState:UIControlStateNormal];
    [self.ratingFiveButton setImage:unckbtnImage forState:UIControlStateNormal];
    rating = 3;
}
- (IBAction)ratingFour:(id)sender{
    [self visitedClickedChangeRadioButton];
    UIImage *ckbtnImage = [UIImage imageNamed:@"filledStar.jpeg"];
    UIImage *unckbtnImage = [UIImage imageNamed:@"emptyStar.jpeg"];
    [self.ratingOneButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingTwoButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingThreeButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingFourButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingFiveButton setImage:unckbtnImage forState:UIControlStateNormal];
    rating = 4;
}
- (IBAction)ratingFive:(id)sender{
    [self visitedClickedChangeRadioButton];
    UIImage *ckbtnImage = [UIImage imageNamed:@"filledStar.jpeg"];
    [self.ratingOneButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingTwoButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingThreeButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingFourButton setImage:ckbtnImage forState:UIControlStateNormal];
    [self.ratingFiveButton setImage:ckbtnImage forState:UIControlStateNormal];
    rating = 5;
}

- (IBAction)visitedClicked:(id)sender {
    [self visitedClickedChangeRadioButton];
}

-(IBAction)addVisiteSummary:(id)sender{
}

- (IBAction)notVisitedClicked:(id)sender {
    [self notVisitedClickedChangeRadioButton];
}
-(void)toggleHiden:(BOOL) value{
    self.labelRating.hidden = value;
    self.labelReviews.hidden = value;
    self.ratingFiveButton.hidden = value;
    self.ratingFourButton.hidden = value;
    self.ratingThreeButton.hidden = value;
    self.ratingTwoButton.hidden = value;
    self.ratingOneButton.hidden = value;
    self.reviewsTextField.hidden = value;
    self.addVisiteSummaryButton.hidden = value;
    if (value) {
        rating = 0;
        UIImage *unckbtnImage = [UIImage imageNamed:@"emptyStar.jpeg"];
        [self.ratingOneButton setImage:unckbtnImage forState:UIControlStateNormal];
        [self.ratingTwoButton setImage:unckbtnImage forState:UIControlStateNormal];
        [self.ratingThreeButton setImage:unckbtnImage forState:UIControlStateNormal];
        [self.ratingFourButton setImage:unckbtnImage forState:UIControlStateNormal];
        [self.ratingFiveButton setImage:unckbtnImage forState:UIControlStateNormal];
        [self.reviewsTextField setText:@""];
    }
}
- (IBAction)done:(id)sender{
    
}
-(void)visitedClickedChangeRadioButton{
    UIImage *ckbtnImage = [UIImage imageNamed:@"checkRadio.png"];
    [self.visitedButton setImage:ckbtnImage forState:UIControlStateNormal];
    UIImage *unckbtnImage = [UIImage imageNamed:@"unchechRadio.png"];
    [self.notVisitedButton setImage:unckbtnImage forState:UIControlStateNormal];
    [self toggleHiden:NO];
}
-(void)notVisitedClickedChangeRadioButton{
    UIImage *ckbtnImage = [UIImage imageNamed:@"checkRadio.png"];
    [self.notVisitedButton setImage:ckbtnImage forState:UIControlStateNormal];
    UIImage *unckbtnImage = [UIImage imageNamed:@"unchechRadio.png"];
    [self.visitedButton setImage:unckbtnImage forState:UIControlStateNormal];
    [self toggleHiden:YES];
}
@end
