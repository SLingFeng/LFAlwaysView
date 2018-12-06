//
//  ViewController.m
//  LFAlwaysView
//
//  Created by 孙凌锋 on 2018/12/6.
//  Copyright © 2018 孙凌锋. All rights reserved.
//

#import "ViewController.h"
#import "LFAlwaysView.h"

@interface ViewController ()
{
    LFAlwaysView *_v;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    LFAlwaysView *v = [[LFAlwaysView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 200)];
    [self.view addSubview:v];
    _v = v;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_v stopTimer];
    [_v removeFromSuperview];
    _v = nil;
//    _v = nil;
//    for (UIView *v in self.view.subviews ) {
//        [v removeFromSuperview];
//    }
}


@end
