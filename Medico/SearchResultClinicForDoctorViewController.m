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

@interface SearchResultClinicForDoctorViewController ()

@end

@implementation SearchResultClinicForDoctorViewController
@synthesize catagoryClinicArr;
@synthesize catagoryLabel;
@synthesize createNewButton;
@synthesize searchCatagory = _searchCatagory;
@synthesize CopyArr;


- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
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
    
    
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/getAllClinics.json"];
    NSLog(@"%@",docPath);
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:docPath encoding:NSUTF8StringEncoding error:NULL];
    
    NSError *error = nil;
    NSData *json = [myJson dataUsingEncoding:NSUTF8StringEncoding];
    
    catagoryClinicArr = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingMutableContainers error:&error];
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"speciality = %@",_searchCatagory];
    CopyArr = [NSMutableArray arrayWithArray:[catagoryClinicArr filteredArrayUsingPredicate:predicate]];
    
    NSLog(@"===========================================%@",CopyArr);
    NSLog(@"Count==================%lu",(unsigned long)CopyArr.count);
    
    
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
    
    cell.searchClinicImage.image = [UIImage imageNamed:@"manageClinics.png"];
    
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
}
@end
