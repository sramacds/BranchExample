//
//  AppDelegate.m
//  BranchExample
//
//  Created by Santiago Rama on 11/4/15.
//  Copyright © 2015 Santiago Rama. All rights reserved.
//

#import "AppDelegate.h"
#import <Branch.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    Branch *branch = [Branch getInstance];
    [branch initSessionWithLaunchOptions:launchOptions andRegisterDeepLinkHandler:^(NSDictionary *params, NSError *error) {
        // params are the deep linked params associated with the link that the user clicked before showing up.
        NSLog(@"deep link data: %@", [params description]);
    }];
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options
{
    [[Branch getInstance] handleDeepLink:url];
    return YES;
}

@end
