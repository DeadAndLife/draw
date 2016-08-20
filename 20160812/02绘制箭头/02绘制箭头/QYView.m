//
//  QYView.m
//  02绘制箭头
//
//  Created by qingyun on 16/8/12.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "QYView.h"

@implementation QYView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //1.获取当前上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //2.绘制小三角形
    CGContextMoveToPoint(ctx, 100, 80);
    CGContextAddLineToPoint(ctx, 110, 100);
    CGContextAddLineToPoint(ctx, 90,100);
    //关闭路径时,自动绘制一个多边形
    CGContextClosePath(ctx);
    
    
    //5.剪切
    //5.1绘制矩形的区域
    CGContextAddRect(ctx, rect);
    //5.2 修改当前剪切路径,使用奇偶法则
    CGContextEOClip(ctx);
    
    
    //3.绘制大三角形
    CGContextMoveToPoint(ctx, 100, 0);
    CGContextAddLineToPoint(ctx, 140, 40);
    CGContextAddLineToPoint(ctx, 60, 40);
    CGContextClosePath(ctx);
    
    //填充颜色
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    CGContextFillPath(ctx);
    
    //4.绘制轴
    CGContextMoveToPoint(ctx, 100, 40);
    CGContextAddLineToPoint(ctx, 100, 100);
    
    //渲染 绘制线的宽度
    CGContextSetLineWidth(ctx, 20);
    CGContextStrokePath(ctx);
}


@end
