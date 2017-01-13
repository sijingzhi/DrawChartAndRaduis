//
//  BarChart.m
//  DrawChart
//
//  Created by JJT on 17/1/11.
//  Copyright © 2017年 SJZ. All rights reserved.


#import "BarChart.h"
#import "UIView+ZXQuartz.h"


@implementation BarChart

-(id)initWithFrame:(CGRect)frame values:(NSArray *)aValues;
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        values = aValues;
    }
    return self;
}

-(void)setBarColor:(UIColor *)theBarColor
{
    _barColor = theBarColor;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [self.barColor setFill];
    [self.barColor setStroke];

    float height   = self.frame.size.height;
    float width    = self.frame.size.width;
    float space    = 15;//柱子的间隔

    float barWidth = (width - 180)/12;
    
    
     NSInteger max = [[values valueForKeyPath:@"@max.intValue"] integerValue];
     NSInteger min = [[values valueForKeyPath:@"@min.intValue"] integerValue];
    
    for(int i=0;i<values.count;i++)
    {
        float value = [values[i] floatValue];
        
        float barHeight = height;
        
        if(max != min)
        {
            
            barHeight = (((value-min)/(max-min))*(height+height/width));

          
        }else if(max == min) {
            
            barHeight = 0.f;
        }

        
        CGRect bar = CGRectMake(space*(i+1)+barWidth*i,height-barHeight,barWidth,barHeight);
        
         [self drawRectangle:bar withRadius:2.f];
        
    
        

       
    }
}


@end
