//
//  MatchDelegate.h
//  MemoryGameAdvanced
//
//  Created by Natasha Murashev on 5/9/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CardView;

@protocol MatchDelegate <NSObject>

-(void)didChooseCard:(CardView *)cardView;

@end
