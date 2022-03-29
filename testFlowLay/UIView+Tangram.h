//
//  UIView+Tangram.h
//  Tangram
//
//  Copyright (c) 2017-2018 Alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class TangramView;


@interface UIView (Tangram)
- (void)removeRoundedCorners;
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii;

- (NSArray *)yxRoundCorners;

- (void)setYxRoundCorners:(NSArray *)round;

- (void)addCorner;


@end
