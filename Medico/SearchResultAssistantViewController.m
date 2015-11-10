//
//  SearchResultAssistantViewController.m
//  Medico
//
//  Created by APPLE on 14/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "SearchResultAssistantViewController.h"
#import "SearchAssistantCell.h"

@interface SearchResultAssistantViewController ()

@end

@implementation SearchResultAssistantViewController
@synthesize assistantName = _assistantName;

- (void)viewDidLoad {
    NSLog(@"SearchResultAssistantViewController.m");
    [super viewDidLoad];
    self.navigationItem.title = @"Search Assistants";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    NSLog(@"The name of assistant is----------%@",_assistantName);

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _assistantTotal.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableCell";
    SearchAssistantCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    //for(int count = 0;count<_arr.count;count++){
    int row = [indexPath row];
   /* cell.assistantNameLabel.text = [[_assistantTotal objectAtIndex:row] objectForKey:@"Name"];
    cell.assistantCityLabel.text = [[_assistantTotal objectAtIndex:row] objectForKey:@"Location"];
    NSString *nm = [[NSString alloc]init];
    nm = [[_assistantTotal objectAtIndex:row] objectForKey:@"Image"];
    UIImage *img = [UIImage imageNamed:nm];
    cell.assistantImage.image = img;*/
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
