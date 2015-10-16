//
//  ViewController.m
//  LearnCALayer4
//
//  Created by Netiger on 10/15/15.
//  Copyright © 2015 Sadcup. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet CustomView *customView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(tap:) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tap:(UITapGestureRecognizer *)sender {
    NSLog(@"-----------------------------------------");
    [self.customView redraw];
}

@end
