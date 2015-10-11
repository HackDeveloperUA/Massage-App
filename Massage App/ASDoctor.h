//
//  ASDoctor.h
//  Massage App
//
//  Created by MD on 15.06.15.
//  Copyright (c) 2015 hh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASDoctor : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* age;
@property (strong, nonatomic) NSString* price;

@property (strong, nonatomic) NSString* oilPrice;
@property (strong, nonatomic) NSString* dryPrice;
@property (strong, nonatomic) NSString* junlipsunPrice;



@property (strong, nonatomic) NSString* numberPhone1;
@property (strong, nonatomic) NSString* numberPhone2;
@property (strong, nonatomic) NSString* emailAddress;
@property (strong, nonatomic) NSString* photoURL;
@property (strong, nonatomic) NSMutableArray* photoGalary;
@end
