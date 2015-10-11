//
//  ASSearchDoctorTableView.m
//  Massage App
//
//  Created by MD on 15.06.15.
//  Copyright (c) 2015 hh. All rights reserved.
//

#import "ASSearchDoctorTableView.h"
#import "ASSearchDoctorCustomCell.h"
#import "ASDetailViewController.h"
#import "ASDoctor.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"


@interface ASSearchDoctorTableView ()

@end

@implementation ASSearchDoctorTableView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self simpleJsonParsing];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Parsing

- (void)simpleJsonParsing
{
    NSString *requestString = @"https://copy.com/P6VPnVncesxVayHT";
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:requestString]];
    
    NSError *error;
    NSDictionary *arrayJSON = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    NSMutableArray* arr = [NSMutableArray new];
    

    
    for (NSDictionary *dict in arrayJSON)
    {
        ASDoctor *doc       = [[ASDoctor alloc]init];
        doc.name            = [dict valueForKey:@"name"];
        doc.age             = [dict valueForKey:@"age"];
        doc.price           = [dict valueForKey:@"price"];
        doc.numberPhone1    = [dict valueForKey:@"numberPhone1"];
        doc.numberPhone2    = [dict valueForKey:@"numberPhone2"];
        doc.emailAddress    = [dict valueForKey:@"emailAddress"];
        //doc.photoURL        = [dict valueForKey:@"photoURL"];
        
        doc.oilPrice        = [dict valueForKey:@"oilPrice"];
        doc.dryPrice        = [dict valueForKey:@"dryPrice"];
        doc.junlipsunPrice  = [dict valueForKey:@"junlipsunPrice"];
        
        
        doc.photoGalary     = [dict valueForKey:@"photoArray"];
        
      [arr addObject:doc];
    }
    self.arrayDoctors = arr;
    
    
    NSLog(@"This is arrrr !!!! %@",arr);
    
    for (ASDoctor* obj in arr) {
        NSLog(@"\n------------");
        NSLog(@"Name = %@",obj.name);
        NSLog(@"Age = %@",obj.age);
        NSLog(@"Price = %@",obj.price);
    }
    
    
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  [self.arrayDoctors count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    static NSString *cellIdentifier = @"Cell";
    
    ASSearchDoctorCustomCell *cell = (ASSearchDoctorCustomCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (cell == nil) {
        cell = [[ASSearchDoctorCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    

    

    NSString* urlPhoto = [[[self.arrayDoctors objectAtIndex:indexPath.row]photoGalary] objectAtIndex:0];
    NSURL*    url = [[NSURL alloc]initWithString:urlPhoto];
    
    UIImage* placeholder = [UIImage imageNamed:@"placeHolder.jpg"];
    
    [cell.photoDoctor setImageWithURL:url placeholderImage:placeholder];
    cell.photoDoctor.layer.cornerRadius = 15;
    cell.photoDoctor.layer.masksToBounds = YES;
    
    NSString* name  = [[self.arrayDoctors objectAtIndex:indexPath.row]name];
    NSString* age   = [[self.arrayDoctors objectAtIndex:indexPath.row]age];
    NSString* price = [[self.arrayDoctors objectAtIndex:indexPath.row]price];
    
    cell.nameDoctor.text = name;
    cell.ageDoctor.text  = [NSString stringWithFormat:@"Age %@",age];
    cell.priceDoctor.text = [NSString stringWithFormat:@"Price %@",price];

    
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
 
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ASDetailViewController *vc2 = (ASDetailViewController *)[storyboard  instantiateViewControllerWithIdentifier:@"ASDetailViewController"];

    ASDoctor* obj = [self.arrayDoctors objectAtIndex:indexPath.row];
    vc2.obj             = obj;
   

    [self.navigationController pushViewController:vc2 animated:YES];
    
    
    
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
