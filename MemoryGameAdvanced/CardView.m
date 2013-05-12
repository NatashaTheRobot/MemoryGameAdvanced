//
//  CardView.m
//  MemoryGameAdvanced
//
//  Created by Natasha Murashev on 5/9/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "CardView.h"

@interface CardView ()

@property (nonatomic) BOOL cardIsOpen;
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation CardView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor purpleColor];
    }
    return self;
}

- (void)makeImageView:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    self.imageView = [[UIImageView alloc] initWithImage:image];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!self.cardIsOpen) {
        [self.delegate didChooseCard:self];
    }
}

- (void)showCard
{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.imageView];
    self.cardIsOpen = YES;
}

- (void)hideCard
{
    self.backgroundColor = [UIColor purpleColor];
    [self.imageView removeFromSuperview];
    self.cardIsOpen = NO;
}

- (void)eliminateCard
{
    [self removeFromSuperview];
}

@end
