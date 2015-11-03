//
//  DoctorManageAppointmentsViewController.m
//  Medico
//
//  Created by APPLE on 21/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DoctorManageAppointmentsViewController.h"
#import "DoctorManageAppointmentCell.h"
#import "DoctorLandingPageView.h"
#import "DoctorDetailManageAppointmentViewController.h"

@interface DoctorManageAppointmentsViewController (){
    NSInteger _selectedRow;
}

@end

@implementation DoctorManageAppointmentsViewController
@synthesize jsonList = _jsonList;
@synthesize slot1Arr;
@synthesize slot2Arr;
@synthesize slot3Arr;
@synthesize detailManage;


- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}

-(void)fetchAppointmentJson{
    NSLog(@"-------------------------------------------------------");
    NSLog(@"The fetchJson method is called.........");
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    // NSString *emailid = emailField.text;
    NSString *emailid = [[NSUserDefaults standardUserDefaults] objectForKey:@"loggedInEmail"];
    
    NSLog(@"email id for logged in user...%@",emailid);
    NSDateFormatter *dateformate=[[NSDateFormatter alloc]init];
    [dateformate setDateFormat:@"YYYY-MM-dd"];
    NSString *date_String=[dateformate stringFromDate:[NSDate date]];
    
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/getAllDoctorClinics?doctorId=%@&date=%@",emailid,date_String];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"Data from web Service in responceStr------%@",responseStr);
    
    /* ---------- Code for Writing response data into the file -------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getAllDoctorClinics.json"];
    NSLog(@"%@",docPath);
    [responseStr writeToFile:docPath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
    
    /* ---------- End of Code for Writing response data into the file -------------- */
    

    
//
//    //NSMutableArray *arratList = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
//    NSLog(@"Data in Array==============%@",responseStr);
//    
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchAppointmentJson];
    
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Manage Appointments";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    /* ----------------- Read File For Parse JSON Data -------------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getAllDoctorClinics.json"];
    NSLog(@"%@",docPath);
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:docPath encoding:NSUTF8StringEncoding error:NULL];
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    
//    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"getAllDoctorClinics" ofType:@"json"];
//    NSString *myJson = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:NULL];
//    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    NSError *e;
    _jsonList = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&e];
   
    NSLog(@"--------------------------------------------88888888888888888888888-----------------%@",_jsonList);
    NSDictionary *jsonSubDict = [NSJSONSerialization JSONObjectWithData:[myJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&e];
    slot1Arr = [jsonSubDict valueForKeyPath:@"shift1"];
    slot2Arr = [jsonSubDict valueForKeyPath:@"shift2"];
    slot3Arr = [jsonSubDict valueForKeyPath:@"shift3"];
  /*
    NSLog(@"total list of array.......%@",[jsonList objectAtIndex:0]);
    NSLog(@"total list of array.......%lu",(unsigned long)jsonList.count);
    NSLog(@"total list of shift1 array.......%@",slot1Arr);
    NSLog(@"total list of shift2 array.......%@",slot2Arr);
    NSLog(@"total list of shift3 array.......%@",slot3Arr);
    NSLog(@"count slot1 array.......%lu",(unsigned long)slot1Arr.count);
    NSLog(@"count slot1 array.......%lu",(unsigned long)slot2Arr.count);
    NSLog(@"count slot1 array.......%lu",(unsigned long)slot3Arr.count);

    */
    // Do any additional setup after loading the view.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _jsonList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    DoctorManageAppointmentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    int row = [indexPath row];
    
    cell.clinicNameLabel.text = [[_jsonList objectAtIndex:row] objectForKey:@"clinicName"];
    
    if (![[slot1Arr objectAtIndex:row] isEqual:[NSNull null]]) {
        if (![[[slot1Arr objectAtIndex:row] objectForKey:@"shiftTime"] isEqual:[NSNull null]]) {
            cell.slot1Label.text = [[slot1Arr objectAtIndex:row] objectForKey:@"shiftTime"];
        }
    }
    else
    {
        cell.slot1Label.text = @"";
    }

    if (![[slot2Arr objectAtIndex:row] isEqual:[NSNull null]]) {
        if (![[[slot2Arr objectAtIndex:row] objectForKey:@"shiftTime"] isEqual:[NSNull null]]) {
            cell.slot2Label.text = [[slot2Arr objectAtIndex:row] objectForKey:@"shiftTime"];
        }
    }
    else
    {
        cell.slot2Label.text = @"";
    }
    
    if (![[slot3Arr objectAtIndex:row] isEqual:[NSNull null]]) {
        if (![[[slot3Arr objectAtIndex:row] objectForKey:@"shiftTime"] isEqual:[NSNull null]]) {
            cell.slot3Label.text = [[slot1Arr objectAtIndex:row] objectForKey:@"shiftTime"];
        }
    }
    else
    {
        cell.slot3Label.text = @"";
    }
    
    
    
    if (![[slot1Arr objectAtIndex:row] isEqual:[NSNull null]]) {
        if (![[[slot1Arr objectAtIndex:row] objectForKey:@"appointmentCount"] isEqual:[NSNull null]]) {
             [cell.slot1TotalAppointmentCountButton setTitle:[NSString stringWithFormat:@"%@",[[slot1Arr objectAtIndex:row] objectForKey:@"appointmentCount"]] forState:UIControlStateNormal];
        }
    }
    else
    {
        [cell.slot1TotalAppointmentCountButton setTitle:@"" forState:UIControlStateNormal];
    }
    
    if (![[slot2Arr objectAtIndex:row] isEqual:[NSNull null]]) {
        if (![[[slot2Arr objectAtIndex:row] objectForKey:@"appointmentCount"] isEqual:[NSNull null]]) {
            [cell.slot2TotalAppointmentCountButton setTitle:[NSString stringWithFormat:@"%@",[[slot2Arr objectAtIndex:row] objectForKey:@"appointmentCount"]] forState:UIControlStateNormal];
        }
    }
    else
    {
        [cell.slot2TotalAppointmentCountButton setTitle:@"" forState:UIControlStateNormal];
    }

    if (![[slot3Arr objectAtIndex:row] isEqual:[NSNull null]]) {
        if (![[[slot3Arr objectAtIndex:row] objectForKey:@"appointmentCount"] isEqual:[NSNull null]]) {
            [cell.slot3TotalAppointmentCountButton setTitle:[NSString stringWithFormat:@"%@",[[slot3Arr objectAtIndex:row] objectForKey:@"appointmentCount"]] forState:UIControlStateNormal];
        }
    }
    else
    {
        [cell.slot3TotalAppointmentCountButton setTitle:@"" forState:UIControlStateNormal];
    }
    

    if (![[[_jsonList objectAtIndex:row] objectForKey:@"totalAppointmentCount"] isEqual:[NSNull null]]) {
            [cell.doctorTotalAppButton setTitle:[NSString stringWithFormat:@"%@",[[_jsonList objectAtIndex:row] objectForKey:@"totalAppointmentCount"]] forState:UIControlStateNormal];
        
    }
    else
    {
        [cell.doctorTotalAppButton setTitle:@"0" forState:UIControlStateNormal];
    }

    

    cell.clinicImage.image = [UIImage imageNamed:@"manageClinics.png"];
   cell.downArrowButton.tag = indexPath.row;
    
  //  NSArray *newArray = [NSMutableArray arrayWithArray:oldArray];
  
//    detailManage.passDataArr = [NSArray arrayWithArray:jsonList];
    NSLog(@"row======================%d",row);
    
  [cell.downArrowButton addTarget:self action:@selector(downArrow:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
    
}



- (IBAction)downArrow:(id)sender {
    
    UIButton *senderButton = (UIButton *)sender;
       NSLog(@"current Row=%ld",(long)senderButton.tag);
    int n = senderButton.tag;
   // NSIndexPath *path = [NSIndexPath indexPathForRow:senderButton.tag inSection:0];
    NSLog(@"jsonlist---------------------------------------%@",_jsonList[0]);
    detailManage = [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorDetailManageAppointmentViewController"];
    detailManage.passDataArr = _jsonList[n];
    detailManage.detailSlot1 = slot1Arr[n];
    detailManage.detailSlot2 = slot2Arr[n];
    detailManage.detailSlot3 = slot3Arr[n];
    [self.navigationController pushViewController:detailManage animated:YES];
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

- (IBAction)doctorTotalAppointment:(id)sender {
}
@end
