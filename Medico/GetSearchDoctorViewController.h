//
//  GetSearchDoctorViewController.h
//  Medico
//
//  Created by Apple on 16/12/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface GetSearchDoctorViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    MKMapView *map;
}
@property (weak, nonatomic) IBOutlet UIView *listContentView;
@property (weak, nonatomic) IBOutlet UIView *mapContentView;

//@property (strong, nonatomic) IBOutlet MKMapView *map;
@property (weak, nonatomic) IBOutlet MKMapView *map;

@property BOOL *radioButton;
@property (weak, nonatomic) IBOutlet UITextField *searchField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
- (IBAction)searchDoctor:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *listRadioButton;
@property (weak, nonatomic) IBOutlet UIButton *mapRadioButton;
- (IBAction)listRadio:(id)sender;
- (IBAction)mapRadio:(id)sender;
//@property (weak, nonatomic) IBOutlet UIView *listContentView;
//@property (weak, nonatomic) IBOutlet UIView *mapContentView;
-(IBAction)radiobuttonSelected:(id)sender;
@property IBOutlet NSMutableArray *jsonList;

@end
