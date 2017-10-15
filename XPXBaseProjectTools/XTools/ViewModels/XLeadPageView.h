//
//  LeadPageView.h
//  XPXBaseProjectTools
//
//  Created by 许鹏翔 on 2017/6/7.
//  Copyright © 2017年 XTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XLeadPageView : UIView <UIScrollViewDelegate>

//创建引导页
- (id)initWithFrame:(CGRect)frame imageArray:(NSArray *)images;

@end
