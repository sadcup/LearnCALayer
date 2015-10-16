//
//  ViewController.m
//  LearnCALayer3
//
//  Created by Netiger on 10/14/15.
//  Copyright © 2015 Sadcup. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()
@property (nonatomic, strong) CustomView * customView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _customView = [[CustomView alloc] initWithFrame:self.view.bounds];
    _customView.backgroundColor = [UIColor colorWithRed:249.0/255.0 green:249.0/255.0 blue:249.0/255.0 alpha:1];
    [self.view addSubview:_customView];
}


@end
