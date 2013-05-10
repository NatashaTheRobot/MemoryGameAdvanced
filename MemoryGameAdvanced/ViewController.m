//
//  ViewController.m
//  MemoryGameAdvanced
//
//  Created by Natasha Murashev on 5/9/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "ViewController.h"
#import "CardView.h"


@interface ViewController ()

@property NSMutableArray *openCards;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    for (UIView *__view in self.view.subviews) {
        if ([__view isKindOfClass:[CardView class]]) {
            ((CardView *)(__view)).delegate = self;
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
    } else if (self.openCards.count == 2) {
        NSLog(@"%i", ((CardView *)(self.openCards[0])).tag);
        if (((CardView *)(self.openCards[0])).tag == ((CardView *)(self.openCards[0])).tag) {
            NSLog(@"Match Found!!!!");
            for (CardView *card in self.openCards) {
                [card eliminateCard];
            }
        } else {
            for (CardView *card in self.openCards) {
                [card hideCard];
            }
        }
        
        [self.openCards removeAllObjects];
        [self.openCards addObject:cardView];
        [cardView showCard];
    }
}

@end
