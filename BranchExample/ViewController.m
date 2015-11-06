//
//  ViewController.m
//  BranchExample
//
//  Created by Santiago Rama on 11/4/15.
//  Copyright © 2015 Santiago Rama. All rights reserved.
//

#import "ViewController.h"
#import "TeamsTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)viewTeamsAction:(id)sender
{
    TeamsTableViewController *teamsViewController = [[TeamsTableViewController alloc] init];
    [self showViewController:teamsViewController sender:nil];
}

@end
