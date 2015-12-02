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

@synthesize  keyboardVisible;
@synthesize offset;
@synthesize height;
@synthesize width;
@synthesize screen;
@synthesize scrollHeight;
@synthesize pickerArr;
@synthesize returnString;

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
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"loggedInUserType"] isEqualToString:@"Doctor"]) {
        DoctorLandingPageView *DoctorHome =
        [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
        [self.navigationController pushViewController:DoctorHome animated:YES];
    }
    else{
        NSLog(@"Redirect to patient landing");
    }
    
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
    
    // NSLog(@"Data came from PatientAppointmentsForDoctorViewController (self.pa) :%@",self.patientAppointmentArray);
    //NSLog(@"Data came from PatientAppointmentsForDoctorViewController (_pa):%@",_patientAppointmentArray);
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
    
    [self setAllValuesInSummary];
    
}

-(void)setAllValuesInSummary{
    NSLog(@"_patientAppointmentArray:%@",_patientAppointmentArray);
    if ([self checkInternetConnection]){
        [self getSummaryDetails];
        [self setClinicName];
    }
    else{
        [self noNetworkAlert];
    }
}
-(BOOL)checkInternetConnection{
    //        [self.view endEditing:YES];
    //    [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
    NSURL *scriptUrl = [NSURL URLWithString:@"http://www.msftncsi.com/ncsi.txt"];
    NSData *data = [NSData dataWithContentsOfURL:scriptUrl];
    if (data){
        NSLog(@"Device is connected to the internet");
        //[spinner stopAnimating];
        return 1;
    } else{
        //        [spinner stopAnimating];
        NSLog(@"Device is not connected to the internet");
        return 0;
    }
}
-(void)noNetworkAlert{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please try once you are connected to internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
-(void)setPrescription:(NSString *)prescription{
    self.summaryTestPrescribedTextView.text = [NSString stringWithFormat:prescription];
}
-(void)setDiagnosis:(NSString *)diagnosis{
    self.summaryDiagnosisTextview.text = [NSString stringWithFormat:diagnosis];
}
-(void)setSymptom:(NSString *)symptom{
    self.summarySymptomsTextView.text = [NSString stringWithFormat:symptom];
}
-(void)setVisitType:(NSString *)type{
    //temporary commented for crash once uipicker up it will work
//    self.summaryVisiteTypeField.text = [NSString stringWithFormat:type];
    self.summaryVisiteTypeButton.userInteractionEnabled = false;
}
-(void)setVisitedDate:(NSString *)date{
    self.summaryVisiteDateField.text = [NSString stringWithFormat:date];
}
-(void)setClinicName{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/getAllPatientClinics?patientId=%@",_summaryPatientEmailPassData];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSMutableArray *arratList = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"cliniclist call:%@",arratList);

    for (int i = 0; i < arratList.count; i++) {
        NSLog(@"typeofidclinic %@",[[arratList[i] valueForKey:@"idClinic"] class]);
        NSLog(@"typeofclinicid::%@",[[self.patientAppointmentArray[0] valueForKey:@"clinicId"] class]);
        if ([[arratList[i] valueForKey:@"idClinic"] isEqualToNumber:[self.patientAppointmentArray[0] valueForKey:@"clinicId"]]) {
            self.summaryClinicNameField.text = [arratList[i] valueForKey:@"clinicName"];
        }
    }
    if ([self.summaryClinicNameField.text isEqualToString:@""]) {
    self.summaryClinicNameField.text = [NSString stringWithFormat:@"NA"];
    }
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
    [self setAllValuesInSummary];
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
    [self setDoctorsNote];
}

-(void)setDoctorsNote{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/getDoctorNotes?doctorId=%@&patientId=%@&appointmentDate=%@&appointmentTime=%@",_summaryDoctorIDPassData,[self.patientAppointmentArray[0] valueForKey:@"patientId"],_summaryDatePassData,_summaryTimePassData];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSMutableArray *arratList = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"Error : %@",error.localizedDescription);
    }
    else if([arratList isKindOfClass:[NSNull class]]){
        self.doctorsNoteSymptomsTextView.text = @"NA";
        self.doctorsNoteDiagnosisTextView.text = @"NA";
        self.doctorsNoteNoteTextView.text = @"NA";
    }
    else {
        if ([[arratList valueForKey:@"symptoms"] isKindOfClass:[NSNull class]]) {
        self.doctorsNoteSymptomsTextView.text = @"NA";
        }
        else{
        self.doctorsNoteSymptomsTextView.text = [arratList valueForKey:@"symptoms"];
        }
        if ([[arratList valueForKey:@"diagnosis"] isKindOfClass:[NSNull class]]) {
            self.doctorsNoteDiagnosisTextView.text = @"";
        }
        else{
            self.doctorsNoteDiagnosisTextView.text = [arratList valueForKey:@"diagnosis"];
        }
        if ([[arratList valueForKey:@"doctorNotes"] isKindOfClass:[NSNull class]]) {
            self.doctorsNoteNoteTextView.text = @"";
        }
        else{
            self.doctorsNoteNoteTextView.text = [arratList valueForKey:@"doctorNotes"];
        }

    }
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
    if ([self checkInternetConnection]) {
        [self submitNotes];
    }
    else{
        [self noNetworkAlert];
    }
}
-(void)getSummaryDetails{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/getPatientReminder?doctorId=%@&patientId=%@&appointmentDate=%@&appointmentTime=%@",_summaryDoctorIDPassData,_summaryPatientEmailPassData,_summaryDatePassData,_summaryTimePassData];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSMutableArray *arratList = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"Error : %@",error.localizedDescription);
    }
    else{
        if ([array isKindOfClass:[NSNull class]]) {
            NSLog(@"Empty array");
            self.summaryTestPrescribedTextView.text = @"NA";
            self.summaryDiagnosisTextview.text = @"NA";
            self.summarySymptomsTextView.text = @"NA";
            self.summaryVisiteTypeField.text = @"NA";
            self.summaryVisiteDateField.text = @"NA";
            self.summaryClinicNameField.text = @"NA";
        }
        NSLog(@"arraylist%@",arratList);
        if (![[arratList valueForKey:@"testsPrescribed"]isKindOfClass:[NSNull class]]) {
            [self setPrescription:[arratList valueForKey:@"testsPrescribed"]];
        }
        else{
            [self setPrescription:@"NA"];
        }
//        if (![[arratList valueForKey:@"medicinePrescribed"]isKindOfClass:[NSNull class]]) {
//            [self :[arratList valueForKey:@"medicinePrescribed"]];
//        }
//        else{
//            [self setPrescription:@"NA"];
//        }
        if (![[arratList valueForKey:@"diagnosis"]isKindOfClass:[NSNull class]]) {
            [self setDiagnosis:[arratList valueForKey:@"diagnosis"]];
        }
        else{
            [self setDiagnosis:@"NA"];
        }
        if (![[arratList valueForKey:@"symptoms"]isKindOfClass:[NSNull class]]) {
            [self setSymptom:[arratList valueForKey:@"symptoms"]];
        }
        else{
            [self setSymptom:@"NA"];
        }
        if (![[arratList valueForKey:@"visitType"]isKindOfClass:[NSNull class]]) {
            [self setVisitType:[arratList valueForKey:@"visitType"]];
        }
        else{
            [self setVisitType:@"NA"];
        }
        if (![[arratList valueForKey:@"visitDate"]isKindOfClass:[NSNull class]]) {
            [self setVisitedDate:[arratList valueForKey:@"visitDate"]];
        }
        else{
            [self setVisitedDate:@"NA"];
        }
        
    }
    
    
}

//save doc note
-(void)submitNotes{
    //    [self.view endEditing:YES];
    returnString = @"";
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL * url = [NSURL URLWithString:@"http://139.162.31.36:9000/saveDoctorNotes"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    NSString * params =[NSString stringWithFormat:@"\{\"appointmentDate\":\"%@\",\"appointmentTime\":\"%@\",\"diagnosis\":\"%@\",\"doctorId\":\"%@\",\"doctorNotes\":\"%@\",\"patientId\":\"%@\",\"symptoms\":\"%@\"}",[self.patientAppointmentArray[0] valueForKey:@"appointmentDateIos"],[self.patientAppointmentArray[0] valueForKey:@"bookTime"],self.doctorsNoteDiagnosisTextView.text,[self.patientAppointmentArray[0] valueForKey:@"doctorId"],self.doctorsNoteNoteTextView.text,[self.patientAppointmentArray[0] valueForKey:@"patientId"],self.doctorsNoteSymptomsTextView.text];
    NSLog(@"%@",params);
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                                       completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                           NSLog(@"Response:%@ Error : %@\n", response, error);
                                                           //NSLog(@"Response Code:%@",[response valueForKey:@"status code"]);
                                                           if(error == nil)
                                                           {
                                                               returnString = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
                                                               NSLog(@"Data = %@",returnString);
                                                               NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                               NSLog(@"response status code: %ld", (long)[httpResponse statusCode]);
                                                               if ([httpResponse statusCode] == 200) {
                                                                   [self parseJSON:returnString];
                                                               } else {
                                                                   [self errorMessage];
                                                               }
                                                           }
                                                           else if ([error.localizedDescription isEqualToString:@"The request timed out."]){
                                                               [self requestTimeOut];
                                                           }
                                                           else {
                                                               [self errorMessage];
                                                           }
                                                           
                                                       }];
    [dataTask resume];
    
}

-(void)errorMessage{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please try again later." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(void)requestTimeOut{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please try again later." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
-(void)threadStartAnimating:(id)data
{
 //   [spinner startAnimating];
    [self.view setUserInteractionEnabled:NO];
    
}
-(void)viewDidDisappear:(BOOL)animated{
   // self.loginButton.enabled = YES;
}


-(void)parseJSON : (NSString *)responseData{
    NSString * jsonString = responseData;
    //NSStringEncoding  encoding;
    NSData * jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError * error=nil;
    NSDictionary * parsedData = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    NSLog(@"NSDictionery:%@",parsedData);
    if ([parsedData isKindOfClass:[NSNull class]]) {
        [self errorMessage];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Awesome!" message:@"Dcotor's Note Has been Updated." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan:withEvent:");
    [self.view endEditing:YES];
}




@end
