//
//  XProgressHUD.h
//  XPXBaseProjectTools
//
//  Created by 许鹏翔 on 2017/6/7.
//  Copyright © 2017年 XTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XProgressHUD : UIView

+ (void)showHUDView:(BOOL)show; /**< 加载框 */
+ (void)showHUDView:(UIView *)theView states:(BOOL)successOrFailed title:(NSString *)theTitle content:(NSString *)theContent time:(float)thTime andCodes:(void (^)(void))finish; /**< 提示框 */

+ (void)unShowHUDViewSleepTime:(float)thTime andCodes:(void (^)(void))finish; /**< 纯粹的延迟 */

@end
