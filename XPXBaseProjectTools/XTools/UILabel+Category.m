//
//  UILabel+Extension.m
//  XPXBaseProjectTools
//
//  Created by 许鹏翔 on 2017/6/7.
//  Copyright © 2017年 XTeam. All rights reserved.
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
