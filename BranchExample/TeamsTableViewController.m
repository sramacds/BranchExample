//
//  TeamsTableViewController.m
//  BranchExample
//
//  Created by Santiago Rama on 11/6/15.
//  Copyright © 2015 Santiago Rama. All rights reserved.
//

#import "TeamsTableViewController.h"
#import "Team.h"
#import "TeamTableViewCell.h"
#import "TeamViewController.h"

@interface TeamsTableViewController ()

@end

@implementation TeamsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TeamTableViewCell" bundle:nil]
         forCellReuseIdentifier:@"teamCell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [Team teams].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TeamTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"teamCell" forIndexPath:indexPath];
    
    [cell setCellWithTeam:[[Team teams] objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Team *team = [[Team teams] objectAtIndex:indexPath.row];
    TeamViewController *teamViewController = [[TeamViewController alloc] initWithTeam:team];
    [self showViewController:teamViewController sender:nil];
}

@end
