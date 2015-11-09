//
//  Team.h
//  BranchExample
//
//  Created by Santiago Rama on 11/6/15.
//  Copyright © 2015 Santiago Rama. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    TeamColorBlue,
    TeamColorRed,
    TeamColorYellow,
    TeamColorPurple,
    TeamColorGreen,
    TeamColorWhite,
} TeamColorType;

@interface Team : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *stadium;
@property (nonatomic) TeamColorType mainColor;


+ (Team *)teamWithName:(NSString *)name;
+ (NSMutableArray *)teams;
+ (Team *)createTeamWithName:(NSString *)name stadium:(NSString *)stadium color:(TeamColorType)color;
+ (NSString *)stringFromTeamColorType:(TeamColorType)color;
+ (TeamColorType)teamColorTypeFromString:(NSString *)stringColor;

@end
