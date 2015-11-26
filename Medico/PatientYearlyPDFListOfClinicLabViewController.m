//
//  PatientYearlyPDFListOfClinicLabViewController.m
//  Medico
//
//  Created by Apple on 26/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientYearlyPDFListOfClinicLabViewController.h"
#import "PatientYearlyPDFListOfClinicLabCell.h"
#import "PatientLandingPageViewController.h"
#import "PatientPDFDocumentViewController.h"
@interface PatientYearlyPDFListOfClinicLabViewController ()

@end

@implementation PatientYearlyPDFListOfClinicLabViewController

- (void) homePage:(id)sender{
    PatientLandingPageViewController *PatientHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientLandingPageViewController"];
    [self.navigationController pushViewController:PatientHome animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"PatientYearlyPDFListOfClinicLabViewController.m");
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    self.navigationItem.title = @"Dr. Clinic";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    // Do any additional setup after loading the view.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 3;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == 0) {
        return 0;
    }
    if (section == 1)
        return 1;
    if (section == 2)
        return 1;
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    int row = [indexPath row];
    
    PatientYearlyPDFListOfClinicLabCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath.section == 1){
        
        cell.showDetailButton.tag =row;
        [cell.showDetailButton addTarget:self action:@selector(showDetail:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    if (indexPath.section == 2){
        
        cell.showDetailButton.tag =row;
        [cell.showDetailButton addTarget:self action:@selector(showDetail:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
    return cell;
}

- (void)showDetail:(id)sender {
    UIButton *senderButton = (UIButton *)sender;
    int n = senderButton.tag;
    
    PatientPDFDocumentViewController *allInfo =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientPDFDocumentViewController"];
    [self.navigationController pushViewController:allInfo animated:YES];
    
}



-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if (section == 0)
        return @"Year 2015";
    if (section == 1)
        return @"Year 2014";
    return @"";
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
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
