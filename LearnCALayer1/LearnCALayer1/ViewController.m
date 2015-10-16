//
//  ViewController.m
//  LearnCALayer1
//
//  Created by Netiger on 10/14/15.
//  Copyright © 2015 Sadcup. All rights reserved.
//

#import "ViewController.h"

#define PHOTO_HEIGHT 150

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self addShadowLayer];
    [self customizeLayer];
}

- (IBAction)tap:(UITapGestureRecognizer *)sender {
}
- (void)customizeLayer {
    // 初始化一个图层
    CALayer * layer = [CALayer layer];
    
    // 设置边界，背景色
    layer.bounds = CGRectMake(0, 0, PHOTO_HEIGHT, PHOTO_HEIGHT);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.position = CGPointMake(160, 200);
    layer.cornerRadius = PHOTO_HEIGHT/2;
    
    //注意仅仅设置圆角，对于图形而言可以正常显示，但是对于图层中绘制的图片无法正确显示
    //如果想要正确显示则必须设置masksToBounds=YES，剪切子图层
    layer.masksToBounds=YES;
    //阴影效果无法和masksToBounds同时使用，因为masksToBounds的目的就是剪切外边框，
    //而阴影效果刚好在外边框
//    layer.shadowColor=[UIColor grayColor].CGColor;
//    layer.shadowOffset=CGSizeMake(2, 2);
//    layer.shadowOpacity=1;
    
    // 设置边框
    layer.borderColor = [UIColor whiteColor].CGColor;
    layer.borderWidth = 2;
    
    // 设置图层代理
    layer.delegate = self;
    
    // 添加到根图层
    [self.view.layer addSublayer:layer];
    
    // 调用图层setNeedDisplay，否则代理方法不会被调用
    [layer setNeedsDisplay];
}

- (void)addShadowLayer {
    CGPoint position= CGPointMake(160, 200);
    CGRect bounds=CGRectMake(0, 0, PHOTO_HEIGHT, PHOTO_HEIGHT);
    CGFloat cornerRadius=PHOTO_HEIGHT/2;
    CGFloat borderWidth=2;
    
    //阴影图层
    CALayer *layerShadow=[[CALayer alloc]init];
    layerShadow.bounds=bounds;
    layerShadow.position=position;
    layerShadow.cornerRadius=cornerRadius;
    layerShadow.shadowColor=[UIColor grayColor].CGColor;
    layerShadow.shadowOffset=CGSizeMake(2, 1);
    layerShadow.shadowOpacity=1;
    layerShadow.borderColor=[UIColor whiteColor].CGColor;
    layerShadow.borderWidth=borderWidth;
    
    layerShadow.name = @"shadow";
    
    [self.view.layer addSublayer:layerShadow];
}


- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGContextSaveGState(ctx);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -PHOTO_HEIGHT);
    
    UIImage * image = [UIImage imageNamed:@"image.jpg"];
    
    CGContextDrawImage(ctx, CGRectMake(0, 0, PHOTO_HEIGHT, PHOTO_HEIGHT), image.CGImage);
    
    CGContextRestoreGState(ctx);
}

- (IBAction)onAddRemoveShadowButtonPressed:(UIButton *)sender {
    NSArray *sublayers = self.view.layer.sublayers;
    for (CALayer * layer in sublayers) {
        if ([layer.name isEqualToString:@"shadow"]) {
            [layer removeFromSuperlayer];
            return;
        }
    }
    [self addShadowLayer];
    
    NSLog(@"number of sublayers: %lu", self.view.layer.sublayers.count);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
