//
//  CustomView.m
//  LearnCALayer4
//
//  Created by Netiger on 10/15/15.
//  Copyright © 2015 Sadcup. All rights reserved.
//

#import "CustomView.h"
#import "CustomLayer.h"

@interface CustomView ()
@property (nonatomic, strong) CustomLayer * mainLayer;
@end

@implementation CustomView


//// Method 1: Draw using drawRect
//- (void)drawRect:(CGRect)rect {
//    
//    NSLog(@"drawRect of CustomView is called.");
//}
//
//- (void)redraw {
//    NSLog(@"redraw of CustomView is called.");
//    [self setNeedsDisplay];
//}

// Method 2: Draw using CALayer
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"init of CustomView is called.");
        [self setup];
    }
    return self;
}
- (void)awakeFromNib {
    NSLog(@"awakeFromNib of CustomView is called.");
    [self setup];
}

- (instancetype)initWithFrame:(CGRect)frame {
    NSLog(@"initWithFrame of CustomView is called.");
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (CustomLayer *)mainLayer {
    if (!_mainLayer) {
        _mainLayer = [[CustomLayer alloc] init];
        
        //_mainLayer.bounds = self.bounds;//CGRectMake(0, 0, 185, 185);
        //_mainLayer.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);//CGPointMake(160, 284);
        NSLog(@"self.frame = [%f %f %f %f]", self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
        //_mainLayer.frame = self.frame;
        _mainLayer.bounds = CGRectMake(0, 0, 185, 185);
        _mainLayer.position = CGPointMake(160, 284);
        _mainLayer.backgroundColor = [UIColor colorWithRed:0 green:146/255.0 blue:1.0 alpha:1.0].CGColor;
    }
    return _mainLayer;
}



- (void)setup {
    NSLog(@"setup of CustomView is called.");
    //[self.mainLayer setNeedsDisplay];
    [self.layer addSublayer:self.mainLayer];
    [self.mainLayer setNeedsDisplay];

}

- (void)redraw {
    NSLog(@"1 redraw of CustomView is called.");
    
    CGFloat newPositionX = (self.mainLayer.position.x - 1);
    if (newPositionX >= self.bounds.size.width + self.mainLayer.bounds.size.width/2) {
        newPositionX = -self.mainLayer.bounds.size.width/2;
    } else if (newPositionX < -self.mainLayer.bounds.size.width/2) {
        newPositionX = self.bounds.size.width + self.mainLayer.bounds.size.width/2;
    }
    self.mainLayer.position = CGPointMake(newPositionX , self.mainLayer.position.y);

    //[self.layer setNeedsDisplay];
    [self.mainLayer setNeedsDisplay];
}

//- (void)drawRect:(CGRect)rect {
//    NSLog(@"2-drawRect:");
//    NSLog(@"CGContext:%@",UIGraphicsGetCurrentContext());//得到的当前图形上下文正是drawLayer中传递的
//    [super drawRect:rect];
//}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    NSLog(@"2 drawLayer:inContext in CustomView is called.");
    
    [super drawLayer:layer inContext:ctx];
}

@end
