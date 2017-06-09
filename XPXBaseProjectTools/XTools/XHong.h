//
//  XHong.h
//  XPXBaseProjectTools
//
//  Created by 许鹏翔 on 2017/6/7.
//  Copyright © 2017年 XTeam. All rights reserved.
//

#ifndef XHong_h
#define XHong_h


#pragma mark - 系统相关 (宏 定义)
//** 沙盒路径 ***********************************************************************************
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

//** App Frame ********************************************************************************
#define Application_Frame       [[UIScreen mainScreen] applicationFrame]
#define Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Screen_Width       [[UIScreen mainScreen] bounds].size.width

#define FileManager [NSFileManager defaultManager]
#define UserDefaults   [NSUserDefaults standardUserDefaults]
#define Window         [[UIApplication sharedApplication] keyWindow]

//** 系统控件默认高度 ****************************************************************************

#define StatusBarHeight        (20.f)

#define NvcBarHeight           (44.f)
#define TabBarHeight           (49.f)

#define CellDefaultHeight      (44.f)

#define EnglishKeyboardHeight  (216.f)
#define ChineseKeyboardHeight  (252.f)


#pragma mark - 系统相关 (宏 方法)
//** DEBUG LOG ********************************************************************************
#ifdef DEBUG

#define NSLog( s, ... ) NSLog( @"< %@:(%d) > %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )

#else

#define DLog( s, ... )

#endif

//** PNG JPG 图片路径 ***************************************************************************
#define PNG_Path(NAME)           [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"png"]
#define JPG_Path(NAME)           [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"jpg"]
#define PATH(NAME, EXT)         [[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]

// 加载图片
#define Image_PNG(NAME)          [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"png"]]
#define Image_JPG(NAME)          [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"jpg"]]
#define Image_Named(imgName) [UIImage imageNamed:imgName]

//** NSString ********************************************************************************
#define URL(url)             [NSURL URLWithString:url]
#define String(str1,str2)    [NSString stringWithFormat:@"%@%@",str1,str2]
#define String_string(str1)  [NSString stringWithFormat:@"%@",str1]
#define String_Number(num1)  [NSString stringWithFormat:@"%d",num1]
#define String_Integer(num1) [NSString stringWithFormat:@"%ld",num1]
#define String_Float(flo1)   [NSString stringWithFormat:@"%.2f",flo1]

//** 字体大小(常规/粗体) *************************************************************************
#define Bold_SystemFont(FONTSIZE) [UIFont boldSystemFontOfSize:FONTSIZE]
#define SystemFont(FONTSIZE)      [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)      [UIFont fontWithName:(NAME) size:(FONTSIZE)]

//** 颜色(RGB) *************************************************************************
#define RGB(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBA(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

//** 颜色(16进制) *************************************************************************
#define UIColor_16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//** View 圆角和加边框 *************************************************************************
#define View_Radius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

#define View_Border_Radius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

//** 当前版本 *************************************************************************
#define FSystemVersion          ([[[UIDevice currentDevice] systemVersion] floatValue])
#define DSystemVersion          ([[[UIDevice currentDevice] systemVersion] doubleValue])
#define SSystemVersion          ([[UIDevice currentDevice] systemVersion])


//** UIView - viewWithTag ********************************************************************
#define View_With_Tag(_OBJECT, _TAG)\
\
[_OBJECT viewWithTag : _TAG]

//** 断点Assert *************************************************************************
#define xAssert(condition, ...)\
\
do {\
if (!(condition))\
{\
[[NSAssertionHandler currentHandler]\
handleFailureInFunction:[NSString stringWithFormat:@"< %s >", __PRETTY_FUNCTION__]\
file:[[NSString stringWithUTF8String:__FILE__] lastPathComponent]\
lineNumber:__LINE__\
description:__VA_ARGS__];\
}\
} while(0)

#pragma mark - 自定义 (方法)
//** 过滤字符串为空 *************************************************************************
#define IF_NULL_TO_String(x) ([(x) isEqual:[NSNull null]]||(x)==nil)? @"":TEXT_STRING(x)
// 转换为字符串
#define TEXT_STRING(x) [NSString stringWithFormat:@"%@",x]

//** 字体大小(常规/粗体) *************************************************************************
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

//**  *************************************************************************



//**  *************************************************************************



//**  *************************************************************************



//**  *************************************************************************



//**  *************************************************************************




#endif /* XHong_h */
