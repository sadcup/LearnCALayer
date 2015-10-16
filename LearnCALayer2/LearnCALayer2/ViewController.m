//
//  ViewController.m
//  LearnCALayer2
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
    [self customizeLayer];
}

- (void)customizeLayer {
    CGPoint position = CGPointMake(160, 200);
    CGRect bounds = CGRectMake(0, 0, PHOTO_HEIGHT, PHOTO_HEIGHT);
    CGFloat cornerRadius = PHOTO_HEIGHT / 2;
    CGFloat borderWidth = 2;
    
    CALayer *shadowLayer = [CALayer layer];
    shadowLayer.bounds = bounds;
    shadowLayer.position = position;
    shadowLayer.cornerRadius = cornerRadius;
    shadowLayer.shadowColor = [UIColor grayColor].CGColor;
    shadowLayer.shadowOpacity = 1;
    shadowLayer.borderColor = [UIColor whiteColor].CGColor;
    shadowLayer.borderWidth = borderWidth;
    
    [self.view.layer addSublayer:shadowLayer];
    
    CALayer *layer = [CALayer layer];
    layer.bounds = bounds;
    layer.position = position;
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.cornerRadius = cornerRadius;
    layer.masksToBounds = YES;
    layer.borderColor = [UIColor whiteColor].CGColor;
    layer.borderWidth = borderWidth;

//    // (1) 使用3D变换解决坐标系颠倒的问题
//    layer.transform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
//    layer.delegate = self;
//    [self.view.layer addSublayer:layer];
//    [layer setNeedsDisplay];
    
//    // (2) 直接使用setContents
//    UIImage * image = [UIImage imageNamed:@"image.jpg"];
//    [layer setContents:(id)image.CGImage];
//    [self.view.layer addSublayer:layer];
    
    // (3) 用setValue:forKeyPath:命令进行3D坐标变换
    [layer setValue:@M_PI forKeyPath:@"transform.rotation.x"];
    layer.delegate = self;
    [self.view.layer addSublayer:layer];
    [layer setNeedsDisplay];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    UIImage * image = [UIImage imageNamed:@"image.jpg"];
    CGContextDrawImage(ctx, CGRectMake(0, 0, PHOTO_HEIGHT, PHOTO_HEIGHT), image.CGImage);
}

@end




















