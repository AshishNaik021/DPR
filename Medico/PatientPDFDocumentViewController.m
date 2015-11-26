//
//  PatientPDFDocumentViewController.m
//  Medico
//
//  Created by Apple on 26/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "PatientPDFDocumentViewController.h"
#import "PatientPDFDocumentCell.h"
#import "PatientLandingPageViewController.h"
#import "PatientUploadPDFDocumentViewController.h"

@interface PatientPDFDocumentViewController ()

@end

@implementation PatientPDFDocumentViewController

- (void) homePage:(id)sender{
    PatientLandingPageViewController *PatientHome =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientLandingPageViewController"];
    [self.navigationController pushViewController:PatientHome animated:YES];
    
}

- (void) addDocument:(id)sender{
    PatientUploadPDFDocumentViewController *upload =
    [self.storyboard instantiateViewControllerWithIdentifier:@"PatientUploadPDFDocumentViewController"];
    [self.navigationController pushViewController:upload animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"PatientPDFDocumentViewController.m");
    self.navigationItem.title = @"Doctor's Name";
    
    UIImage *myImage = [UIImage imageNamed:@"home.png"];
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc]  initWithImage:myImage style:UIBarButtonItemStylePlain target:self action:@selector(homePage:)];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addDocument:)];
    NSArray *buttonArr = [[NSArray alloc] initWithObjects:homeButton,addButton, nil];
    self.navigationItem.rightBarButtonItems = buttonArr;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];

    
    // Do any additional setup after loading the view.
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
    
    static NSString *CellIdentifier = @"Cell";
    PatientPDFDocumentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    return cell;
    
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
