//
//  ASSearchDoctorTableView.h
//  Massage App
//
//  Created by MD on 15.06.15.
//  Copyright (c) 2015 hh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASSearchDoctorTableView : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (weak,   nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray* arrayDoctors;

@end
