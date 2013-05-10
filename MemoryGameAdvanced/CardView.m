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
@property (nonatomic) BOOL eliminated;

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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!self.eliminated) {
        [self.delegate didChooseCard:self];
    }
}

- (void)showCard
{
    self.backgroundColor = [UIColor whiteColor];
    self.label.text = [NSString stringWithFormat:@"%i", self.tag];
}

- (void)hideCard
{
    self.backgroundColor = [UIColor orangeColor];
    self.label.text = nil;
}

- (void)eliminateCard
{
    self.eliminated = TRUE;
    self.backgroundColor = [UIColor brownColor];
    self.label.text = nil;
}

@end
