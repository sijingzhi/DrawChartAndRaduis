//
//  RadiusView.m
//  DrawChart
//
//  Created by JJT on 17/1/12.
//  Copyright © 2017年 SJZ. All rights reserved.
//

#import "RadiusView.h"
#import "UIView+ZXQuartz.h"

@implementation RadiusView

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
//    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect{
    
    [self.barColor setFill];
    [self.barColor setStroke];
    
    for (int i = 0; i <3; i++) {
        switch (i) {
            case 0:
                
                [self drawSectorFromCenter:CGPointMake(2+120*i, 2) radius:self.frame.size.width/4 startAngle:20 endAngle:40 clockwise:YES];
                break;
                
            case 1:
                
                [self drawSectorFromCenter:CGPointMake(2+self.frame.size.width*i/2, 2) radius:self.frame.size.width/4  startAngle:20 endAngle:15 clockwise:YES];
                break;
                
            case 2:
                
                [self drawSectorFromCenter:CGPointMake(2+self.frame.size.width*i/2, 2) radius:self.frame.size.width/4  startAngle:20 endAngle:35 clockwise:YES];
                break;
                
            default:
                break;
        }
    
    
//      [self drawArcFromCenter:CGPointMake(2+120*i, 2+120*i) radius:30.f startAngle:20 endAngle:15 clockwise:YES];
        
    }

  
    
    
}
@end
