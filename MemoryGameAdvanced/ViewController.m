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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didChooseCard:(CardView *)cardView
{
    NSLog(@"Chose card! %i", cardView.tag);
}

@end
