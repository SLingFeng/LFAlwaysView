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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    LFAlwaysView *v = [[LFAlwaysView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 200)];
    [self.view addSubview:v];
    
    
}


@end
