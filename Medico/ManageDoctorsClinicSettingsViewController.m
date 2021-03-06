//
//  ManageDoctorsClinicSettingsViewController.m
//  Medico
//
//  Created by APPLE on 12/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "ManageDoctorsClinicSettingsViewController.h"
#import "ManageDoctorsClinicSettingsCell.h"
#import "SearchClinicView.h"
#import "CreateDoctorsClinicSettingsViewController.h"
#import "DoctorLandingPageView.h"
#import "SearchResultClinicForDoctorViewController.h"

@interface ManageDoctorsClinicSettingsViewController ()

@end

@implementation ManageDoctorsClinicSettingsViewController
@synthesize allClinicArr;
@synthesize checkDelete;

- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}

-(void)fetchAllClinics{
    NSLog(@"The fetchJson method is called.........");
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    NSString *email = [[NSUserDefaults standardUserDefaults] objectForKey:@"loggedInEmail"];

    
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/getDoctorsClinic?id=%@",email];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    //NSMutableArray *arratList = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"Data in Array==============%@",responseStr);
    
    /* ---------- Code for Writing response data into the file -------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getDoctorsClinic.json"];
    [responseStr writeToFile:docPath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
    
    /* ---------- End of Code for Writing response data into the file -------------- */
    
    
}

-(IBAction)searchClinicFunction:(id)sender{
    
    SearchClinicView *searchClinic =
    [self.storyboard instantiateViewControllerWithIdentifier:@"SearchClinicView"];
    [self.navigationController pushViewController:searchClinic animated:YES];
    
}

- (void)viewDidLoad {
    NSLog(@"ManageDoctorsClinicSettingsViewController.m");
    [super viewDidLoad];
    self.navigationItem.title = @"Manage Clinics";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    //    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"ClinicList" ofType:@"json"];
    //    NSString *myJson = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:NULL];
    //    NSError *error = nil;
    //    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[myJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    //    allClinicArr = [json valueForKeyPath:@"ClinicList"];
    
   // UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(searchClinicFunction:)];
    UIImage *myImage = [UIImage imageNamed:@"ic_home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
 self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:120.0/255.0 green:199.0/255.0 blue:211.0/255.0 alpha:0];
    
    [self fetchAllClinics];
    
    /* ----------------- Read File For Parse JSON Data -------------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getDoctorsClinic.json"];
    NSLog(@"%@",docPath);
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:docPath encoding:NSUTF8StringEncoding error:NULL];
    
    NSError *error = nil;
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    
    allClinicArr = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&error];
    
    
    NSLog(@"MY Clinics--------------%@",allClinicArr);
    
    checkDelete = NO;
    
    
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return allClinicArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    ManageDoctorsClinicSettingsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    int row = [indexPath row];
    
    if (![[[allClinicArr objectAtIndex:row] objectForKey:@"clinicName"] isEqual:[NSNull null]]){
        cell.clinicNameLabel.text = [[allClinicArr objectAtIndex:row] objectForKey:@"clinicName"];
    }
    else{
        cell.clinicNameLabel.text = @"";
    }
    
    if (![[[allClinicArr objectAtIndex:row] objectForKey:@"location"] isEqual:[NSNull null]]){
        cell.clinicCityLabel.text = [[allClinicArr objectAtIndex:row] objectForKey:@"location"];
    }
    else{
        cell.clinicCityLabel.text = @"";
    }
    
    
   // cell.doctorImage.image = [UIImage imageNamed:@"manageClinics.png"];
    
    return cell;
    
}

-(void)deleteClinic:(id)sender{
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

- (IBAction)addNew:(id)sender {
    SearchResultClinicForDoctorViewController *add =
    [self.storyboard instantiateViewControllerWithIdentifier:@"SearchResultClinicForDoctorViewController"];
    [self.navigationController pushViewController:add animated:YES];

}
- (IBAction)remove:(id)sender {
}
@end
