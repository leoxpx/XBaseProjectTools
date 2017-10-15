//
//  ShareSingle.m
//  KidsGrowingNotes
//
//  Created by 薪王iOS1 on 2017/7/12.
//  Copyright © 2017年 杭州薪王信息技术有限公司. All rights reserved.
//

#import "ShareSingle.h"

@implementation ShareSingle

+ (ShareSingle *)shareSingle {
    
    static ShareSingle *shareSingle = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (shareSingle == nil) {
            shareSingle = [[ShareSingle alloc] init];
            
            
        }
    });
    
    return shareSingle;
}

@end
