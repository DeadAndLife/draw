//
//  ViewController.m
//  08绘制图片
//
//  Created by qingyun on 16/8/12.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction) drawBtn:(id) sender{
    //1.开启位图上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), NO, 1);
    //2.获取当前的上下文(位图)
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //3.绘制图形
    //三角形的绘制
    CGContextMoveToPoint(ctx, 50, 0);
    CGContextAddLineToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 0, 100);
    //填充三角形的颜色
    CGContextSetRGBFillColor(ctx, 0, 1, 0, 1);
    CGContextFillPath(ctx);
    
    //4.导出图形
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    //4.2关闭图形上下文
    UIGraphicsEndImageContext();
    
    //5.UIImage对象保存至文件
    //compressionQuality  图片的精度 0-1
    NSData *iconData=UIImageJPEGRepresentation(image, 1);
    
    [iconData writeToFile:@"/Users/qingyun/Desktop/Code/20160812/draw.png" atomically:YES];
}
@end
