//
//  GameStatsViewController.m
//  MemoryGameAdvanced
//
//  Created by Natasha Murashev on 5/10/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "GameStatsViewController.h"
#import "GameViewController.h"

@interface GameStatsViewController ()

@property (strong, nonatomic) IBOutlet UILabel *timePlayedLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalMissedLabel;

- (IBAction)playAgainWithButton:(id)sender;

@end

@implementation GameStatsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.timePlayedLabel.text = [NSString stringWithFormat:@"%.2f", self.timeInMilliseconds];
    self.totalMissedLabel.text = [NSString stringWithFormat:@"%i", self.totalMissed];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playAgainWithButton:(id)sender
{
    GameViewController *gameViewController = [[GameViewController alloc] initWithNibName:@"GameViewController" bundle:nil];
    [self.navigationController pushViewController:gameViewController animated:YES];
}
@end
