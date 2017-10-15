//
//  XParentViewController.h
//  KidsGrowingNotes
//
//  Created by 薪王iOS1 on 2017/7/12.
//  Copyright © 2017年 杭州薪王信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XParentViewController : UIViewController

@property (nonatomic, strong) NSMutableDictionary *parametersDic;
@property (nonatomic, strong) UITableView *tableView;

// 设置导航栏属性
- (void)setupNavigationTitle:(NSString *)title;
// 隐藏NVC
- (void)hiddenNavigationController;
// 透明NVC
- (void)alphaZeroNavigationController;
// 取消返回手势
- (void)disableInteractivePop;

// 创建tableview
- (void)createTableView;

// 是否登录
- (void)checkLogin:(void (^)(void))block;
// 删除账户
- (void)deleteAccountInfo;

@end
