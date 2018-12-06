//
//  LFAlwaysView.h
//  LFAlwaysView
//
//  Created by 孙凌锋 on 2018/12/6.
//  Copyright © 2018 孙凌锋. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LFAlwaysView : UIView
//切换图片的时间间隔，可选，默认为0.06s
@property (nonatomic, assign) CGFloat interval;

//x 移动的距离,可选，默认为2
@property (nonatomic, assign) CGFloat moveX;


- (void)stopTimer;

@end

NS_ASSUME_NONNULL_END
