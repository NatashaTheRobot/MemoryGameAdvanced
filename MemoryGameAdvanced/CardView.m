//
//  CardView.m
//  MemoryGameAdvanced
//
//  Created by Natasha Murashev on 5/9/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "CardView.h"

@interface CardView ()

@property (strong, nonatomic) UILabel *label;

- (void)makeLabelView:(CGRect)frame;

@end

@implementation CardView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor purpleColor];
        [self makeLabelView:frame];
    }
    return self;
}

- (void)makeLabelView:(CGRect)frame
{
    CGRect labelFrame = CGRectMake(0, 40, frame.size.width, 20);
    UILabel *label = [[UILabel alloc] initWithFrame:labelFrame];
    label.textAlignment = NSTextAlignmentCenter;
    self.label =  label;
}

- (void)setLabelText:(NSString *)text
{
    self.label.text = text;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.delegate didChooseCard:self];
}

- (void)showCard
{
    self.backgroundColor = [UIColor whiteColor];
    self.label.text = [NSString stringWithFormat:@"%i", self.tag];
    [self addSubview:self.label];
}

- (void)hideCard
{
    self.backgroundColor = [UIColor purpleColor];
    [self.label removeFromSuperview];
}

- (void)eliminateCard
{
    [self removeFromSuperview];
}

@end
