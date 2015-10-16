//
//  ViewController.m
//  LearnCALayer
//
//  Created by Netiger on 10/14/15.
//  Copyright © 2015 Sadcup. All rights reserved.
//

#import "ViewController.h"

#define WIDTH 50

@interface ViewController ()

@end

@implementation ViewController

- (void)awakeFromNib {
    NSLog(@"awakeFromNib: number of sublayers: %lu", self.view.layer.sublayers.count);
}

- (void)viewDidLoad {
    NSLog(@"viewDidLoad: number of sublayers: %lu", self.view.layer.sublayers.count);
    [super viewDidLoad];
    [self drawMyLayer];
}

#pragma mark 绘制图层

-(void)drawMyLayer{
    CGSize size=self.view.bounds.size;

    
    //获得根图层
    
    CALayer *layer = [CALayer layer];//[[CALayer alloc] init];
    //设置背景颜色,由于QuartzCore是跨平台框架，无法直接使用UIColor
    layer.backgroundColor=[UIColor colorWithRed:0 green:146/255.0 blue:1.0 alpha:1.0].CGColor;
    //设置中心点
    layer.position=CGPointMake(size.width/2, size.height/2);
    //设置大小
    layer.bounds=CGRectMake(0, 0, WIDTH,WIDTH);
    //设置圆角,当圆角半径等于矩形的一半时看起来就是一个圆形
    layer.cornerRadius=WIDTH/2;
    //设置阴影
    layer.shadowColor=[UIColor grayColor].CGColor;
    layer.shadowOffset=CGSizeMake(2, 2);
    layer.shadowOpacity=.9;
    //设置边框
    layer.borderColor=[UIColor whiteColor].CGColor;
    layer.borderWidth=1;
    //设置锚点
    //    layer.anchorPoint=CGPointZero;
    [self.view.layer addSublayer:layer];
    
}
#pragma mark 点击放大
- (IBAction)tap:(UITapGestureRecognizer *)sender {
    //NSArray * sublayers = self.view.layer.sublayers;
    //NSLog(@"number of sublayers: %lu", self.view.layer.sublayers.count);
    CALayer *layer=[self.view.layer.sublayers lastObject];
    CGFloat width=layer.bounds.size.width;
    if (width==WIDTH) {
        width=WIDTH*4;
    }else{
        width=WIDTH;
    }
    
    
    layer.bounds=CGRectMake(0, 0, width, width);
    layer.position=[sender locationInView:self.view];
    layer.cornerRadius=width/2;
}

@end
