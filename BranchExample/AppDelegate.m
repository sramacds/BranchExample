//
//  AppDelegate.m
//  BranchExample
//
//  Created by Santiago Rama on 11/4/15.
//  Copyright © 2015 Santiago Rama. All rights reserved.
//

#import "AppDelegate.h"
#import <Branch.h>
#import "Team.h"
#import "TeamViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    Branch *branch = [Branch getInstance];
    [branch initSessionWithLaunchOptions:launchOptions andRegisterDeepLinkHandler:^(NSDictionary *params, NSError *error) {
        // params are the deep linked params associated with the link that the user clicked before showing up.
        NSLog(@"deep link data: %@", [params description]);
        
        // First we check if we have all the parameters we need
        if (params[@"name"] && params[@"color"] && params[@"stadium"]) {
            //If the team is already created, we show it. If not we create it first
            Team *team;
            if (![Team teamWithName:params[@"name"]]) {
                team = [Team createTeamWithName:params[@"name"]
                                        stadium:params[@"stadium"]
                                          color:[Team teamColorTypeFromString:params[@"color"]]];
            } else {
                team = [Team teamWithName:params[@"name"]];
            }
            
            TeamViewController *teamViewController = [[TeamViewController alloc] initWithTeam:team];
            UINavigationController *navController = (UINavigationController *)self.window.rootViewController;
            [navController pushViewController:teamViewController animated:YES];
        }
    }];
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options
{
    [[Branch getInstance] handleDeepLink:url];
    return YES;
}

@end
