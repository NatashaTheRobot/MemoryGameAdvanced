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
@property (nonatomic) int numberOfCardsTouched;
@property (nonatomic) int numberOfMissedMatches;

@property (nonatomic) float timeInMilliseconds;
@property (strong, nonatomic) NSTimer *timer;

@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

- (IBAction)resetGameWithButton:(id)sender;

- (void)runTimer:(NSTimer *)timer;
- (void)startTimer;


@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.numberOfCardViewsDisplayed = 0;
    self.numberOfCardsTouched = 0;
    self.numberOfMissedMatches = 0;
    self.openCards = [NSMutableArray array];
    
    [self displayCardsWithNumberOfColumns:4 numberOfRows:4];

}

- (void)displayCardsWithNumberOfColumns:(NSUInteger)columns numberOfRows:(NSUInteger)rows
{

    float x = 10.0;
    float y = 55.0;
    
    for (int row = 0; row < rows; row++) {
        
        for (int column = 0; column < columns; column++) {
            CGRect frame = CGRectMake(x, y, 65, 100);
            
            CardView *cardView = [[CardView alloc] initWithFrame:frame];
            cardView.delegate = self;
            [self.view addSubview:cardView];
            x += 75.0;
        }
        x = 10.0;
        y += 120.0;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startTimer
{
    self.timeInMilliseconds = 0.00f;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(runTimer:) userInfo:nil repeats:YES];
    
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void)runTimer:(NSTimer *)timer
{
    self.timeInMilliseconds += 0.01f;
    self.timeLabel.text = [NSString stringWithFormat:@"%.2f", self.timeInMilliseconds];
}

- (void)didChooseCard:(CardView *)cardView
{
    self.numberOfCardsTouched++;
    
    if (self.numberOfCardsTouched == 1) {
        [self startTimer];
    }
    
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
                    [self.timer invalidate];
                    GameStatsViewController *gameStatsViewController = [[GameStatsViewController alloc] initWithNibName:@"GameStatsViewController" bundle:nil];
                    
                    gameStatsViewController.timeInMilliseconds = self.timeInMilliseconds;
                    gameStatsViewController.totalMissed = self.numberOfMissedMatches;
                    
                    [self.navigationController pushViewController:gameStatsViewController animated:YES];
                }
            } else {
                self.numberOfMissedMatches++;
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

- (IBAction)resetGameWithButton:(id)sender
{
    GameViewController *newGameViewController = [[GameViewController alloc] initWithNibName:@"GameViewController" bundle:nil];
    [self.navigationController pushViewController:newGameViewController animated:NO];
}
@end
