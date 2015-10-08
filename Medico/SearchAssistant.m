//
//  SearchAssistant.m
//  Medico
//
//  Created by APPLE on 08/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "SearchAssistant.h"

@interface SearchAssistant ()
@property NSArray *array;
@property NSArray *searchResults;

@end

@implementation SearchAssistant

- (void)viewDidLoad {
    [super viewDidLoad];
    self.array = [[NSArray alloc] initWithObjects:@"Apple",@"Samsung", @"HTC", @"LG", nil];
    self.searchResults = [[NSArray alloc]init];
    
}

#pragma Table View Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.searchResults count];
        
    }
    else {
        return [self.array count];
    }
    
    // return _array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    if (tableView == self.searchDisplayController.searchResultsTableView) {
    
        cell.textLabel.text = [self.searchResults objectAtIndex:indexPath.row];
    
    }
    else{
    cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
    }
    return cell;
}
#pragma Search Methods

-(void)filterContentSearchText:(NSString *)searchText scope:(NSString *)scope{
    
  //  NSPredicate p = [NSPredicate predicateWithFormat:@"SELF beginswith[c] %@",searchText];
  //  self.searchResults = [self.array filteredArrayUsingPredicate:p];
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
