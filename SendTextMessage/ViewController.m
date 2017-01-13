//
//  ViewController.m
//  SendTextMessage
//
//  Created by Prahlad on 1/11/17.
//  Copyright © 2017 Prahlad. All rights reserved.
//

#import "ViewController.h"
#import <MessageUI/MessageUI.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)Button:(id)sender {
    
    MFMessageComposeViewController *textComposer = [[MFMessageComposeViewController alloc] init];
    [textComposer setMessageComposeDelegate:self];
    if ([MFMessageComposeViewController canSendText]) {
        [textComposer setRecipients:NULL];
        [textComposer setBody:[NSString stringWithFormat:@"%@", self.label.text]];
        NSData *data = UIImageJPEGRepresentation(self.imageView.image, 1);
        [textComposer addAttachmentData:data typeIdentifier:@"image/jpeg" filename:@"image.jpeg"];
        [self presentViewController:textComposer animated:YES completion:NULL];
    }else{
        NSLog(@"Cant Send Message");
    }
    
}

-(void)messageComposeViewController:(nonnull MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    switch (result) {
        case MessageComposeResultCancelled:
            NSLog(@"Message Cancelled");
            break;
        case MessageComposeResultFailed:
            NSLog(@"Message Failed");
            break;
        case MessageComposeResultSent:
            NSLog(@"Message Sent");
            
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
