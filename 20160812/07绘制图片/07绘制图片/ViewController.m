//
//  ViewController.m
//  07绘制图片
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
-(IBAction)drawImgBtn:(id)sender{
    //1.开启位图的上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(230, 230), YES, 1);
    //2.获取当前上下文对象(位图)  画板
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    /*
        CTM
     */
    //缩放效果
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -200);
    
    //实现角度转换
    CGContextRotateCTM(ctx, M_PI);
    CGContextTranslateCTM(ctx, -100, -100);
    
    //3.绘制图片
    UIImage *image=[UIImage imageNamed:@"dorayo.jpeg"];
    //rect 绘制图片的区域
    //image  要绘制的UIImage对象
    CGContextDrawImage(ctx, CGRectMake(15, 15, 200, 200), image.CGImage);
    //4.从位图上下文中的图片导入出来
    UIImage *imageIcon=UIGraphicsGetImageFromCurrentImageContext();
    //4.1关闭位图上下文
    UIGraphicsEndImageContext();
    
    //5.显示到当前页面上 UIImageView对象
    UIImageView *imageView=[[UIImageView alloc] initWithImage:imageIcon];
    imageView.backgroundColor=[UIColor blueColor];
    imageView.frame=CGRectMake(50, 50, 230, 230);
    [self.view addSubview:imageView];
   
}
@end
