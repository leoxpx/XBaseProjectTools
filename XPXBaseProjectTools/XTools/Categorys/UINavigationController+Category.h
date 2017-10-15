//
//  UINavigationController+Category.h
//  KidsGrowingNotes
//
//  Created by 薪王iOS1 on 2017/9/6.
//  Copyright © 2017年 杭州薪王信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Category)

// 返回指定页面
- (void)popToNavigationController:(NSString *)navStr;

@end
