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

@end

@implementation CardView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        for (UIView *__view in self.subviews) {
            if ([__view isKindOfClass:[UILabel class]]) {
                self.label = ((UILabel *)(__view));
                self.label.text = nil;
            }
        }
    }
    return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.delegate didChooseCard:self];
}

- (void)showCard
{
    self.backgroundColor = [UIColor whiteColor];
    self.label.text = [NSString stringWithFormat:@"%i", self.tag];
}

- (void)hideCard
{
    self.backgroundColor = [UIColor purpleColor];
    self.label.text = nil;
}

- (void)eliminateCard
{
    [self removeFromSuperview];
}

@end
