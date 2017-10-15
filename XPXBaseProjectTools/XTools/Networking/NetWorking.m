//
//  NetWorking.m
//  XPXBaseProjectTools
//
//  Created by 许鹏翔 on 2017/6/7.
//  Copyright © 2017年 XTeam. All rights reserved.
//

#import "NetWorking.h"
#import "XProgressHUD.h"

#define ErrorTips @"网络连接失败"

static AFHTTPSessionManager *_manager = nil;

@implementation NetWorking

// manager配置
+ (AFHTTPSessionManager *)shareAFNManager {
    
    if (_manager == nil) {
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval = 20;
        [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/html", @"text/javascript", @"image/jpeg", nil];
        manager.requestSerializer  = [AFHTTPRequestSerializer serializer]; // 请求为二进制
        manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // 返回为二进制
        manager.requestSerializer.cachePolicy = NSURLRequestUseProtocolCachePolicy;//缓存策略
        manager.securityPolicy.allowInvalidCertificates = YES;//安全策略
        manager.securityPolicy.validatesDomainName      = NO;
        _manager = manager;
        
    }
        // Header
//        [manager.requestSerializer setValue:App_Token forHTTPHeaderField:@"app_token"];
    
    return _manager;
}

// POST
+ (void)POSTWithURLString:(NSString *)urlString Parameters:(NSDictionary *)parameters successBlock:(AFNSuccessBlock)success failure:(AFNFailureBlock)failure{
    
    [XProgressHUD showHUDView:YES];
    // manager配置
    AFHTTPSessionManager *manager = [NetWorking shareAFNManager];
    
    // 发起请求
    [manager POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 取消等待视图
        [XProgressHUD showHUDView:NO];
        success(task, responseObject, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@":)失败:  %@",error);
        NSLog(@":)失败: %@ parameters: %@",error, parameters);
        
        [XProgressHUD showHUDView:NO];
        [XProgressHUD showHUDView:[UIApplication sharedApplication].keyWindow states:NO title:@"提示" content:ErrorTips time:2.0f andCodes:nil];
    }];
}

// POST 无加载框
+ (void)POSTWithNoHUDURLString:(NSString *)urlString Parameters:(NSDictionary *)parameters successBlock:(AFNSuccessBlock)success failure:(AFNFailureBlock)failure{
    // manager配置
    AFHTTPSessionManager *manager = [NetWorking shareAFNManager];
    
    // 发起请求
    [manager POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 成功调用
        success(task, responseObject, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@":)失败:  %@",error);
        NSLog(@":)失败: %@ parameters: %@",error, parameters);
        
        [XProgressHUD showHUDView:[UIApplication sharedApplication].keyWindow states:NO title:@"提示" content:ErrorTips time:2.0f andCodes:nil];
    }];
}


// GET
+ (void)GETWithURLString:(NSString *)urlString Parameters:(NSDictionary *)parameters successBlock:(AFNSuccessBlock)success failure:(AFNFailureBlock)failure{
    
    [XProgressHUD showHUDView:YES];
    AFHTTPSessionManager *manager = [NetWorking shareAFNManager];
    
    [manager GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [XProgressHUD showHUDView:NO];
        success(task, responseObject, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"string: %@  parameter: %@",urlString, parameters);
        
        [XProgressHUD showHUDView:NO];
        [XProgressHUD showHUDView:[UIApplication sharedApplication].keyWindow states:NO title:@"提示" content:ErrorTips time:2.0f andCodes:nil];
    }];
}

// GET 无加载框
+ (void)GETWithNoHUDURLString:(NSString *)urlString Parameters:(NSDictionary *)parameters successBlock:(AFNSuccessBlock)success failure:(AFNFailureBlock)failure{
    
    AFHTTPSessionManager *manager = [NetWorking shareAFNManager];
    
    [manager GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task, responseObject, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"string: %@  parameter: %@",urlString, parameters);
        
        [XProgressHUD showHUDView:[UIApplication sharedApplication].keyWindow states:NO title:@"提示" content:ErrorTips time:2.0f andCodes:nil];
    }];
}



// PUT
+ (void)PUTWithURLString:(NSString *)urlString Parameters:(NSDictionary *)parameters successBlock:(AFNSuccessBlock)success failure:(AFNFailureBlock)failure{
    // manager配置
    AFHTTPSessionManager *manager = [NetWorking shareAFNManager];
    
    // 加载动画
    [XProgressHUD showHUDView:YES];
    
    // 发起请求
    [manager PUT:urlString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [XProgressHUD showHUDView:NO];
        
        // 成功调用
        success(task, responseObject, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@":)失败:  %@",error);
        NSLog(@":)失败: %@ parameters: %@",error, parameters);
        
        [XProgressHUD showHUDView:NO];
        [XProgressHUD showHUDView:[UIApplication sharedApplication].keyWindow states:NO title:@"提示" content:ErrorTips time:2.0f andCodes:nil];
    }];
}

// DELETE
+ (void)DELETEWithURLString:(NSString *)urlString Parameters:(NSDictionary *)parameters successBlock:(AFNSuccessBlock)success failure:(AFNFailureBlock)failure{
    // manager配置
    AFHTTPSessionManager *manager = [NetWorking shareAFNManager];
    // 加载动画
    [XProgressHUD showHUDView:YES];
    
    // 发起请求
    [manager DELETE:urlString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [XProgressHUD showHUDView:NO];
        
        // 成功调用
        success(task, responseObject, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [XProgressHUD showHUDView:NO];
        
        // 失败调用
        NSLog(@":)失败:  %@",error);
    }];
}


// 上传文件
+ (void)UpLoadFileWithURLString:(NSString *)urlString Parameters:(NSDictionary *)parameters uploadFile:(AFNUploadFileBlock)uploadFiles successBlock:(AFNSuccessBlock)success failure:(AFNFailureBlock)failure {
    
    // manager配置
    AFHTTPSessionManager *manager = [NetWorking shareAFNManager];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/html", @"text/javascript", @"image/jpeg",@"image/png", nil];
    
    // 加载动画
    [XProgressHUD showHUDView:YES];
    
    // 发起请求
    [manager POST:urlString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        uploadFiles(formData);
        
    } progress:^(NSProgress * _Nonnull uploadProgress) { } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [XProgressHUD showHUDView:NO];
        
        // 成功调用
        success(task, responseObject, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [XProgressHUD showHUDView:NO];
        
        NSData *errorData = [error.userInfo valueForKey:@"com.alamofire.serialization.response.error.data"];
        NSString *errorStr = [[NSString alloc] initWithData:errorData encoding:NSUTF8StringEncoding];
        
        NSLog(@":)失败: %@ errorStr: %@",error, errorStr);
        [XProgressHUD showHUDView:[UIApplication sharedApplication].keyWindow states:NO title:@"提示" content:ErrorTips time:2.0f andCodes:nil];
    }];
}




@end
