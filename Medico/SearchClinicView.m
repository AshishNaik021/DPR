//
//  SearchClinicView.m
//  Medico
//
//  Created by APPLE on 08/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "SearchClinicView.h"
#import "SearchClinicCell.h"
#import "DoctorLandingPageView.h"
#import "ClinicInformationView.h"

@interface SearchClinicView ()

@end

@implementation SearchClinicView
@synthesize nameRadiobutton;
@synthesize phoneRadioButton;
@synthesize emailRadioButton;

- (void) homePage:(id)sender{
    DoctorLandingPageView *DoctorHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"DoctorHome"];
    [self.navigationController pushViewController:DoctorHome animated:YES];
    
}

- (void)viewDidLoad {
    NSLog(@"SearchClinicView.m");
    [super viewDidLoad];
    
    nameRadioClicked = NO;
    phoneRadioClicked = NO;
    emailradioClicked = NO;
    gridTableView.backgroundColor = [UIColor clearColor];
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Search Clinics";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"ClinicList" ofType:@"json"];
    NSString *myJson = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:NULL];
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[myJson dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    _dataArr = [json valueForKeyPath:@"ClinicList"];
    int total;
    total = _dataArr.count;
    self.totalClinicLabel.text = [NSString stringWithFormat:@"%d Clinics",total];
    self.totalClinicImage.image = [UIImage imageNamed:@"manageClinics.png"];
    
    
    
    
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    SearchClinicCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //for(int count = 0;count<_arr.count;count++){
    int row = [indexPath row];
    cell.clinicNameLabel.text = [[_dataArr objectAtIndex:row] objectForKey:@"Name"];
    cell.cityLabel.text = [[_dataArr objectAtIndex:row] objectForKey:@"Location"];
    cell.searchClinicImage.image = [UIImage imageNamed:@"manageClinics.png"];
    return cell;
    
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString:@"ShowDetails"]) {
    ClinicInformationView *cliniInformation = [segue destinationViewController];
    NSIndexPath *myIndex = [gridTableView indexPathForSelectedRow];
    int row = [myIndex row];
    cliniInformation.totalDetail = @[_dataArr[row]];
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

- (IBAction)search:(id)sender {
}
- (IBAction)nameRadio:(id)sender {
    if(!nameRadioClicked){
        [nameRadiobutton setImage:[UIImage imageNamed:@"checkRadio.png"]forState:UIControlStateNormal];
        nameRadioClicked = YES;
    }
    else if(nameRadioClicked){
        [nameRadiobutton setImage:[UIImage imageNamed:@"unchechRadio.png"]forState:UIControlStateNormal];
        nameRadioClicked = NO;
        
    }
    
    
}
- (IBAction)phoneRadio:(id)sender {
    if(!phoneRadioClicked){
        [phoneRadioButton setImage:[UIImage imageNamed:@"checkRadio.png"]forState:UIControlStateNormal];
        phoneRadioClicked = YES;
    }
    else if(phoneRadioClicked){
        [phoneRadioButton setImage:[UIImage imageNamed:@"unchechRadio.png"]forState:UIControlStateNormal];
        phoneRadioClicked = NO;
        
    }
}
- (IBAction)emailRadio:(id)sender {
    if(!emailradioClicked){
        [emailRadioButton setImage:[UIImage imageNamed:@"checkRadio.png"]forState:UIControlStateNormal];
        emailradioClicked = YES;
    }
    else if(emailradioClicked){
        [emailRadioButton setImage:[UIImage imageNamed:@"unchechRadio.png"]forState:UIControlStateNormal];
        emailradioClicked = NO;
        
    }
}
@end
