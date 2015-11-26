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

- (void) patientHomePage:(id)sender{
    PatientLandingPageViewController *PatientHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientLandingPageViewController"];
    [self.navigationController pushViewController:PatientHome animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"PatientAllDetailInformationViewController.m");
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
@end
