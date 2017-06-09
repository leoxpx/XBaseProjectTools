//
//  UILabel+Extension.m
//  youxin_company
//
//  Created by 薪王iOS1 on 2017/4/17.
//  Copyright © 2017年 杭州稳瞻信息科技有限公司. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)

- (instancetype)initWithTextColor:(UIColor *)color font:(CGFloat)font textAlignment:(NSTextAlignment)alignment text:(NSString *)text{
    
    self = [super init];
    if (self) {
        
        self.textColor = color;
        self.font = [UIFont systemFontOfSize:font];
        self.text = text;
        self.textAlignment = alignment;
    }
    
    return self;
}

- (void)setupTextAttributesTextFont:(CGFloat)font textColor:(UIColor *)color atRange:(NSRange)range {
    
    [self setTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font] , NSForegroundColorAttributeName:color} atRange:range];
}

- (void)setTextAttributes:(NSDictionary *)attributes atRange:(NSRange)range {
    
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    
    for (NSString *name in attributes) {
        [mutableAttributedString addAttribute:name value:[attributes objectForKey:name] range:range];
    }
    
    self.attributedText = mutableAttributedString;
}

@end
