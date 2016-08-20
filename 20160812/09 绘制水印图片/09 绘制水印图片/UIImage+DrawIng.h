//
//  UIImage+DrawIng.h
//  09 绘制水印图片
//
//  Created by qingyun on 16/8/12.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DrawIng)
//制作一张水印的UIImage对象
-(UIImage *) waterImageWith:(UIImage *) logo;
@end
