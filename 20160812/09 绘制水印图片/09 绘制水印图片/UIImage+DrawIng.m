//
//  UIImage+DrawIng.m
//  09 绘制水印图片
//
//  Created by qingyun on 16/8/12.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "UIImage+DrawIng.h"

@implementation UIImage (DrawIng)
//制作一张水印的UIImage对象
-(UIImage *) waterImageWith:(UIImage *) logo{
    //1.获取位图的上下文
    UIGraphicsBeginImageContextWithOptions(self.size, YES, 0);
    //2.绘制大图片
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    //3.绘制logo
    CGFloat x=self.size.width-logo.size.width-20;
    CGFloat y=self.size.height-logo.size.height-20;
    [logo drawInRect:CGRectMake(x, y, logo.size.width, logo.size.height)];
    //4.取出水印图片
    UIImage *waterImg=UIGraphicsGetImageFromCurrentImageContext();
    //5.图形上下文关闭
    UIGraphicsEndImageContext();
    return waterImg;

}
@end
