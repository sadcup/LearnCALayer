//
//  CustomView.m
//  LearnCALayer3
//
//  Created by Netiger on 10/14/15.
//  Copyright © 2015 Sadcup. All rights reserved.
//

#import "CustomView.h"
#import "CustomLayer.h"

@interface CustomView ()

@property (nonatomic, strong) CustomLayer * customLayer;

@end

@implementation CustomView

- (CustomLayer *)customLayer {
    if (!_customLayer) {
        _customLayer = [[CustomLayer alloc] init];
        _customLayer.bounds = CGRectMake(0, 0, 185, 185);
        _customLayer.position = CGPointMake(160, 284);
        _customLayer.backgroundColor = [UIColor colorWithRed:0 green:146/255.0 blue:1.0 alpha:1.0].CGColor;
    }
    return _customLayer;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

        [self.customLayer setNeedsDisplay];
        
        [self.layer addSublayer:self.customLayer];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    NSLog(@"2-drawRect:");
    NSLog(@"CGContext:%@",UIGraphicsGetCurrentContext());//得到的当前图形上下文正是drawLayer中传递的
    [super drawRect:rect];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    NSLog(@"1-drawLayer:inContext:");
    NSLog(@"CGContext:%@",ctx);
    
    [super drawLayer:layer inContext:ctx];
}


@end
