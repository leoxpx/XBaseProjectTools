//
//  NetWorking.h
//  XPXBaseProjectTools
//
//  Created by 许鹏翔 on 2017/6/7.
//  Copyright © 2017年 XTeam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

// 完成回调
typedef void(^AFNSuccessBlock)(NSURLSessionDataTask * task, id responseObject, NSError *error);
typedef void(^AFNFailureBlock)(NSURLSessionDataTask * task, id responseObject, NSError *error);
typedef void(^AFNUploadFileBlock)(id formData);

@interface NetWorking : NSObject

// 网络封装方法 POST
+ (void)POSTWithURLString:(NSString *)urlString Parameters:(NSDictionary *)parameters successBlock:(AFNSuccessBlock)success failure:(AFNFailureBlock)failure;
// 无加载动画 POST
+ (void)POSTWithNoHUDURLString:(NSString *)urlString Parameters:(NSDictionary *)parameters successBlock:(AFNSuccessBlock)success failure:(AFNFailureBlock)failure;

// GET
+ (void)GETWithURLString:(NSString *)urlString Parameters:(NSDictionary *)parameters successBlock:(AFNSuccessBlock)success failure:(AFNFailureBlock)failure;
// 无加载动画 GET
+ (void)GETWithNoHUDURLString:(NSString *)urlString Parameters:(NSDictionary *)parameters successBlock:(AFNSuccessBlock)success failure:(AFNFailureBlock)failure;

// DELETE
+ (void)DELETEWithURLString:(NSString *)urlString Parameters:(NSDictionary *)parameters successBlock:(AFNSuccessBlock)success failure:(AFNFailureBlock)failure;

// PUT
+ (void)PUTWithURLString:(NSString *)urlString Parameters:(NSDictionary *)parameters successBlock:(AFNSuccessBlock)success failure:(AFNFailureBlock)failure;

// 上传文件
+ (void)UpLoadFileWithURLString:(NSString *)urlString Parameters:(NSDictionary *)parameters uploadFile:(AFNUploadFileBlock)uploadFiles successBlock:(AFNSuccessBlock)success failure:(AFNFailureBlock)failure;


@end
