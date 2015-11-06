//
//  DetailClinicView.m
//  Medico
//
//  Created by APPLE on 09/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DetailClinicView.h"
#import "DoctorLandingPageView.h"

@interface DetailClinicView ()

@end

@implementation DetailClinicView
@synthesize editClinicPassArr;
@synthesize passClinicName = _passClinicName;
@synthesize passClinicId = _passClinicId;
@synthesize CopyEditArr;
@synthesize clinicId = _clinicId;
@synthesize slotsField;
@synthesize locationTextView;
@synthesize specialityField;


-(void)fetchSearchClinic{
    
    NSLog(@"The fetchJson method is called.........");
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/searchClinic?clinicName=%@",_passClinicName];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    //NSMutableArray *arratList = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"Data in Array==============%@",responseStr);
    
    /* ---------- Code for Writing response data into the file -------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/searchClinic.json"];
    [responseStr writeToFile:docPath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
    
    /* ---------- End of Code for Writing response data into the file -------------- */
    
    
    
}


- (void)viewDidLoad {
    NSLog(@"DetailClinicView.m");
    [super viewDidLoad];
    [specialityField.layer setBorderWidth:1.0];
    [locationTextView.layer setBorderWidth:1.0];
    [slotsField.layer setBorderWidth:1.0];
    NSLog(@"nameeeeeeeeeeeeeeeeeeeeeee=%@",_passClinicName);
    NSLog(@"idddddd=%@",_passClinicId);
    
    [self fetchSearchClinic];
    
    /* ----------------- Read File For Parse JSON Data -------------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/searchClinic.json"];
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:docPath encoding:NSUTF8StringEncoding error:NULL];
    
    NSError *error = nil;
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    
    editClinicPassArr = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"%@",editClinicPassArr);
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"idClinic = %d",[_passClinicId intValue]];
    CopyEditArr = [NSMutableArray arrayWithArray:[editClinicPassArr filteredArrayUsingPredicate:predicate]];
    
    NSLog(@"Final Arrrayyyyyyyyyyyyyy----%@",CopyEditArr);
    
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Edit Clinics";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    // Do any additional setup after loading the view.
}

-(IBAction)homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
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

- (IBAction)always:(id)sender {
}
- (IBAction)currentSlot:(id)sender {
}
- (IBAction)currentDay:(id)sender {
}
- (IBAction)doctorSlot:(id)sender {
}
- (IBAction)manageClinic:(id)sender {
}
- (IBAction)addLocation:(id)sender {
}
- (IBAction)save:(id)sender {
}
@end
