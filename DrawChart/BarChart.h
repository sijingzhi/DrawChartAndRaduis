//
//  BarChart.h
//  DrawChart
//
//  Created by JJT on 17/1/11.
//  Copyright © 2017年 SJZ. All rights reserved.


#import <UIKit/UIKit.h>

@interface BarChart : UIView
{
    NSArray *values;
}

@property(nonatomic,strong)UIColor *barColor;

-(id)initWithFrame:(CGRect)frame values:(NSArray *)aValues;

@end
