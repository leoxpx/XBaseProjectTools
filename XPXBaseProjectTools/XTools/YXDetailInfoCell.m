//
//  GSDetailInfoCell.m
//  youxin
//
//  Created by 薪王iOS1 on 2017/4/12.
//  Copyright © 2017年 杭州稳瞻信息科技有限公司. All rights reserved.
//

#import "YXDetailInfoCell.h"

@interface YXDetailInfoCell ()
{
//    UIImageView *_moreImage;
}


@end

@implementation YXDetailInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.images = [[UIImageView alloc] init];
        [self.contentView addSubview:self.images];
        [self.images mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(20);
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
        
        self.titles = [[UILabel alloc] init];
        self.titles.font = [UIFont systemFontOfSize:16];
        self.titles.textColor = [UIColor darkTextColor];
        [self.contentView addSubview:self.titles];
        [self.titles mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(55);
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
        
        self.moreImage = [[UIImageView alloc] init];
        self.moreImage.image = [UIImage imageNamed:@"cell_more_right"];
        [self.contentView addSubview:self.moreImage];
        [self.moreImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_right).with.offset(-30);
            make.size.mas_equalTo(CGSizeMake(10, 18));
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
        
        
        self.details = [[UILabel alloc] init];
        self.details.font = [UIFont systemFontOfSize:14];
        self.details.textColor = [UIColor lightGrayColor];
        self.details.textAlignment = NSTextAlignmentRight;
        self.details.numberOfLines = 2;
        [self.contentView addSubview:self.details];
        [self.details mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titles.mas_right).with.offset(80);
            make.right.equalTo(self.moreImage.mas_left).with.offset(-15);
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
    }
    
    return self;
}

- (void)setImageStr:(NSString *)image title:(NSString *)title detail:(NSString *)detail more:(BOOL)haveOrNo {
    
    if (image == nil) {
        self.images.hidden = YES;
        [self.titles mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(20);
        }];
    } else {
        self.images.hidden = NO;
        self.images.image = [UIImage imageNamed:image];
    }
    
    self.titles.text = title;
    
    if (self.details == nil) {
        self.details.hidden = YES;
    } else {
        self.details.hidden = NO;
        self.details.text = detail;
    }
    
    if (haveOrNo) {
        self.moreImage.hidden = NO;
    } else {
        self.moreImage.hidden = YES;
        [self.details mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).with.offset(-20);
        }];
    }
    
}

@end
