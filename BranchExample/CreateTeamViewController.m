//
//  CreateTeamViewController.m
//  BranchExample
//
//  Created by Santiago Rama on 11/6/15.
//  Copyright © 2015 Santiago Rama. All rights reserved.
//

#import "CreateTeamViewController.h"
#import "Team.h"
#import "TeamViewController.h"

@interface CreateTeamViewController ()

@property (nonatomic) TeamColorType mainColor;

@property (weak, nonatomic) IBOutlet UITextField *teamNameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *stadiumNameTextField;

@property (weak, nonatomic) IBOutlet UIButton *blueColorButton;
@property (weak, nonatomic) IBOutlet UIButton *redColorButton;
@property (weak, nonatomic) IBOutlet UIButton *yellowColorButton;
@property (weak, nonatomic) IBOutlet UIButton *purpleColorButton;
@property (weak, nonatomic) IBOutlet UIButton *greenColorButton;
@property (weak, nonatomic) IBOutlet UIButton *whiteColorButton;

@end

@implementation CreateTeamViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.blueColorButton.layer.borderWidth = 2.0f;
    self.redColorButton.layer.borderWidth = 2.0f;
    self.yellowColorButton.layer.borderWidth = 2.0f;
    self.purpleColorButton.layer.borderWidth = 2.0f;
    self.greenColorButton.layer.borderWidth = 2.0f;
    self.whiteColorButton.layer.borderWidth = 2.0f;
    
    self.mainColor = TeamColorBlue;
    [self setSelectedColorBorder];
}

- (IBAction)createTeamAction:(id)sender
{
    Team *newTeam = [Team createTeamWithName:self.teamNameTextfield.text
                                     stadium:self.stadiumNameTextField.text
                                       color:self.mainColor];
    
    if (newTeam) {

        TeamViewController *teamViewController = [[TeamViewController alloc] initWithTeam:newTeam];
        [self showViewController:teamViewController sender:nil];
        
    } else {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error"
                                                                                 message:@"Another team with the same name already exists"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (IBAction)colorSelected:(UIButton *)sender
{
    if (sender == self.blueColorButton) {
        self.mainColor = TeamColorBlue;
    } else if (sender == self.redColorButton) {
        self.mainColor = TeamColorRed;
    } else if (sender == self.yellowColorButton) {
        self.mainColor = TeamColorYellow;
    } else if (sender == self.purpleColorButton) {
        self.mainColor = TeamColorPurple;
    } else if (sender == self.greenColorButton) {
        self.mainColor = TeamColorGreen;
    } else if (sender == self.whiteColorButton) {
        self.mainColor = TeamColorWhite;
    }
    
    [self setSelectedColorBorder];
}

- (void)setSelectedColorBorder
{
    self.blueColorButton.layer.borderColor = self.mainColor == TeamColorBlue ? [UIColor blackColor].CGColor : [UIColor whiteColor].CGColor;
    self.redColorButton.layer.borderColor = self.mainColor == TeamColorRed ? [UIColor blackColor].CGColor : [UIColor whiteColor].CGColor;
    self.yellowColorButton.layer.borderColor = self.mainColor == TeamColorYellow ? [UIColor blackColor].CGColor : [UIColor whiteColor].CGColor;
    self.purpleColorButton.layer.borderColor = self.mainColor == TeamColorPurple ? [UIColor blackColor].CGColor : [UIColor whiteColor].CGColor;
    self.greenColorButton.layer.borderColor = self.mainColor == TeamColorGreen ? [UIColor blackColor].CGColor : [UIColor whiteColor].CGColor;
    self.whiteColorButton.layer.borderColor = self.mainColor == TeamColorWhite ? [UIColor blackColor].CGColor : [UIColor whiteColor].CGColor;
}

@end
