//
//  TeamViewController.m
//  BranchExample
//
//  Created by Santiago Rama on 11/6/15.
//  Copyright © 2015 Santiago Rama. All rights reserved.
//

#import "TeamViewController.h"

@interface TeamViewController ()

@property (strong, nonatomic) NSString *teamName;
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UILabel *teamNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *teamStadiumLabel;

@end

@implementation TeamViewController

- (TeamViewController *)initWithTeam:(Team *)team
{
    self = [super init];
    
    if (self) {
        self.teamName = team.name;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Team *team = [Team teamWithName:self.teamName];
    
    switch (team.mainColor) {
        case TeamColorBlue:
            self.colorView.backgroundColor = [UIColor blueColor];
            break;
        case TeamColorRed:
            self.colorView.backgroundColor = [UIColor redColor];
            break;
        case TeamColorGreen:
            self.colorView.backgroundColor = [UIColor greenColor];
            break;
        case TeamColorWhite:
            self.colorView.backgroundColor = [UIColor whiteColor];
            break;
        case TeamColorPurple:
            self.colorView.backgroundColor = [UIColor purpleColor];
            break;
        case TeamColorYellow:
            self.colorView.backgroundColor = [UIColor yellowColor];
            break;
        default:
            break;
    }

    self.teamNameLabel.text = team.name;
    self.teamStadiumLabel.text = team.stadium;
}

@end
