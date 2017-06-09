//
//  GSDetailInfoCell.h
//  youxin
//
//  Created by 薪王iOS1 on 2017/4/12.
//  Copyright © 2017年 杭州稳瞻信息科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXDetailInfoCell : UITableViewCell

@property (strong, nonatomic) UIImageView *images;
@property (strong, nonatomic) UILabel *titles;
@property (strong, nonatomic) UILabel *details;
@property (strong, nonatomic) UIImageView *moreImage;

- (void)setImageStr:(NSString *)image title:(NSString *)title detail:(NSString *)detail more:(BOOL)haveOrNo;

@end
