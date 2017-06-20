//
//  XViewTools.m
//  XPXBaseProjectTools
//
//  Created by 许鹏翔 on 2017/6/7.
//  Copyright © 2017年 XTeam. All rights reserved.
//

#import "XViewTools.h"

@implementation XViewTools

//旋转
-(void)startRotate:(BOOL)isStart theView:(UIView *)view {
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0];
    rotationAnimation.duration = 2;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 10;
    
    if (isStart) {
        [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    }else{
        [view.layer removeAnimationForKey:@"rotationAnimation"];
    }
}



@end
