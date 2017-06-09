//
//  UILabel+Extension.h
//  youxin_company
//
//  Created by 薪王iOS1 on 2017/4/17.
//  Copyright © 2017年 杭州稳瞻信息科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Category)

- (instancetype)initWithTextColor:(UIColor *)color font:(CGFloat)font textAlignment:(NSTextAlignment)alignment text:(NSString *)text; /**< UILabel分类 */

- (void)setupTextAttributesTextFont:(CGFloat)font textColor:(UIColor *)color atRange:(NSRange)range; /**< 富文本的颜色字体 */

@end
