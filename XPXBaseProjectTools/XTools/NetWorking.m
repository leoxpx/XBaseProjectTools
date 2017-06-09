//
//  NetWorking.m
//  youxin
//
//  Created by ldhios2 on 17/3/28.
//  Copyright © 2017年 杭州稳瞻信息科技有限公司. All rights reserved.
//

#import "NetWorking.h"

@implementation NetWorking

// manager配置
+ (AFHTTPSessionManager *)shareAFNManager {
    
    AFHTTPSessionManager *manager             = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 20;//请求超时设定
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"image/jpeg", nil];
    manager.requestSerializer  = [AFJSONRequestSerializer serializer];//请求和返回的为JSON
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer.cachePolicy = NSURLRequestUseProtocolCachePolicy;//缓存策略
    manager.securityPolicy.allowInvalidCertificates = YES;//安全策略
    manager.securityPolicy.validatesDomainName      = NO;
    
    // Header
    [manager.requestSerializer setValue:[SingleExampleProperty singleProperty].token forHTTPHeaderField:@"token"];
    
    return manager;
}

// POST
+ (void)POSTWithURLString:(NSString *)urlString Parameters:(NSDictionary *)parameters successBlock:(AFNSuccessBlock)success failure:(AFNFailureBlock)failure{
    
    ParentViewController * pare  = [[ParentViewController alloc]init];
    [pare showHUDView:YES];
    // manager配置
    AFHTTPSessionManager *manager = [NetWorking shareAFNManager];
    
    // 发起请求
    [manager POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [pare showHUDView:NO];
        // 成功调用
        success(task, responseObject, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败:  %@",error);
        
        [pare showHUDView:NO];
        
        [pare showHUDView:[UIApplication sharedApplication].keyWindow states:NO title:@"提示" content:@"网络连接失败" time:2.0f andCodes:nil];
        
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
        NSLog(@"失败:  %@",error);
        
        ParentViewController * HUD  = [[ParentViewController alloc]init];
        [HUD showHUDView:[UIApplication sharedApplication].keyWindow states:NO title:@"提示" content:@"网络连接失败" time:2.0f andCodes:nil];
    }];
}


// GET
+ (void)GETWithURLString:(NSString *)urlString Parameters:(NSDictionary *)parameters successBlock:(AFNSuccessBlock)success failure:(AFNFailureBlock)failure{
    
    ParentViewController * pare  = [[ParentViewController alloc]init];
    [pare showHUDView:YES];
    AFHTTPSessionManager *manager = [NetWorking shareAFNManager];
    
    [manager GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [pare showHUDView:NO];
        success(task, responseObject, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"string: %@  parameter: %@",urlString, parameters);
        [pare showHUDView:NO];
        [pare showHUDView:[UIApplication sharedApplication].keyWindow states:NO title:@"提示" content:@"网络连接失败" time:2.0f andCodes:nil];
        
    }];
}

// GET 无加载框
+ (void)GETWithNoHUDURLString:(NSString *)urlString Parameters:(NSDictionary *)parameters successBlock:(AFNSuccessBlock)success failure:(AFNFailureBlock)failure{
    
    AFHTTPSessionManager *manager = [NetWorking shareAFNManager];
    
    [manager GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task, responseObject, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"string: %@  parameter: %@",urlString, parameters);
        ParentViewController * HUD  = [[ParentViewController alloc]init];
        [HUD showHUDView:[UIApplication sharedApplication].keyWindow states:NO title:@"提示" content:@"网络连接失败" time:2.0f andCodes:nil];
    }];
}



// PUT
+ (void)PUTWithURLString:(NSString *)urlString Parameters:(NSDictionary *)parameters successBlock:(AFNSuccessBlock)success failure:(AFNFailureBlock)failure{
    // manager配置
    AFHTTPSessionManager *manager = [NetWorking shareAFNManager];
    
    // 加载动画
    ParentViewController *pare = [[ParentViewController alloc] init];
    [pare showHUDView:YES];
    
    // 发起请求
    [manager PUT:urlString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 成功后删除加载框
        [pare showHUDView:NO];
        // 成功调用
        success(task, responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 失败调用
        [pare showHUDView:NO];
        NSLog(@"失败:  %@",error);
        [pare showHUDView:[UIApplication sharedApplication].keyWindow states:NO title:@"提示" content:@"网络连接失败" time:2.0f andCodes:nil];
    }];
}

// 上传文件
+ (void)UpLoadFileWithURLString:(NSString *)urlString Parameters:(NSDictionary *)parameters uploadFile:(AFNUploadFileBlock)uploadFiles successBlock:(AFNSuccessBlock)success failure:(AFNFailureBlock)failure {
    
    // manager配置
    AFHTTPSessionManager *manager = [NetWorking shareAFNManager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", @"image/jpeg",@"image/png", nil];
    
    [manager.requestSerializer setValue:[SingleExampleProperty singleProperty].token forHTTPHeaderField:@"token"];
    
    // 加载动画
    ParentViewController *pare = [[ParentViewController alloc] init];
    [pare showHUDView:YES];
    
    // 发起请求
    [manager POST:urlString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        uploadFiles(formData);
        
    } progress:^(NSProgress * _Nonnull uploadProgress) { } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [pare showHUDView:NO];
        
        // 成功调用
        success(task, responseObject, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [pare showHUDView:NO];
        
        NSData *errorData = [error.userInfo valueForKey:@"com.alamofire.serialization.response.error.data"];
        NSString *errorStr = [[NSString alloc] initWithData:errorData encoding:NSUTF8StringEncoding];
        
        NSLog(@"失败: %@ errorStr: %@",error, errorStr);
        ParentViewController * HUD  = [[ParentViewController alloc]init];
        [HUD showHUDView:[UIApplication sharedApplication].keyWindow states:NO title:@"提示" content:@"网络连接失败" time:2.0f andCodes:nil];
        
    }];
}


//DELETE
+ (void)DELETEWithURLString:(NSString *)urlString Parameters:(NSDictionary *)parameters successBlock:(AFNSuccessBlock)success failure:(AFNFailureBlock)failure{
    // manager配置
    AFHTTPSessionManager *manager = [NetWorking shareAFNManager];
    // 加载动画
    ParentViewController *HUD = [[ParentViewController alloc] init];
    [HUD showHUDView:YES];
    
    // 发起请求
    
    [manager DELETE:urlString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 成功后删除加载框
        [HUD showHUDView:NO];
        
        // 成功调用
        success(task, responseObject, nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 失败调用
        [HUD showHUDView:NO];
        
        // 失败调用
        NSLog(@"失败:  %@",error);
    }];
    
}








@end
