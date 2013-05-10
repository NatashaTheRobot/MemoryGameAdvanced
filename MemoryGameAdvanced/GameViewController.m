//
//  ViewController.m
//  MemoryGameAdvanced
//
//  Created by Natasha Murashev on 5/9/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "GameViewController.h"
#import "CardView.h"
#import "GameStatsViewController.h"


@interface GameViewController ()

@property NSMutableArray *openCards;
@property NSInteger numberOfCardViewsDisplayed;

@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.numberOfCardViewsDisplayed = 0;
    
    for (UIView *__view in self.view.subviews) {
        if ([__view isKindOfClass:[CardView class]]) {
            ((CardView *)(__view)).delegate = self;
            self.numberOfCardViewsDisplayed ++;
        }
    }
    
    self.openCards = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didChooseCard:(CardView *)cardView
{
    
    if (self.openCards.count < 2) {
        [cardView showCard];
        [self.openCards addObject:cardView];
        
        if (self.openCards.count == 2) {
            if (((CardView *)(self.openCards[0])).tag == ((CardView *)(self.openCards[1])).tag) {
                for (CardView *card in self.openCards) {
                    [card eliminateCard];
                    self.numberOfCardViewsDisplayed--;
                }
                
                if (self.numberOfCardViewsDisplayed == 0) {
                    
                    GameStatsViewController *gameStatsViewController = [[GameStatsViewController alloc] initWithNibName:@"GameStatsViewController" bundle:nil];
                    // TODO :pass the timer time and # of misses here
                    [self.navigationController pushViewController:gameStatsViewController animated:YES];
                }
            }
        }
    } else {
        for (CardView *card in self.openCards) {
            [card hideCard];
        }

        [self.openCards removeAllObjects];
        [self.openCards addObject:cardView];
        [cardView showCard];
    }
}

@end
