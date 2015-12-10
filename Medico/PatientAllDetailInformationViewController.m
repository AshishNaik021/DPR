//
//  PatientAllDetailInformationViewController.m
//  Medico
//
//  Created by Apple on 25/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientAllDetailInformationViewController.h"
#import "PatientLandingPageViewController.h"
#import "PatientSymptomHistoryViewController.h"
#import "PatientDiagnosisHistoryViewController.h"
#import "PatientMedicineHistoryViewController.h"
#import "PatientTestPrescribedHistoryViewController.h"
#import "PatientAllDetailSummaryInformationCell.h"
#import "PatientUploadDocumentsViewController.h"
#import "PatientAllDetailDocumentInformationCell.h"

@interface PatientAllDetailInformationViewController ()

@end

@implementation PatientAllDetailInformationViewController
@synthesize summaryContentView;
@synthesize doctorNoteContentView;
@synthesize treatmentPlanContentView;
@synthesize invoiceContentView;
@synthesize documentContentView;
@synthesize summaryTabButton;
@synthesize doctorNoteTabButton;
@synthesize documentTabButton;
@synthesize invoiceTabButton;
@synthesize treatmentPlanTabButton;
@synthesize summarySymptomsTextView;
@synthesize summaryDiagnosisTextView;
@synthesize summaryTestPrescribedTextView;
@synthesize documentTableView;
@synthesize summaryTableView;
@synthesize array;
@synthesize invoiceCollectionView;
@synthesize invoiceCollectionScroll;

@synthesize summaryScrollView;
@synthesize  summarykeyboardVisible;
@synthesize summaryoffset;
@synthesize summaryheight;
@synthesize summarywidth;
@synthesize summaryscreen;
@synthesize summaryscrollHeight;

@synthesize invoiceScrollView;
@synthesize  invoicekeyboardVisible;
@synthesize invoiceoffset;
@synthesize invoiceheight;
@synthesize invoicewidth;
@synthesize invoicescreen;
@synthesize invoicescrollHeight;


- (void) patientHomePage:(id)sender{
    PatientLandingPageViewController *PatientHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientLandingPageViewController"];
    [self.navigationController pushViewController:PatientHome animated:YES];
    
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"Registering for keyboard events");
    
    // Register for the events
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardDidShow:)
                                                 name: UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardDidHide:)
                                                 name: UIKeyboardDidHideNotification object:nil];
    
    //Initially the keyboard is hidden
    summarykeyboardVisible = NO;
    invoicekeyboardVisible = NO;
}

-(void) viewWillDisappear:(BOOL)animated
{
    NSLog (@"Unregister for keyboard events");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void) keyboardDidShow: (NSNotification *)notif
{
    // If keyboard is visible, return
    if (summarykeyboardVisible || invoicekeyboardVisible)
    {
        NSLog(@"Keyboard is already visible. Ignore notification.");
        return;
    }
    
    // Get the size of the keyboard.
    NSDictionary* summaryinfo = [notif userInfo];
    NSValue* summaryaValue = [summaryinfo objectForKey:UIKeyboardBoundsUserInfoKey];
    CGSize keyboardSize = [summaryaValue CGRectValue].size;
   
    NSDictionary* invoiceinfo = [notif userInfo];
    NSValue* invoiceaValue = [invoiceinfo objectForKey:UIKeyboardBoundsUserInfoKey];
    CGSize invoicekeyboardSize = [invoiceaValue CGRectValue].size;
    // Save the current location so we can restore
    // when keyboard is dismissed
    summaryoffset = self.summaryScrollView.contentOffset;
    invoiceoffset = self.invoiceScrollView.contentOffset;
    
    // Resize the scroll view to make room for the keyboard
    CGRect summaryviewFrame = summaryScrollView.frame;
    CGRect invoiceviewFrame = invoiceScrollView.frame;
    summaryviewFrame.size.height -= keyboardSize.height;
    invoiceviewFrame.size.height -= keyboardSize.height;
    summaryScrollView.frame = summaryviewFrame;
    invoiceScrollView.frame = invoiceviewFrame;
    // Keyboard is now visible
    summarykeyboardVisible = YES;
    invoicekeyboardVisible = YES;
}

-(void) keyboardDidHide: (NSNotification *)notif
{
    // Is the keyboard already shown
    if (!summarykeyboardVisible || !invoicekeyboardVisible)
    {
        NSLog(@"Keyboard is already hidden. Ignore notification.");
        return;
    }
    
    // Reset the frame scroll view to its original value
    summaryScrollView.frame = CGRectMake(0, 0, summarywidth, summaryscrollHeight);
    invoiceScrollView.frame = CGRectMake(0, 0, invoicewidth, invoicescrollHeight);
    // Reset the scrollview to previous location
    summaryScrollView.contentOffset = summaryoffset;
    invoiceScrollView.contentOffset = invoiceoffset;
    // Keyboard is no longer visible
    summarykeyboardVisible = NO;
    invoicekeyboardVisible = NO;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField.returnKeyType==UIReturnKeyNext) {
        UIView *next = [[textField superview] viewWithTag:textField.tag+1];
        [next becomeFirstResponder];
        //[textField resignFirstResponder];
    }else if (textField.returnKeyType==UIReturnKeyDone) {
        [textField resignFirstResponder];
    }
    
    return YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"PatientAllDetailInformationViewController.m");
    
    array = [[NSMutableArray alloc]init];
    [array addObject:@"Name"];
    [array addObject:@"Total"];
    [array addObject:@"Cost"];
    [array addObject:@"Currency"];
    [array addObject:@"Discount"];
    [array addObject:@"Taxes"];
    [array addObject:@"Total"];
    [array addObject:@"Note"];
    [array addObject:@"Cost Dollar"];
    self.treatmentCollectionView.layer.borderWidth = 1.0f;
    self.invoiceCollectionView.layer.borderWidth = 1.0f;
    
    
    summarykeyboardVisible = NO;
    summaryscreen = [summaryContentView bounds];
    summarywidth = CGRectGetWidth(summaryscreen);
    //Bonus height.
    summaryheight = CGRectGetHeight(summaryscreen);
    summaryscrollHeight = summaryheight + 200;
    NSLog(@"Width is--- %f",summarywidth);
    NSLog(@"Height is--- %f",summaryheight);
    [summaryScrollView setScrollEnabled:YES];
    [summaryScrollView setContentSize:CGSizeMake(summarywidth, summaryscrollHeight)];
    
    invoicekeyboardVisible = NO;
    invoicescreen = [invoiceContentView bounds];
    invoicewidth = CGRectGetWidth(invoicescreen);
    //Bonus height.
    invoiceheight = CGRectGetHeight(invoicescreen);
    invoicescrollHeight = invoiceheight + 200;
    NSLog(@"Width is--- %f",invoicewidth);
    NSLog(@"Height is--- %f",invoiceheight);
    [invoiceScrollView setScrollEnabled:YES];
    [invoiceScrollView setContentSize:CGSizeMake(invoicewidth, invoicescrollHeight)];

    
    self.navigationItem.title = @"Doctors Name";
    
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(patientHomePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    [summarySymptomsTextView.layer setBorderWidth:1.0];
    [summaryDiagnosisTextView.layer setBorderWidth:1.0];
    [summaryTestPrescribedTextView.layer setBorderWidth:1.0];
    self.summaryTableView.layer.borderWidth = 1.0;
    
    documentContentView.hidden = TRUE;
    doctorNoteContentView.hidden = TRUE;
    treatmentPlanContentView.hidden = TRUE;
    invoiceContentView.hidden = TRUE;
    [summaryTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    summaryTableView.tag = 1;
    documentTableView.tag = 2;
    
    // Do any additional setup after loading the view.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return array.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return array.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    UILabel *l = (UILabel *)[cell viewWithTag:10];
    l.text = [array objectAtIndex:indexPath.row];
    return cell;
}

- (void)viewDidLayoutSubviews {
    self.treatmentCollectionScrollView.contentSize = self.treatmentCollectionView.frame.size;
    self.invoiceCollectionScroll.contentSize = self.invoiceCollectionView.frame.size;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    if (tableView == summaryTableView) {
        return 1;
    }
    if (tableView == documentTableView) {
        return 1;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (tableView == summaryTableView) {
        return 1;
    }
    if (tableView == documentTableView) {
        return 1;
    }

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    int row = [indexPath row];

    
    if (tableView.tag == 1) {
        PatientAllDetailSummaryInformationCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        cell.summaryMedicineNameLabel.text = @"Summary";
        return cell;
    }
    if(tableView.tag == 2)
    {
        
        PatientAllDetailDocumentInformationCell *cell1 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        cell1.testLabel.text = @"Document";
        
        return cell1;
        
    }
    
    return 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *newVC = segue.destinationViewController;
    
    [PatientAllDetailInformationViewController setPresentationStyleForSelfController:self presentingController:newVC];
}

+ (void)setPresentationStyleForSelfController:(UIViewController *)selfController presentingController:(UIViewController *)presentingController
{
    if ([NSProcessInfo instancesRespondToSelector:@selector(isOperatingSystemAtLeastVersion:)])
    {
        //iOS 8.0 and above
        presentingController.providesPresentationContextTransitionStyle = YES;
        presentingController.definesPresentationContext = YES;
        
        [presentingController setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    }
    else
    {
        [selfController setModalPresentationStyle:UIModalPresentationCurrentContext];
        [selfController.navigationController setModalPresentationStyle:UIModalPresentationCurrentContext];
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)summaryTab:(id)sender {
    summaryContentView.hidden = FALSE;
    documentContentView.hidden = TRUE;
    doctorNoteContentView.hidden = TRUE;
    treatmentPlanContentView.hidden = TRUE;
    invoiceContentView.hidden = TRUE;
    [summaryTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [documentTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [doctorNoteTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [treatmentPlanTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [invoiceTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    

}
- (IBAction)documentTab:(id)sender {
    documentContentView.hidden = FALSE;
    summaryContentView.hidden = TRUE;
    doctorNoteContentView.hidden = TRUE;
    treatmentPlanContentView.hidden = TRUE;
    invoiceContentView.hidden = TRUE;
    [documentTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [summaryTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [doctorNoteTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [treatmentPlanTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [invoiceTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];

}
- (IBAction)treatmentPlanTab:(id)sender {
    treatmentPlanContentView.hidden = FALSE;
    summaryContentView.hidden = TRUE;
    doctorNoteContentView.hidden = TRUE;
    documentContentView.hidden = TRUE;
    invoiceContentView.hidden = TRUE;
    [treatmentPlanTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [documentTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [doctorNoteTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [summaryTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [invoiceTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];

}
- (IBAction)invoiceTab:(id)sender {
    invoiceContentView.hidden = FALSE;
    summaryContentView.hidden = TRUE;
    doctorNoteContentView.hidden = TRUE;
    treatmentPlanContentView.hidden = TRUE;
    documentContentView.hidden = TRUE;
    [invoiceTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [documentTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [doctorNoteTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [treatmentPlanTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [summaryTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
}
- (IBAction)doctorNoteTab:(id)sender {
    doctorNoteContentView.hidden = FALSE;
    summaryContentView.hidden = TRUE;
    documentContentView.hidden = TRUE;
    treatmentPlanContentView.hidden = TRUE;
    invoiceContentView.hidden = TRUE;
    [doctorNoteTabButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [documentTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [summaryTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [treatmentPlanTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [invoiceTabButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
}
- (IBAction)summarySave:(id)sender {
}

- (IBAction)summarySymptoms:(id)sender {
    
    PatientSymptomHistoryViewController *symptoms =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientSymptomHistoryViewController"];
    [self.navigationController pushViewController:symptoms animated:YES];
    
}

- (IBAction)summaryDiagnosis:(id)sender {
    
    PatientDiagnosisHistoryViewController *diagnosis =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientDiagnosisHistoryViewController"];
    [self.navigationController pushViewController:diagnosis animated:YES];

}

- (IBAction)summaryMedicinePrescribed:(id)sender {
    
    PatientMedicineHistoryViewController *medicine =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientMedicineHistoryViewController"];
    [self.navigationController pushViewController:medicine animated:YES];
    
}

- (IBAction)summaryTestPrescribed:(id)sender {
    
    PatientTestPrescribedHistoryViewController *medicine =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientTestPrescribedHistoryViewController"];
    [self.navigationController pushViewController:medicine animated:YES];
    
}
- (IBAction)documentAddFiles:(id)sender {
    
//    UploadDocumentsViewController *upload =
//    [self.storyboard instantiateViewControllerWithIdentifier:@"UploadDocumentsViewController"];
//    [self.navigationController pushViewController:upload animated:YES];
}
- (IBAction)treatmentCheck:(id)sender {
}
@end
