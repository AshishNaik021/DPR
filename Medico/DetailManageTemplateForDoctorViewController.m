//
//  DetailManageTemplateForDoctorViewController.m
//  Medico
//
//  Created by Apple on 17/11/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "DetailManageTemplateForDoctorViewController.h"
#import "DetailManageTemplateForDoctorCell.h"


@interface DetailManageTemplateForDoctorViewController ()

@end

@implementation DetailManageTemplateForDoctorViewController
@synthesize procedureName = _procedureName;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Name======%@",_procedureName);
    
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
    
    static NSString *CellIdentifier = @"TableCell";
    DetailManageTemplateForDoctorCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
//    cell.procedureNameLabel.text = [[allProcedureArr objectAtIndex:indexPath.row]objectForKey:@"procedureName"];
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
