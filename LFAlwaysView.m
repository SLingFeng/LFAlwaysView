//
//  LFAlwaysView.m
//  LFAlwaysView
//
//  Created by 孙凌锋 on 2018/12/6.
//  Copyright © 2018 孙凌锋. All rights reserved.
//

#import "LFAlwaysView.h"

#pragma mark - 宽高
#define kScreenW \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.width)

#define kScreenH \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.height)

#define kScreen ([UIScreen mainScreen].bounds)


@interface LFAlwaysView ()
//即将出现的
@property (nonatomic, assign) NSInteger nextPage;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, retain) NSMutableArray *viewsArray;

@property (nonatomic, retain) NSMutableArray *data;

@end

@implementation LFAlwaysView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.viewsArray = [NSMutableArray arrayWithCapacity:3];
        
        self.interval = 0.06;
        self.moveX = 2;
        
        UIView *last;
        for (int i=0; i<3; i++) {
            UILabel *view = [[UILabel alloc] init];
            [self addSubview:view];
            view.layer.borderWidth = 10;
            view.layer.borderColor = [UIColor blackColor].CGColor;
            view.backgroundColor = [UIColor redColor];
            view.tag = i +112;
            if (i == 0) {
                view.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
            }else {
                view.frame = CGRectMake(frame.size.width + last.frame.origin.x, 0, frame.size.width, frame.size.height);
            }
            last = view;
            [self.viewsArray addObject:view];
        }
        
        
        self.data = [NSMutableArray arrayWithArray:@[@"1111111111111111111111", @"2222222222222222", @"333333333333333333333333", @"444444444", @"55555555555"]];

        
    }
    return self;
}

- (void)setInterval:(CGFloat)interval {
    _interval = interval;
    
    [self stopTimer];
    
    __weak typeof(self) weakSelf = self;

    self.timer = [NSTimer scheduledTimerWithTimeInterval:interval target:weakSelf selector:@selector(nextView) userInfo:nil repeats:YES];

    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];//mainRunLoop

}

- (void)setData:(NSMutableArray *)data {
    _data = data;
    for (int i=0; i<self.viewsArray.count; i++) {
        UILabel * v = self.viewsArray[i];
        
        v.text = self.data[i];
    }

    if (_data.count > 1) {
        self.nextPage = 1;
        self.moveX = 20;
        self.interval = 0.06;
    }
    if (_data.count > 2) {
        self.nextPage = 2;
    }
}

- (void)nextView {
    UILabel * view;
    
    
    for (int i=0; i<self.viewsArray.count; i++) {
        UILabel * v = self.viewsArray[i];
        
//        v.text = self.data[i];

        
        CGRect rect = v.frame;
        rect.origin.x = rect.origin.x - self.moveX;
        v.frame = rect;
        
        if (v.frame.origin.x < (- self.frame.size.width)) {
            view = v;
        }
    }
    
    if (view.frame.origin.x < (- self.frame.size.width)) {
        UILabel *last = self.viewsArray.lastObject;
        
        CGRect rect = view.frame;
        rect.origin.x = last.frame.origin.x + last.frame.size.width;
        view.frame = rect;
                
        [self.viewsArray removeObject:view];
        [self.viewsArray addObject:view];
        
        view.text = self.data[self.nextPage];

        if (self.nextPage + 1 >= self.data.count) {
            self.nextPage = 0;
            
        }else {
            self.nextPage ++;
            
        }
        
    }
    
    NSLog(@"%d", self.nextPage);
}



- (void)dealloc {
    [self stopTimer];
}

- (void)stopTimer {
    self.timer.fireDate = [NSDate distantFuture];
    if (_timer.isValid) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

@end
