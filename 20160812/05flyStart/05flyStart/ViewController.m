//
//  ViewController.m
//  05flyStart
//
//  Created by qingyun on 16/8/12.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "ViewController.h"
#import "QYView.h"
@interface ViewController ()
@property(weak,nonatomic) IBOutlet QYView *tempView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //CADisplayLink 对象是一个让和屏幕刷新频率相同的方法将内容画到屏幕的定时器.
    CADisplayLink  *link=[CADisplayLink displayLinkWithTarget:_tempView selector:@selector(setNeedsDisplay)];
    //用runloop开一个定时器
    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
