//
//  CircleView.m
//  DrawChart
//
//  Created by JJT on 17/1/12.
//  Copyright © 2017年 SJZ. All rights reserved.
//

#import "CircleView.h"
#import "UIView+ZXQuartz.h"
@implementation CircleView

-(id)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        
    }
    return self;
}

-(void)setBarColor:(UIColor *)theBarColor
{
    _barColor = theBarColor;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect{
    
    [self.barColor setFill];
    [self.barColor setStroke];
    
                
    [self drawCurveFrom:CGPointMake(2, 2) to:CGPointMake(100, 2) controlPoint1:CGPointMake(0, 0) controlPoint2:CGPointMake(50, 50)];
              
    
    
    
}

@end
