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
    // CGContextSaveGState
    CGContextSaveGState(ctx);
    //渲染 绘制线的宽度
    CGContextSetLineWidth(ctx, 20);
    
    //实现渐变的效果时, CGContextStrokePath方法禁用
    CGContextReplacePathWithStrokedPath(ctx);
    
    CGContextSaveGState(ctx);
    
    //在剪切的区域中绘制渐变的效果
    CGContextClip(ctx);
  //      CGContextSaveGState(ctx); 与 CGContextRestoreGState 配对使用
    //绘制渐变
    CGColorSpaceRef space=CGColorSpaceCreateDeviceRGB();//创建颜色空间的对象
    
  /* 
   
   space 表示颜色空间的对象
   components 颜色数组,存放rgb颜色空间,渐变颜色,
   locations 颜色所在的位置(0,1)数组,数组中颜色的元素个数不能component数量小
   count 位置的个数(渐变的个数)
   CGGradientCreateWithColorComponents(<#CGColorSpaceRef  _Nullable space#>, <#const CGFloat * _Nullable components#>, <#const CGFloat * _Nullable locations#>, <#size_t count#>)

   <#CGContextRef  _Nullable c#> 图形上下文(画板)
   <#CGGradientRef  _Nullable gradient#> 表示gradient
   <#CGPoint startPoint#> 绘制的开始位置
   <#CGPoint endPoint#> 结束位置
   <#CGGradientDrawingOptions options#>  绘制颜色定义是否超越开始点或者终止点
   
   CGContextDrawLinearGradient(,<#CGContextRef  _Nullable c#> <#CGGradientRef  _Nullable gradient#>, <#CGPoint startPoint#>, <#CGPoint endPoint#>, <#CGGradientDrawingOptions options#>)
   
    
    */
    //颜色数组
//    const CGFloat components[]={
//        248.0/255.0,86.0/255.0,86.0/255.0,1.0,//开始颜色
//        249.0/255.0,127.0/255.0,127.0/255.0,1.0,//中间颜色
//        1.0,1.0,1.0,1.0,//结束颜色 最后1.0表示透明度
//    };
    //RGB值
    const  CGFloat components[]={
        0.2,0.6,0.8,0.6,//开始颜色
        0.5,0.9,0.3,0.8,//中间颜色1
        0.7,0.5,0.2,0.8,//中间颜色2
        0.4,0.7,0.7,0.4,//结束颜色
        
    };
    //颜色绘制的位置 locations
    const CGFloat locations[]={0,0.32,0.56,1};
    CGGradientRef gradient=CGGradientCreateWithColorComponents(space, components, locations, 4);
    CGContextDrawLinearGradient(ctx, gradient, CGPointMake(90, 100), CGPointMake(110, 100), kCGGradientDrawsBeforeStartLocation);
    //释放掉颜色空间
    CGColorSpaceRelease(space);
    CGGradientRelease(gradient);
    
    //
    CGContextRestoreGState(ctx);
}


@end
