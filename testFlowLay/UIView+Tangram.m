//
//  UIView+Tangram.m
//  Tangram
//
//  Copyright (c) 2017-2018 Alibaba. All rights reserved.
//

#import "UIView+Tangram.h"
#import <objc/runtime.h>

@implementation UIView (Tangram)

- (void)removeRoundedCorners {
    self.layer.mask = nil;
}

- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii {
    
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    
    self.layer.mask = shape;
}


- (NSArray *)yxRoundCorners {
    return objc_getAssociatedObject(self, @selector(yxRoundCorners));
}

- (void)setYxRoundCorners:(NSArray *)round {
    objc_setAssociatedObject(self, @selector(yxRoundCorners), round, OBJC_ASSOCIATION_RETAIN);
}

- (void)addCorner {
    NSArray *roundCorners = [self yxRoundCorners];
    if ([roundCorners isKindOfClass:NSArray.class]) {
        NSArray *cornerList = roundCorners;
        if (cornerList.count >= 4) {
            NSNumber *rect = [cornerList objectAtIndex:0];
            UIRectCorner value = 0;
            CGFloat cornerRadius = 0;
            if (rect.floatValue > 0) {
                value |= UIRectCornerTopLeft;
                cornerRadius = rect.floatValue;
            }
            rect = [cornerList objectAtIndex:1];
            if (rect.floatValue > 0) {
                value |= UIRectCornerTopRight;
                cornerRadius = rect.floatValue;
            }
            rect = [cornerList objectAtIndex:2];
            if (rect.floatValue > 0) {
                value |= UIRectCornerBottomRight;
                cornerRadius = rect.floatValue;
            }
            rect = [cornerList objectAtIndex:3];
            if (rect.floatValue > 0) {
                value |= UIRectCornerBottomLeft;
                cornerRadius = rect.floatValue;
            }

            if (cornerRadius > 0 && value != 0) {
                [self addRoundedCorners:value withRadii:CGSizeMake(cornerRadius, cornerRadius)];
            }
        }
    }

}


@end
