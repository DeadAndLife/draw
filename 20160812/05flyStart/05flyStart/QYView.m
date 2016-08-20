//
//  QYView.m
//  05flyStart
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

    _x+=2;
    _y+=2;
    NSLog(@"drawRect %f %f",_x,_y);
    if (_y>rect.size.height ||_x>rect.size.width) {
        _x=0;
        _y=0;
    }
    UIImage *img=[UIImage imageNamed:@"ystar"];
    //绘制当前图片所在视图的位置
    [img drawAtPoint:CGPointMake(_x, _y)];
    
}


@end
