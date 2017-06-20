//
//  YXDataTools.h
//  XPXBaseProjectTools
//
//  Created by 许鹏翔 on 2017/6/7.
//  Copyright © 2017年 XTeam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XDataTools : NSObject

//字典转str
+ (NSString *)JSONDictionaryToString:(NSDictionary *)dic;

//str转字典
+ (NSDictionary *)stringToJSONDictionary:(NSString *)jsonString;

//建表DB
+ (void)createUserDB;

//存数据
+ (void)saveData:(NSDictionary *)dict ToSanBox:(NSString *)pathName;

//取数据
+ (id)getDataWithSanBox:(NSString *)pathName;

//删数据
+ (void)deleteDBData:(NSString *)infoName;


+(NSString *)filterStrNull:(NSString *)oldString; /**< 过滤 null 为 @"" */
+(NSString *)filterStrNullToZero:(NSString *)oldString; /**< 过滤 null 为 "0.00" */
+(BOOL)isArrayNotDict:(id)responseObject; /**< 判断是否是 数组 */


//时间格式
+ (NSString *)nowTimeIntervalStr;
+ (NSString *)getDateUpLoad:(NSDate *)oldDate;
+ (NSString *)getDateShow:(NSDate *)oldDate;
+ (NSString *)returnDate:(NSString *)seconds;
+ (NSString *)getDateShowYMDS:(NSString *)seconds; /**< 返回 年月日时分 */

//匹配输入信息
+ (BOOL)checkTel:(NSString *)telNumber;
+ (BOOL)isNoPointNumber:(NSString *)numbers;//判断是否为数字
+ (BOOL)isNumber:(NSString *)numbers;//判断是否为数字和小数
+ (BOOL)isTwoPointNumber:(NSString *)numbers;//判断最多两位小数
+ (BOOL)isTwoPointNumberByStr:(NSString *)numbers;//判断最多两位小数
+ (BOOL)checkCreditUserName:(NSString *)userName;//征信用户名
+ (BOOL)checkCreditPassword:(NSString *)userName;//征信密码
+ (BOOL)checkIdentity:(NSString *)identityNum;//判断身份证
+ (BOOL)checkChineseName : (NSString *)userName;//中文名称
+ (BOOL)checkSchoolPassword:(NSString *)userName;//学信密码


// 删除float末位0
- (NSString *)deleteZeroWithString:(NSString *)str;
- (NSString *)deleteZeroFormatFloat:(float)f;
// 千位符函数
- (NSString *)separatedStrWithStr:(NSString *)string;
- (NSString *)separatedFloatStrWithStr:(NSString *)string;



@end
