//
//  TeamTableViewCell.h
//  BranchExample
//
//  Created by Santiago Rama on 11/6/15.
//  Copyright © 2015 Santiago Rama. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Team.h"

@interface TeamTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *teamNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *teamStadiumLabel;

- (void)setCellWithTeam:(Team *)team;

@end
