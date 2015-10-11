//
//  ASDetailViewController.m
//  Massage App
//
//  Created by MD on 15.06.15.
//  Copyright (c) 2015 hh. All rights reserved.
//

#import "ASDetailViewController.h"


@interface ASDetailViewController ()

@end

@implementation ASDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* urlPhoto = [self.obj.photoGalary objectAtIndex:0];
    NSURL*    url = [[NSURL alloc]initWithString:urlPhoto];
    
    
    [self.smallPhoto setImageWithURL:url];
    
    self.firstMassage.text   =  [NSString stringWithFormat:@"Oil massage 1h : %@",self.obj.oilPrice];
    self.secondMassage.text  =  [NSString stringWithFormat:@"Dry massage 1h : %@",self.obj.dryPrice];
    self.thirdMassage.text   =  [NSString stringWithFormat:@"Junlipsun massage 1h : %@",self.obj.junlipsunPrice];
    
    self.firstPhoneNumber.text  = self.obj.numberPhone1;
    self.secondPhoneNumber.text = self.obj.numberPhone2;

    self.photosArray  = self.obj.photoGalary;
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [self.photosArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cellCollection";
   
    ASDetailCustomCell *cell = (ASDetailCustomCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];

    [[cell contentView] setFrame:[cell bounds]];
    [[cell contentView] setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    
    NSString* urlPhoto = [self.photosArray objectAtIndex:indexPath.row];
    NSURL*    url = [[NSURL alloc]initWithString:urlPhoto];
    
    UIImage* placeholder = [UIImage imageNamed:@"nophotobig.png"];
    
    [cell.bigImage setImageWithURL:url placeholderImage:placeholder];
 
    
    return cell;
    
}

#pragma mark - Send Sms

- (IBAction)sendSmsAction:(id)sender {
    
    NSString *numberPhoneDoctor = [NSString stringWithFormat:@"%@",self.obj.numberPhone1];
    [self showSMS:numberPhoneDoctor];
}

- (void)showSMS:(NSString*)numberPhone {
    
    if(![MFMessageComposeViewController canSendText]) {
        UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your device doesn't support SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [warningAlert show];
        return;
    }
    
    //NSArray *recipents = @[@"12345678", @"72345524"];
    NSString *message = [NSString stringWithFormat:@"Just sent the %@ file to your email. Please check!", numberPhone];
    
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
    messageController.messageComposeDelegate = self;
    [messageController setRecipients:@[numberPhone]];
    [messageController setBody:message];
    
    [self presentViewController:messageController animated:YES completion:nil];
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult) result
{
    switch (result) {
        case MessageComposeResultCancelled:
            break;
            
        case MessageComposeResultFailed:
        {
            UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to send SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [warningAlert show];
            break;
        }
            
        case MessageComposeResultSent:
            break;
            
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}




#pragma mark - Send Email


- (IBAction)sendEmailAction:(id)sender {
    
    NSString *emailTitle = @"Test Email";
    // Email Content
    NSString *messageBody = @"iOS programming is so fun!";
    // To address
    //NSArray *toRecipents = [NSArray arrayWithObject:@"support@appcoda.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:@[self.obj.emailAddress]];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];

}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}


#pragma mark - Call Number

- (IBAction)callNumber:(id)sender {
    
    if (((UIButton *)sender).tag==1) {
        NSString* str = [NSString stringWithFormat:@"telprompt:%@",self.obj.numberPhone1];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    } else {
        NSString* str = [NSString stringWithFormat:@"telprompt:%@",self.obj.numberPhone2];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    }
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
