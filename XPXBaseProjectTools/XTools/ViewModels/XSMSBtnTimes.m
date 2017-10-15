//
//  XSMSBtnTimes.m
//  KidsGrowingNotes
//
//  Created by 薪王iOS1 on 2017/8/16.
//  Copyright © 2017年 杭州薪王信息技术有限公司. All rights reserved.
//

#import "XSMSBtnTimes.h"

@interface XSMSBtnTimes ()

@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger const second;

@end

@implementation XSMSBtnTimes

- (void)addSMSTimerActionIn:(UIButton *)button {
    
    self.btn = button;
    [self SMSClick];
}
// 发送验证码
- (void)SMSClick {
    
    self.second = 60;
    if (self.timer != nil) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    [self.timer fire];
}
// 计时器执行
- (void)updateTime {
    if (self.second <= 0) {
        [self.timer invalidate];
        self.timer = nil;
        self.btn.userInteractionEnabled = YES;
        [self.btn setTitle:[NSString stringWithFormat:@"获取验证码"] forState:UIControlStateNormal];
        [self.btn setTitleColor:MainColor forState:UIControlStateNormal];
    } else {
        self.btn.userInteractionEnabled = NO;
        [self.btn setTitle:[NSString stringWithFormat:@"%ldS",(long)self.second] forState:UIControlStateNormal];
        [self.btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    }
    self.second--;
}



@end
