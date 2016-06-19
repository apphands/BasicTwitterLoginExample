//
//  ViewController.m
//  TwitterLogin
//
//  Created by Randy Edmonds on 6/16/16.
//  Copyright © 2016 RandyEdmonds. All rights reserved.
//

#import "ViewController.h"
#import <TwitterKit/TwitterKit.h>

@interface ViewController ()
@property (nonatomic,strong) IBOutlet TWTRLogInButton *twitterLoginButton;
@property (nonatomic,strong) IBOutlet UIButton *twitterLogoutButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTwitterButton];
}

-(void)setupTwitterButton {
    __weak typeof(self) weakself = self;
    if ([[[Twitter sharedInstance] sessionStore] session] == nil){
        weakself.twitterLoginButton.hidden = NO;
        weakself.twitterLogoutButton.hidden = YES;
        [self.twitterLoginButton setLogInCompletion:^(TWTRSession *  session,  NSError *  error){
            if(error != nil) {
                //error state
                
            } else {
                weakself.twitterLoginButton.hidden = YES;
                weakself.twitterLogoutButton.hidden = NO;
            }
        }];
    }
    else {
        self.twitterLoginButton.hidden = YES;
        self.twitterLogoutButton.hidden = NO;
    }
}

-(IBAction)twitterLogout:(id)sender {
    NSString *userID = [[[[Twitter sharedInstance] sessionStore] session] userID];
    [[[Twitter sharedInstance] sessionStore] logOutUserID:userID];
    [self setupTwitterButton];
}

@end
