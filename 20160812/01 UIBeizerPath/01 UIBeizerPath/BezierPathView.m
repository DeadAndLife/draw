//
//  BezierPathView.m
//  01 UIBeizerPath
//
//  Created by qingyun on 16/8/12.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "BezierPathView.h"

@implementation BezierPathView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //1.创建贝塞尔曲线的对象
    UIBezierPath *path=[UIBezierPath bezierPath];
    //2.绘制一小三角形
    [path moveToPoint:CGPointMake(100, 80)];
    [path addLineToPoint:CGPointMake(105, 100)];
    [path addLineToPoint:CGPointMake(90, 100)];
    //调用closePath自动把移动点和结束点直接连线,从而构成一三角形
    [path closePath];
  // [path removeAllPoints];
    //5.剪切的规则:a.添加画布的路径,并使用奇偶法则 2.addClip 3.所有路径删除
    //添加画布的path,以方便使用奇偶剪切法则
    [path appendPath:[UIBezierPath bezierPathWithRect:rect]];
    path.usesEvenOddFillRule=YES;
    //开始剪切
    [path addClip];
    //删除所有的subPath,
    //剪切的时候需要删除路径
    [path removeAllPoints];
    
    //3.绘制大三角形
    [path moveToPoint:CGPointMake(100, 0)];
    [path addLineToPoint:CGPointMake(130, 40)];
    [path addLineToPoint:CGPointMake(70, 40)];
    [path closePath];
    
    
    //设置要填充的颜色
    [[UIColor redColor] setFill];
    //刷新填充路径
    [path fill];
    //4.绘制轴 绘制一竖线
    //s删除所有的点(路径)
    [path removeAllPoints];
    
    [path moveToPoint:CGPointMake(100, 40)];
    [path addLineToPoint:CGPointMake(100, 100)];
    
    [path setLineWidth:5];
    //刷新描边路径
    [path stroke];
    
    
}


@end
