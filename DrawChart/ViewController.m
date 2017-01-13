//
//  ViewController.m
//  DrawChart
//
//  Created by JJT on 17/1/11.
//  Copyright © 2017年 SJZ. All rights reserved.
//

#import "ViewController.h"
#import "BarChart.h"
#import "RadiusView.h"
#import "CircleView.h"
@interface ViewController ()




@end


//rgb宏定义
#define COLOR_RGBHEX(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//颜色
#define RGBA(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define RGB(R,G,B) RGBA(R,G,B,1.0)

//字
#define FONT_SYS(SIZE) [UIFont systemFontOfSize:SIZE]
#define FONT_BOLD(SIZE) [UIFont boldSystemFontOfSize:SIZE]
#define FONT_NAME(N,S) [UIFont fontWithName:(N) size:(S)]

//尺寸
#define W_IDTH [UIScreen mainScreen].bounds.size.width
#define H_EIGHT [UIScreen mainScreen].bounds.size.height

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self createUI];
}

- (void)createUI{
    
    self.view.backgroundColor = RGB(241, 245, 249);
    UIView *colorBackgroundView = [[UIView alloc]init];
    colorBackgroundView.frame = CGRectMake(0, 0,W_IDTH, H_EIGHT);
    [self.view addSubview:colorBackgroundView];
    
    //背景颜色渐变
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    
    CGColorRef color1 = CGColorCreate(colorSpaceRef, (CGFloat[]){90/255.0,134/255.0,218/255.0,1.0});
    CGColorRef color2 = CGColorCreate(colorSpaceRef, (CGFloat[]){80/255.0,176/255.0,210/255.0,1.0});
    CGColorRef color3 = CGColorCreate(colorSpaceRef, (CGFloat[]){122/255.0,216/255.0,213/255.0,1.0});
    
    gradientLayer.colors = @[(__bridge id)color1,(__bridge id)color2,(__bridge id)color3];
    //设置颜色开始位置
    gradientLayer.startPoint = CGPointMake(0, 0);
    //设置颜色结束位置位置
    gradientLayer.endPoint = CGPointMake(1, 1);
    gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(colorBackgroundView.frame), CGRectGetHeight(colorBackgroundView.frame));
    [colorBackgroundView.layer addSublayer:gradientLayer];
    
    
    NSArray *dataList = @[@200,@400,@600,@800,@1000,@1200,@1400,@1200,@1000,@800,@600,@200,@100];
    UILabel *saleL = [[UILabel alloc]initWithFrame:CGRectMake(0, 40, W_IDTH, 30)];
    saleL.layer.cornerRadius = 2.f;
    saleL.textColor = [UIColor whiteColor];
    saleL.textAlignment = NSTextAlignmentCenter;
    saleL.layer.masksToBounds = YES;
    saleL.text = @"1、柱状图";
    [colorBackgroundView addSubview:saleL];
    
    
    
    BarChart *barChart = [[BarChart alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(saleL.frame)+10, W_IDTH -50, 100) values:dataList];
    barChart.barColor= [UIColor whiteColor];
    [colorBackgroundView addSubview:barChart];
    
    for (int i = 1; i<=dataList.count; i ++) {
        
        UILabel *numLabel = [[UILabel alloc]init ];
        numLabel.frame =CGRectMake((W_IDTH - 50)*(i-1)/12+17, CGRectGetMaxY(barChart.frame), (W_IDTH-180)/12+15, 15);
        numLabel.textColor = [UIColor whiteColor];
        numLabel.textAlignment = NSTextAlignmentCenter;
        numLabel.font = [UIFont systemFontOfSize:6.f];
        
            
        numLabel.text = [NSString stringWithFormat:@"%d",i];
        
        [colorBackgroundView addSubview:numLabel];
    }
    
    NSInteger max = [[dataList valueForKeyPath:@"@max.intValue"] integerValue];
    NSInteger min = [[dataList valueForKeyPath:@"@min.intValue"] integerValue];
    
    NSLog(@"max:%ld+min:%ld",(long)max,(long)min);
    
    float height = self.view.frame.size.height;
    float width  = self.view.frame.size.width;
    
    float  barHeight;
    
    for(int i=0;i<dataList.count;i++)
    {
        float value = [dataList[i] floatValue];
        
        if(max != min)
        {
            barHeight = ((value-min)/(max-min))*(height+height/width*20);
            
        }
        
    }
    
    NSString *JJJJJ = [NSString stringWithFormat:@"%ld",max/5];
    NSLog(@"====%@",JJJJJ);
    
    switch (JJJJJ.length/2) {
        case 1:
            max =max/50*10;
            break;
        case 2:
            max = max/500*100;
            break;
        case 3:
            max = max/5000*1000;
            break;
            
        default:
            break;
    }
    
    for (int i = 0; i<6; i ++) {
        
        UILabel *numLabel = [[UILabel alloc]init ];
        numLabel.frame =CGRectMake(W_IDTH-50,CGRectGetMaxY(barChart.frame)-100/5*i-10,40,20);
        numLabel.text = [NSString stringWithFormat:@"%ld",max*i];
        
        if (max == 0 && i>0) {
            numLabel.text = @"";
        }
        
        numLabel.textAlignment = NSTextAlignmentRight;
        numLabel.textColor = [UIColor whiteColor];
        numLabel.font = [UIFont systemFontOfSize:6.f];
        [colorBackgroundView addSubview:numLabel];
        
        if (i>=1) {
            UIImageView *lineImageV = [[UIImageView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(numLabel.frame)-10, W_IDTH -50, 1)];
            lineImageV.image = [UIImage imageNamed:@"homepage_xian"];
            [colorBackgroundView addSubview:lineImageV];
        }
    }
    
    
    
    
    UILabel *RadiusL = [[UILabel alloc]initWithFrame:CGRectMake(0, 20+CGRectGetMaxY(barChart.frame)+20, W_IDTH, 30)];
    RadiusL.layer.cornerRadius = 2.f;
    RadiusL.textColor = [UIColor whiteColor];
    RadiusL.textAlignment = NSTextAlignmentCenter;
    RadiusL.layer.masksToBounds = YES;
    RadiusL.text = @"2、扇形图";
    [colorBackgroundView addSubview:RadiusL];
    
    RadiusView *radiusV = [[RadiusView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(RadiusL.frame)+20, W_IDTH -40, 120)];
    radiusV.barColor= [UIColor whiteColor];
    [colorBackgroundView addSubview:radiusV];
    
    
    UILabel *signleL = [[UILabel alloc]initWithFrame:CGRectMake(0, 20+CGRectGetMaxY(radiusV.frame)+20, W_IDTH, 30)];
    signleL.layer.cornerRadius = 2.f;
    signleL.textColor = [UIColor whiteColor];
    signleL.textAlignment = NSTextAlignmentCenter;
    signleL.layer.masksToBounds = YES;
    signleL.text = @"3、曲线";
    [colorBackgroundView addSubview:signleL];
    
    
    CircleView *Circle = [[CircleView alloc]initWithFrame:CGRectMake((W_IDTH-104)/2, CGRectGetMaxY(signleL.frame)+20, 104, 200)];
    Circle.barColor= [UIColor whiteColor];
    [colorBackgroundView addSubview:Circle];
    
    
   
    

   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
