//
//  PatientAppointmentsForDoctorViewController.m
//  Medico
//
//  Created by APPLE on 23/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientAppointmentsForDoctorViewController.h"
#import "DoctorLandingPageView.h"
#import "PatientAppointmentsForDoctorCell.h"
#import "AllDetailInformationViewController.h"
#import "MBProgressHUD.h"

@interface PatientAppointmentsForDoctorViewController ()

@end

@implementation PatientAppointmentsForDoctorViewController

@synthesize jsonList;
@synthesize doctorIdForCallAPI = _doctorIdForCallAPI;
@synthesize patientEmailIdForCallAPI = _patientEmailIdForCallAPI;
@synthesize patientAppointmentArr;
@synthesize appointmentDate;
@synthesize date;
@synthesize tableView;
@synthesize s;

- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}

-(void)fetchAllPatientAppointment{
    
    NSLog(@"The fetchJson method is called.........");
    

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Processing...";

    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/getAllPatientAppointment?doctorId=%@&patientId=%@",_doctorIdForCallAPI,_patientEmailIdForCallAPI];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    //NSMutableArray *arratList = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"Data in Array==============%@",responseStr);
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    hud = nil;

    /* ---------- Code for Writing response data into the file -------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getAllPatientAppointment.json"];
    [responseStr writeToFile:docPath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
    
    /* ---------- End of Code for Writing response data into the file -------------- */
    
    
}

- (void)viewDidLoad {
    NSLog(@"PatientAppointmentsForDoctorViewController.m");
    [super viewDidLoad];
    
    s = [[NSSet alloc]init];
    
    NSLog(@"PatientID>>>>>>>>>>>>>>>%@",_patientEmailIdForCallAPI);
    NSLog(@"DoctorID>>>>>>>>>>>>>>>>>%@",_doctorIdForCallAPI);
    
    UIImage *myImage = [UIImage imageNamed:@"ic_home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Appiontments";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    [self fetchAllPatientAppointment];
    
    /* ----------------- Read File For Parse JSON Data -------------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getAllPatientAppointment.json"];
    NSLog(@"%@",docPath);
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:docPath encoding:NSUTF8StringEncoding error:NULL];
    
    NSError *error = nil;
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    
    patientAppointmentArr = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"dsfhgdfhgsfgfghsdfghjfg%@",patientAppointmentArr);
    
    for (int i = 0; i<patientAppointmentArr.count; i++) {
        
        NSString *str = [NSString stringWithFormat:@"%@",[patientAppointmentArr[i] objectForKey:@"appointmentDateIos"]];
        
        NSArray* components = [str componentsSeparatedByString:@"-"];
        
        NSLog(@"Year only:%@",components[2]);
        NSString *yr = [NSString stringWithFormat:@"%@",components[2]];
        //        s = [NSSet setWithArray:components[2]];
        s = [s setByAddingObject:yr];
        NSLog(@"nsSet Array---------%@",s);
    }
    
    
    
    
    
    
    
    
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return s.count+1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == 0) {
        return 0;
    }
    if (section == 1)
        return patientAppointmentArr.count;
    if (section == 2)
        return patientAppointmentArr.count;
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    int row = [indexPath row];
    
    PatientAppointmentsForDoctorCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath.section == 1){
        
        if (![[[patientAppointmentArr objectAtIndex:row] objectForKey:@"appointmentDateIos"] isEqual:[NSNull class]]){
            
            // appointmentDate = [NSDate dateWithTimeIntervalSinceReferenceDate:(int)[[patientAppointmentArr objectAtIndex:row] objectForKey:@"appointmentDate"]];
            
            //            NSDate *appointmentDate = [NSDate dateWithTimeIntervalSince1970:(int)[args objectForKey:@"appointmentDate"]];
            //
            //            NSLog(@"Appointment Date----- %@",appointmentDate);
            //            NSString *date = [NSString stringWithFormat:@"%@",appointmentDate];
            //            NSLog(@"before-----%@", date);
            //
            //            NSRange range = [date rangeOfString:@"+"];
            //            date = [date substringToIndex:range.location];
            //
            //            NSLog(@"after-----%@", date);
            
            //            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            //
            //            [formatter setDateFormat:@"dd-MMM-yyyy"];
            //            date = [formatter stringFromDate:appointmentDate];
            //
            cell.bookDateLabel.text = [[patientAppointmentArr objectAtIndex:row] objectForKey:@"appointmentDateIos"];
            if ([cell.bookDateLabel.text length] == 0) {
                cell.bookDateLabel.text = [NSString stringWithFormat:@"Not Booked"];
            }
            
        }
        else if (![[[patientAppointmentArr objectAtIndex:row] objectForKey:@"appointmentDate"] isEqual:[NSNull class]]){
            appointmentDate = [NSDate dateWithTimeIntervalSinceReferenceDate:(int)[[patientAppointmentArr objectAtIndex:row] objectForKey:@"appointmentDate"]];
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            
            [formatter setDateFormat:@"dd-MMM-yyyy"];
            date = [formatter stringFromDate:appointmentDate];
            cell.bookDateLabel.text = date;
            if ([cell.bookDateLabel.text length] == 0) {
                cell.bookDateLabel.text = [NSString stringWithFormat:@"Not Booked"];
            }
        }
        else{
            cell.bookDateLabel.text = @"Not Booked";
        }
        
        if (![[[patientAppointmentArr objectAtIndex:row] objectForKey:@"bookTime"] isEqual:[NSNull class]]){
            cell.bookTimeLabel.text = [[patientAppointmentArr objectAtIndex:row] objectForKey:@"bookTime"];
            if ([cell.bookTimeLabel.text length] == 0) {
                cell.bookTimeLabel.text = [NSString stringWithFormat:@"Not Booked"];
            }
        }
        else{
            cell.bookTimeLabel.text = @"Not Booked";
        }
        
        if (![[[patientAppointmentArr objectAtIndex:row] objectForKey:@"visitType"] isEqual:[NSNull null]]){
            cell.visitTypeLabel.text = [[patientAppointmentArr objectAtIndex:row] objectForKey:@"visitType"];
            if ([cell.visitTypeLabel.text length] == 0) {
                cell.visitTypeLabel.text = [NSString stringWithFormat:@"Unknown"];
            }
        }
        else{
            cell.visitTypeLabel.text = @"Unknown";
        }
        
        cell.detailsButton.tag =row;
        [cell.detailsButton addTarget:self action:@selector(detail:) forControlEvents:UIControlEventTouchUpInside];
        
        
        //  cell.bookDateLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"appointmentDate"];
        // cell.bookTimeLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"bookTime"];
        // cell.visitTypeLabel.text = [[jsonList objectAtIndex:row] objectForKey:@"visitType"];
    }
    if (indexPath.section == 2){
        /* if (![[[patientAppointmentArr objectAtIndex:row] objectForKey:@"appointmentDate"] isEqual:[NSNull null]]){
         
         appointmentDate = [NSDate dateWithTimeIntervalSinceNow:(int)[[patientAppointmentArr objectAtIndex:row] objectForKey:@"appointmentDate"]];
         
         NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
         [formatter setDateFormat:@"dd-MMM-yyyy"];
         date = [formatter stringFromDate:appointmentDate];
         
         cell.bookDateLabel.text = date;
         }
         else{
         cell.bookDateLabel.text = @"";
         }
         
         if (![[[patientAppointmentArr objectAtIndex:row] objectForKey:@"bookTime"] isEqual:[NSNull null]]){
         cell.bookTimeLabel.text = [[patientAppointmentArr objectAtIndex:row] objectForKey:@"bookTime"];
         
         }
         else{
         cell.bookTimeLabel.text = @"";
         }
         
         if (![[[patientAppointmentArr objectAtIndex:row] objectForKey:@"visitType"] isEqual:[NSNull null]]){
         cell.visitTypeLabel.text = [[patientAppointmentArr objectAtIndex:row] objectForKey:@"visitType"];
         
         }
         else{
         cell.visitTypeLabel.text = @"";
         }
         
         cell.detailsButton.tag =row;
         [cell.detailsButton addTarget:self action:@selector(detail:) forControlEvents:UIControlEventTouchUpInside];*/
        
    }
    
    
    
    
    return cell;
}

- (void)detail:(id)sender {
    UIButton *senderButton = (UIButton *)sender;
    int n = senderButton.tag;
    
    AllDetailInformationViewController *allInfo =
    [self.storyboard instantiateViewControllerWithIdentifier:@"AllDetailInformationViewController"];
    /* ------------------------------------------ */
    allInfo.summaryTimePassData = [[patientAppointmentArr objectAtIndex:n] valueForKey:@"bookTime"];
    allInfo.summaryDoctorIDPassData = [[patientAppointmentArr objectAtIndex:n] valueForKey:@"doctorId"];
    appointmentDate = [NSDate dateWithTimeIntervalSinceNow:(int)[[patientAppointmentArr objectAtIndex:n] objectForKey:@"appointmentDate"]];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd-MMM-yyyy"];
    date = [formatter stringFromDate:appointmentDate];
    allInfo.summaryDatePassData = [[patientAppointmentArr objectAtIndex:n] objectForKey:@"appointmentDateIos"];
    //allInfo.summaryDatePassData = date; Poonam
    allInfo.summaryPatientEmailPassData = _patientEmailIdForCallAPI;
    allInfo.patientAppointmentArray = patientAppointmentArr;
    [self.navigationController pushViewController:allInfo animated:YES];
}



-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    //    if (section == 0)
    //        return @"Year 2015";
    //    if (section == 1)
    //        return @"Year 2014";
    return @"";
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section == 1)
        return @"Year 2015";
    return @"";
    
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

@end
