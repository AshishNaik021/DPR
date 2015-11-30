//
//  AllDetailInformationViewController.m
//  Medico
//
//  Created by APPLE on 26/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "AllDetailInformationViewController.h"
#import "DoctorLandingPageView.h"
#import "AllDetailInformationCell.h"

@interface AllDetailInformationViewController ()

@end

@implementation AllDetailInformationViewController
@synthesize summaryTagButton;
@synthesize summaryContentView;
@synthesize documentContentView;
@synthesize doctorsNoteContentView;
@synthesize treatmentPlanContentView;
@synthesize invoiceContentView;
@synthesize documentTagButton;
@synthesize doctorsNoteTagButton;
@synthesize treatmentPlanTagButton;
@synthesize invoicesTagButton;
@synthesize summaryClinicNameField;
@synthesize summaryDiagnosisHistoryButton;
@synthesize summaryDiagnosisTextview;
@synthesize summaryMedicineHistoryButton;
@synthesize summaryMedicineTextView;
@synthesize summaryReferredbyField;
@synthesize summarySaveButton;
@synthesize summarySymptomsHistoryButton;
@synthesize summarySymptomsTextView;
@synthesize summaryTestPrescribedHistoryButton;
@synthesize summaryTestPrescribedTextView;
@synthesize summaryVisiteDateField;
@synthesize summaryVisiteTypeField;
@synthesize doctorsNoteDiagnosisTextView;
@synthesize doctorsNoteNoteTextView;
@synthesize doctorsNoteSaveButton;
@synthesize doctorsNoteSymptomsTextView;
@synthesize array;
@synthesize summaryDatePassData = _summaryDatePassData;
@synthesize summaryPatientEmailPassData = _summaryPatientEmailPassData;
@synthesize summaryTimePassData =_summaryTimePassData;
@synthesize summaryDoctorIDPassData = _summaryDoctorIDPassData;
@synthesize patientAppointmentArray = _patientAppointmentArray;

- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}

-(void)fetchPatientReminder{
    
    NSLog(@"The fetchJson method is called.........");
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    // NSString *emailid = emailField.text;
   
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/getPatientReminder?doctorId=%@&patientId=%@&appointmentDate=%@&appointmentTime=%@",_summaryDoctorIDPassData,_summaryPatientEmailPassData,_summaryDatePassData,_summaryTimePassData];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    //NSMutableArray *arratList = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"Data in Array+++++++++++++++++++++++++++++++++++++++++++++++++++%@",responseStr);
    
//    /* ---------- Code for Writing response data into the file -------------- */
//    
//    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getAllPatientInformation.json"];
//    NSLog(@"%@",docPath);
//    [responseStr writeToFile:docPath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
//    
//    /* ---------- End of Code for Writing response data into the file -------------- */
//    
    

    
}

-(void)fetchAllClinics{
    
}

- (void)viewDidLoad {
    NSLog(@"AllDetailInformationViewController.m");
    [super viewDidLoad];
    
    NSLog(@"Data came from PatientAppointmentsForDoctorViewController (self.pa) :%@",self.patientAppointmentArray);
    NSLog(@"Data came from PatientAppointmentsForDoctorViewController (_pa):%@",_patientAppointmentArray);
    self.summaryMedicinTableView.layer.borderWidth = 1.0;
    
    NSLog(@"Date----------------%@",_summaryDatePassData);
    NSLog(@"Time-----------------%@",_summaryTimePassData);
    NSLog(@"patient Email----------%@",_summaryPatientEmailPassData);
    NSLog(@"DoctorId---------------%@",_summaryDoctorIDPassData);
    
    [self fetchPatientReminder];
    [self fetchAllClinics];
    
    
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Manage Template";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
   
     documentContentView.hidden = TRUE;
     doctorsNoteContentView.hidden = TRUE;
     treatmentPlanContentView.hidden = TRUE;
     invoiceContentView.hidden = TRUE;
    [summaryTagButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     [summarySymptomsTextView.layer setBorderWidth:1.0];
     [summaryTestPrescribedTextView.layer setBorderWidth:1.0];
     [summaryMedicineTextView.layer setBorderWidth:1.0];
     [summaryDiagnosisTextview.layer setBorderWidth:1.0];
     [doctorsNoteSymptomsTextView.layer setBorderWidth:1.0];
     [doctorsNoteNoteTextView.layer setBorderWidth:1.0];
     [doctorsNoteDiagnosisTextView.layer setBorderWidth:1.0];
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
    self.collection.layer.borderWidth = 1.0f;

    

    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    AllDetailInformationCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //for(int count = 0;count<_arr.count;count++){
    int row = [indexPath row];
   // cell.subProcedureName.text = [[subprocedureArr objectAtIndex:row] objectForKey:@"templateName"];
    
    return cell;
    
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *newVC = segue.destinationViewController;
    
    [AllDetailInformationViewController setPresentationStyleForSelfController:self presentingController:newVC];
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)summary:(id)sender {
    summaryContentView.hidden = FALSE;
    documentContentView.hidden = TRUE;
    doctorsNoteContentView.hidden = TRUE;
    treatmentPlanContentView.hidden = TRUE;
    invoiceContentView.hidden = TRUE;
    [summaryTagButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [documentTagButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [doctorsNoteTagButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [treatmentPlanTagButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [invoicesTagButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];

    [self setSummery];
}

-(void)setSummery{
    self.summaryClinicNameField.text = @"Vitthal";
}

- (IBAction)documents:(id)sender {
    documentContentView.hidden = FALSE;
    summaryContentView.hidden = TRUE;
    doctorsNoteContentView.hidden = TRUE;
    treatmentPlanContentView.hidden = TRUE;
    invoiceContentView.hidden = TRUE;
    [documentTagButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [summaryTagButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [doctorsNoteTagButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [treatmentPlanTagButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [invoicesTagButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
}

- (IBAction)doctorsNote:(id)sender {
    doctorsNoteContentView.hidden = FALSE;
    summaryContentView.hidden = TRUE;
    documentContentView.hidden = TRUE;
    treatmentPlanContentView.hidden = TRUE;
    invoiceContentView.hidden = TRUE;
    [doctorsNoteTagButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [documentTagButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [summaryTagButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [treatmentPlanTagButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [invoicesTagButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
}

- (IBAction)treatmentPlan:(id)sender {
    treatmentPlanContentView.hidden = FALSE;
    summaryContentView.hidden = TRUE;
    doctorsNoteContentView.hidden = TRUE;
    documentContentView.hidden = TRUE;
    invoiceContentView.hidden = TRUE;
    [treatmentPlanTagButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [documentTagButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [doctorsNoteTagButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [summaryTagButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [invoicesTagButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
}

- (IBAction)invoices:(id)sender {
    invoiceContentView.hidden = FALSE;
    summaryContentView.hidden = TRUE;
    doctorsNoteContentView.hidden = TRUE;
    treatmentPlanContentView.hidden = TRUE;
    documentContentView.hidden = TRUE;
    [invoicesTagButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [documentTagButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [doctorsNoteTagButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [treatmentPlanTagButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
    [summaryTagButton setTitleColor:[UIColor colorWithRed:19/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]forState:UIControlStateNormal];
}

- (IBAction)summarySymptomsHistory:(id)sender {
}

- (IBAction)summaryDiagnosisHistory:(id)sender {
}

- (IBAction)summaryMedicineHistory:(id)sender {
}

- (IBAction)summaryTestPrescribedHistory:(id)sender {
}

- (IBAction)summarySave:(id)sender {
}

- (IBAction)doctorsNoteSave:(id)sender {
}
@end
