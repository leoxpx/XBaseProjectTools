//
//  UIButton+Extension.m
//  XPXBaseProjectTools
//
//  Created by 许鹏翔 on 2017/6/7.
//  Copyright © 2017年 XTeam. All rights reserved.
//

#import "UIButton+Category.h"

@implementation UIButton (Category)

- (instancetype)initWithMainTextColorText:(NSString *)text {
    
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self setTitle:text forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = YES;
    }
    
    return self;
}

- (instancetype)initWithMainBackGroundColorText:(NSString *)text {
    
    self = [super init];
    if (self) {
        
        self.backgroundColor = MAINCOLOR;
        [self setTitle:text forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = YES;
    }
    
    return self;
}

- (instancetype)initWithBackGroundColor:(UIColor *)bgColor textColor:(UIColor *)textColor font:(CGFloat)font text:(NSString *)text {
    
    self = [super init];
    if (self) {
        
        self.backgroundColor = bgColor;
        [self setTitle:text forState:UIControlStateNormal];
        [self setTitleColor:textColor forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:font];
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = YES;
    }
    
    return self;
}
- (void)setupLayerLine {
    
    self.layer.borderColor = [UIColor blueColor].CGColor;
    self.layer.borderWidth = 0.3;
}


@end
