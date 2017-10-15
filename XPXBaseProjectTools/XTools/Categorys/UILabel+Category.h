//
//  UILabel+Extension.h
//  XPXBaseProjectTools
//
//  Created by 许鹏翔 on 2017/6/7.
//  Copyright © 2017年 XTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Category)

- (instancetype)initWithTextColor:(UIColor *)color font:(CGFloat)font textAlignment:(NSTextAlignment)alignment text:(NSString *)text; /**< UILabel分类 */

- (void)setupTextAttributesTextFont:(CGFloat)font textColor:(UIColor *)color atRange:(NSRange)range; /**< 富文本的颜色字体 */

@end
