//
//  TeamTableViewCell.m
//  BranchExample
//
//  Created by Santiago Rama on 11/6/15.
//  Copyright © 2015 Santiago Rama. All rights reserved.
//

#import "TeamTableViewCell.h"

@implementation TeamTableViewCell

- (void)setCellWithTeam:(Team *)team
{
    switch (team.mainColor) {
        case TeamColorBlue:
            self.contentView.backgroundColor = [UIColor blueColor];
            break;
        case TeamColorRed:
            self.contentView.backgroundColor = [UIColor redColor];
            break;
        case TeamColorGreen:
            self.contentView.backgroundColor = [UIColor greenColor];
            break;
        case TeamColorWhite:
            self.contentView.backgroundColor = [UIColor whiteColor];
            break;
        case TeamColorPurple:
            self.contentView.backgroundColor = [UIColor purpleColor];
            break;
        case TeamColorYellow:
            self.contentView.backgroundColor = [UIColor yellowColor];
            break;
        default:
            break;
    }
    
    self.teamNameLabel.text = team.name;
    self.teamStadiumLabel.text = team.stadium;
}

@end
