//
//  ViewController.m
//  09 绘制水印图片
//
//  Created by qingyun on 16/8/12.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+DrawIng.h"
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
-(IBAction)drawBtn:(id)sender{
    UIImage *image=[UIImage imageNamed:@"123.jpg"];//大图片
    UIImage *logoImg=[UIImage imageNamed:@"logo.png"];//logo
    UIImage *waterImage=[image waterImageWith:logoImg];//生成水印图像 UIImage对象
    NSData *data=UIImagePNGRepresentation(waterImage);
    [data writeToFile:@"/Users/qingyun/Desktop/Code/20160812/water.png" atomically:YES];
    
}
@end
