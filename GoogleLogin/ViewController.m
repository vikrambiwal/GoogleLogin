//
//  ViewController.m
//  GoogleLogin
//
//  Created by GauravDS on 18/06/16.
//  Copyright © 2016 baltech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
    IBOutlet GIDSignInButton *signInButton;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [GIDSignIn sharedInstance].delegate = self;
    [GIDSignIn sharedInstance].uiDelegate = self;
    [GIDSignIn sharedInstance].clientID = @"589453917038-qaoga89fitj2ukrsq27ko56fimmojac6.apps.googleusercontent.com";
    
    [GIDSignInButton class];
    
    GIDSignIn *signIn = [GIDSignIn sharedInstance];
    signIn.shouldFetchBasicProfile = YES;
    signIn.delegate = self;
    signIn.uiDelegate = self;
    
    
}

- (void)signIn:(GIDSignIn *)signIn
didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
   
    NSLog(@"xxsignIn: %@", signIn);
    NSLog(@"xxuser: %@", user);
    NSLog(@"xxerror: %@", error);
      [self reportAuthStatus];

}

- (void)signIn:(GIDSignIn *)signIn
didDisconnectWithUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    NSLog(@"signIn: %@", signIn);
    NSLog(@"user: %@", user);
    NSLog(@"error: %@", error);
}

- (void)reportAuthStatus {
   
    NSLog(@"Email: %@", [GIDSignIn sharedInstance].currentUser.profile.email);
     NSLog(@"Name: %@", [GIDSignIn sharedInstance].currentUser.profile.name);
//    [self refreshUserInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
