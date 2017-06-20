//
//  GSDetailInfoCell.h
//  XPXBaseProjectTools
//
//  Created by 许鹏翔 on 2017/6/7.
//  Copyright © 2017年 XTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XDetailInfoCell : UITableViewCell

@property (strong, nonatomic) UIImageView *images;
@property (strong, nonatomic) UILabel *titles;
@property (strong, nonatomic) UILabel *details;
@property (strong, nonatomic) UIImageView *moreImage;

- (void)setImageStr:(NSString *)image title:(NSString *)title detail:(NSString *)detail more:(BOOL)haveOrNo;

@end
