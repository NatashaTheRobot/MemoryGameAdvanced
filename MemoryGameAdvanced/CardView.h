//
//  CardView.h
//  MemoryGameAdvanced
//
//  Created by Natasha Murashev on 5/9/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MatchDelegate.h"

@interface CardView : UIView

@property (strong, nonatomic) id<MatchDelegate> delegate;

- (void)setLabelText:(NSString *)text;

- (void)showCard;
- (void)hideCard;
- (void)eliminateCard;

@end
