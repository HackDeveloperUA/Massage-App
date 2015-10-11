//
//  ASDetailViewController.h
//  Massage App
//
//  Created by MD on 15.06.15.
//  Copyright (c) 2015 hh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASDoctor.h"
#import "ASSearchDoctorTableView.h"
#import "ASDetailCustomCell.h"
#import "UIImageView+AFNetworking.h"
#import <MessageUI/MessageUI.h>


@interface ASDetailViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate, MFMessageComposeViewControllerDelegate>

@property (strong,nonatomic) NSMutableArray* photosArray;
@property (strong,nonatomic) ASDoctor* obj;

@property (weak, nonatomic) IBOutlet UIImageView *smallPhoto;
@property (weak, nonatomic) IBOutlet UILabel *firstMassage;
@property (weak, nonatomic) IBOutlet UILabel *secondMassage;
@property (weak, nonatomic) IBOutlet UILabel *thirdMassage;

@property (weak, nonatomic) IBOutlet UILabel *firstPhoneNumber;
@property (weak, nonatomic) IBOutlet UILabel *secondPhoneNumber;

@end
