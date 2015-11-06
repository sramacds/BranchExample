//
//  Team.m
//  BranchExample
//
//  Created by Santiago Rama on 11/6/15.
//  Copyright © 2015 Santiago Rama. All rights reserved.
//

#import "Team.h"

@implementation Team

static NSMutableArray * teamPool;

+ (void)initialize
{
    if (!teamPool) {
        teamPool = [[NSMutableArray alloc] init];
        
        Team *team = [[Team alloc] initWithName:@"Central" stadium:@"Parque Palermo" color:TeamColorRed];
        [teamPool addObject:team];
    }
}

- (Team *)initWithName:(NSString *)name stadium:(NSString *)stadium color:(TeamColorType)color
{
    self = [super init];
    
    if (self) {
        self.name = name;
        self.stadium = stadium;
        self.mainColor = color;
    }
    
    return self;
}

+ (Team *)teamWithName:(NSString *)name
{
    for (Team *team in teamPool) {
        if ([team.name isEqualToString:name]) {
            return team;
        }
    }
    
    return nil;
}

+ (NSMutableArray *)teams
{
    return teamPool;
}

+ (Team *)createTeamWithName:(NSString *)name stadium:(NSString *)stadium color:(TeamColorType)color
{
    Team *sameNameTeam = [Team teamWithName:name];
    
    if (sameNameTeam) {
        NSLog(@"Couldn't create team %@. Another team with the same name exists", name);
        return nil;
    }
    
    Team *newTeam = [[Team alloc] initWithName:name stadium:stadium color:color];
    [teamPool addObject:newTeam];
    
    return newTeam;
}

@end
