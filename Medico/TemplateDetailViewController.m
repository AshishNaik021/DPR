//
//  TemplateDetailViewController.m
//  Medico
//
//  Created by APPLE on 07/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "TemplateDetailViewController.h"
#import "TemplateDetailCell.h"

@interface TemplateDetailViewController ()

@end

@implementation TemplateDetailViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TemplateDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1" forIndexPath:indexPath];
    cell.nameLabel.text = [NSString stringWithFormat:@"Name %ld", (long)indexPath.row];
    cell.systemNameLabel.text = [NSString stringWithFormat:@"Start %ld", (long)indexPath.row];
    cell.typeLabel.text = [NSString stringWithFormat:@"End %ld", (long)indexPath.row];
    return cell;
}



- (void)viewDidLoad {
    [super viewDidLoad];
   // gridTableView.backgroundColor = [UIColor clearColor];
    self.navigationItem.title = _subArr[0];
   // self.navigationItem.backBarButtonItem.title = @"Back";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];


    // Do any additional setup after loading the view.
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
