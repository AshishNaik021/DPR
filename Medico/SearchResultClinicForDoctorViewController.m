//
//  SearchResultClinicForDoctorViewController.m
//  Medico
//
//  Created by Apple on 05/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "SearchResultClinicForDoctorViewController.h"
#import "SearchClinicCell.h"
#import "DoctorLandingPageView.h"
#import "DetailClinicView.h"
#import "CreateDoctorsClinicSettingsViewController.h"

@interface SearchResultClinicForDoctorViewController ()

@end

@implementation SearchResultClinicForDoctorViewController
@synthesize catagoryClinicArr;
@synthesize catagoryLabel;
@synthesize createNewButton;
@synthesize searchCatagory = _searchCatagory;
@synthesize CopyArr;
@synthesize searchField;

- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}

-(void)fetchAllClinics{
    NSLog(@"The fetchJson method is called.........");
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
  //  NSString *email = [[NSUserDefaults standardUserDefaults] objectForKey:@"loggedInEmail"];
    
    
    NSString *urlStr = [NSString stringWithFormat:@"http://139.162.31.36:9000/getAllClinics"];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    //NSMutableArray *arratList = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&error];
    NSLog(@"Data in Array==============%@",responseStr);
    
    /* ---------- Code for Writing response data into the file -------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getAllClinics.json"];
    [responseStr writeToFile:docPath atomically:YES encoding:NSUTF8StringEncoding error:NULL];
    
    /* ---------- End of Code for Writing response data into the file -------------- */
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"catagory For Clinic-------%@",_searchCatagory);
    catagoryLabel.text = _searchCatagory;

    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Search Clinics";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    [self fetchAllClinics];
    
    /* ----------------- Read File For Parse JSON Data -------------------- */
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getAllClinics.json"];
    NSLog(@"%@",docPath);
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:docPath encoding:NSUTF8StringEncoding error:NULL];
    
    NSError *error = nil;
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    
    CopyArr = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&error];
    
    
    NSLog(@"MY Clinics--------------%@",CopyArr);

    
//    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getAllClinics.json"];
//    NSLog(@"%@",docPath);
//    NSString *myJson = [[NSString alloc] initWithContentsOfFile:docPath encoding:NSUTF8StringEncoding error:NULL];
//    
//    NSError *error = nil;
//    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
//    
//    catagoryClinicArr = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&error];
//    
//    
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"speciality = %@",_searchCatagory];
//    CopyArr = [NSMutableArray arrayWithArray:[catagoryClinicArr filteredArrayUsingPredicate:predicate]];
//    
//    NSLog(@"===========================================%@",CopyArr);
//    NSLog(@"Count==================%lu",(unsigned long)CopyArr.count);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return CopyArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    SearchClinicCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    int row = [indexPath row];
    int c = (int)CopyArr.count;
    if (c != 0) {
        
        if (![[[CopyArr objectAtIndex:row] objectForKey:@"clinicName"] isEqual:[NSNull null]]){
                    cell.clinicNameLabel.text = [[CopyArr objectAtIndex:row] objectForKey:@"clinicName"];
                }
                else{
                    cell.clinicNameLabel.text = @"";
                }
            
                if (![[[CopyArr objectAtIndex:row] objectForKey:@"location"] isEqual:[NSNull null]]){
                    cell.cityLabel.text = [[CopyArr objectAtIndex:row] objectForKey:@"location"];
                }
                else{
                    cell.cityLabel.text = @"";
                }

    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!"
                                                        message:@"Results not found."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];

    }
    
   // cell.searchClinicImage.image = [UIImage imageNamed:@"manageClinics.png"];
    
    return cell;
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"ShowDetails"]) {
        DetailClinicView *clinicView = [segue destinationViewController];
        NSIndexPath *myIndex = [self.tableView indexPathForSelectedRow];
        int row = [myIndex row];
        clinicView.passClinicName = [[CopyArr objectAtIndex:row] objectForKey:@"clinicName"];
        clinicView.passClinicId = [[CopyArr objectAtIndex:row] objectForKey:@"idClinic"];
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

- (IBAction)createNew:(id)sender {
    CreateDoctorsClinicSettingsViewController *createClinic =
    [self.storyboard instantiateViewControllerWithIdentifier:@"CreateDoctorsClinicSettingsViewController"];
    [self.navigationController pushViewController:createClinic animated:YES];
}
- (IBAction)search:(id)sender {
    
    NSString *textData = searchField.text;
    NSLog(@"data----%@",textData);
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"clinicName = %@",textData];
    
    catagoryClinicArr = [NSMutableArray arrayWithArray:[CopyArr filteredArrayUsingPredicate:predicate]];
    
        NSLog(@"===========================================%@",catagoryClinicArr);
        NSLog(@"Count==================%lu",(unsigned long)catagoryClinicArr.count);

    
}
@end
