//
//  ASSearchDoctorCustomCell.h
//  Massage App
//
//  Created by MD on 15.06.15.
//  Copyright (c) 2015 hh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASSearchDoctorCustomCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *photoDoctor;
@property (weak, nonatomic) IBOutlet UILabel     *nameDoctor;
@property (weak, nonatomic) IBOutlet UILabel     *ageDoctor;
@property (weak, nonatomic) IBOutlet UILabel     *priceDoctor;

@end
