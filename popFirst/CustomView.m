//
//  CustomView.m
//  popFirst
//
//  Created by genilex3 on 16/7/7.
//  Copyright © 2016年 wei63w. All rights reserved.
//

#import "CustomView.h"
#define PI 3.14159265358979323846
@implementation CustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor(context, 1, 0, 0, 1.0);
    UIFont *font = [UIFont boldSystemFontOfSize:15.0];
    
//    CGContextSetRGBFillColor(context, 1, 1, 1, 1.0);//画笔颜色
//    CGContextSetLineWidth(context, 1.0);//线宽度
//    CGContextAddArc(context, 100, 20, 15, 0, 2*PI, 0);//添加一个圆
//     CGContextDrawPath(context, kCGPathStroke); //绘制路径
    
    
    //画大圆并填充颜
    UIColor*aColor = [UIColor colorWithRed:1 green:0.0 blue:0 alpha:1];
    CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
    CGContextSetLineWidth(context, 3.0);//线的宽度
    CGContextAddArc(context, 0, 0, self.frame.size.height, self.frame.size.width, 2*PI, 0); //添加一个圆
    //kCGPathFill填充非零绕数规则,kCGPathEOFill表示用奇偶规则,kCGPathStroke路径,kCGPathFillStroke路径填充,kCGPathEOFillStroke表示描线，不是填充
    CGContextDrawPath(context, kCGPathFillStroke); //绘制路径加填充
}


@end
