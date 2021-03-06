//
//  SearchResultAssistantViewController.h
//  Medico
//
//  Created by APPLE on 14/10/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultAssistantViewController : UIViewController
@property IBOutlet NSArray *assistantTotal;
@property NSString *assistantName;
@property (weak, nonatomic) IBOutlet UITextField *searchField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
- (IBAction)search:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *addNewAssistantButton;
- (IBAction)addNewAssistant:(id)sender;

@end
