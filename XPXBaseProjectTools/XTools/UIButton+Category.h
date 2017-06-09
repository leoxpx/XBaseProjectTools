//
//  UIButton+Extension.h
//  youxin_company
//
//  Created by 薪王iOS1 on 2017/4/17.
//  Copyright © 2017年 杭州稳瞻信息科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Category)

- (instancetype)initWithMainTextColorText:(NSString *)text; /**< 白色底 主色字 */

- (instancetype)initWithMainBackGroundColorText:(NSString *)text; /**< 主色底 白色字 */

- (instancetype)initWithBackGroundColor:(UIColor *)bgColor textColor:(UIColor *)textColor font:(CGFloat)font text:(NSString *)text; /**< UIButton分类 */

- (void)setupLayerLine; /**< 描边 */

@end
