//
//  XProgressHUD.m
//  XPXBaseProjectTools
//
//  Created by 许鹏翔 on 2017/6/7.
//  Copyright © 2017年 XTeam. All rights reserved.
//

#import "XProgressHUD.h"
#import "MBProgressHUD.h"

@implementation XProgressHUD

// 加载框
-(void)showHUDView:(BOOL)show {
    
    if (show) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication] keyWindow] animated:YES];
        hud.labelText = @"请稍后...";
        hud.color = [UIColor darkGrayColor];
        hud.animationType = MBProgressHUDAnimationZoomOut; // MBProgressHUDAnimationFade,
    } else {
        [MBProgressHUD hideAllHUDsForView:[[UIApplication sharedApplication] keyWindow] animated:YES];
    }
}

// 提示框
-(void)showHUDView:(UIView *)theView states:(BOOL)successOrFailed title:(NSString *)theTitle content:(NSString *)theContent time:(float)thTime andCodes:(void (^)())finish {
    
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication] keyWindow] animated:YES];
    HUD.labelText        = theTitle;
    HUD.detailsLabelText = theContent;
    HUD.mode             = MBProgressHUDModeCustomView; // MBProgressHUDModeText;
    HUD.color            = [UIColor darkGrayColor];
    [HUD hide:YES afterDelay:2];
    
    HUD.customView       = [[UIImageView alloc] initWithImage: successOrFailed ? [UIImage imageNamed:@"hud_success"] : [UIImage imageNamed:@"hud_warning"]];
    
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(thTime); // 暂停和afterDelay:2并无关系
    } completionBlock:^{
        if (finish) {
            finish();
        }
    }];
}



@end
