//
//  ShareSingle.h
//  KidsGrowingNotes
//
//  Created by 薪王iOS1 on 2017/7/12.
//  Copyright © 2017年 杭州薪王信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareSingle : NSObject

@property (nonatomic, strong) NSString *user_token;
@property (nonatomic, strong) NSString *user_id;

+ (ShareSingle *)shareSingle;

@end
