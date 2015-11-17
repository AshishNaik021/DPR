//
//  EditTemplateView.m
//  Medico
//
//  Created by APPLE on 07/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "EditTemplateView.h"
#import "EditTemplateDetailViewCell.h"
#import "AddNewTemplateView.h"

@interface EditTemplateView ()

@end

@implementation EditTemplateView
@synthesize editFieldArr = _editFieldArr;


- (void)viewDidLoad {
    NSLog(@"EditTemplateView.m");
    [super viewDidLoad];
    self.navigationItem.title = @"Edit Fields";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    NSLog(@"my array-------------------%@",_editFieldArr);
    
  // self.navigationItem.backBarButtonItem.title = @"Back";
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _editFieldArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EditTemplateDetailViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1" forIndexPath:indexPath];
    cell.nameLabel1.text = [[_editFieldArr objectAtIndex:indexPath.row]objectForKey:@"fieldDisplayName"];
    cell.systemNameLabel1.text = [[_editFieldArr objectAtIndex:indexPath.row]objectForKey:@"fieldName"];
    cell.typeLabel1.text = [[_editFieldArr objectAtIndex:indexPath.row]objectForKey:@"fieldType"];
    cell.defaultValueLabel1.text = [[_editFieldArr objectAtIndex:indexPath.row]objectForKey:@"fieldDefaultValue"];
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

- (IBAction)addTemplateField:(id)sender {
    
    AddNewTemplateView *addTemplate =
    [self.storyboard instantiateViewControllerWithIdentifier:@"AddNewTemplateView"];
    addTemplate.passTemplateId = [[_editFieldArr objectAtIndex:0] objectForKey:@"templateId"];
    [self.navigationController pushViewController:addTemplate animated:YES];
    
}
- (IBAction)removeTemplateField:(id)sender {
}
@end
