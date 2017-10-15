//
//  UIButton+Extension.h
//  XPXBaseProjectTools
//
//  Created by 许鹏翔 on 2017/6/7.
//  Copyright © 2017年 XTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^btnBlock)(void);

@interface UIButton (Category)

- (instancetype)initWithMainTextColorText:(NSString *)text; /**< 白色底 主色字 */

- (instancetype)initWithMainBackGroundColorText:(NSString *)text; /**< 主色底 白色字 */

- (instancetype)initWithBackGroundColor:(UIColor *)bgColor textColor:(UIColor *)textColor font:(CGFloat)font text:(NSString *)text; /**< UIButton分类 */

- (void)setupLayerLine; /**< 描边 */

- (void)addActionWithBlock:(btnBlock)block; /**< block按钮事件 */

@end
