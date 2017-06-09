//
//  YXNavigationController.m
//  youxin_company
//
//  Created by 薪王iOS1 on 2017/4/17.
//  Copyright © 2017年 杭州稳瞻信息科技有限公司. All rights reserved.
//

#import "YXNavigationController.h"

@interface YXNavigationController ()

@end

@implementation YXNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (instancetype)initWithRootViewController:(UIViewController *)viewController {
    
    self = [super initWithRootViewController:viewController];
    if (self) {
        
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
        self.navigationBar.translucent = NO; // 不透明 0,64
        self.navigationBar.barTintColor = MAINCOLOR;
    }
    
    return self;
}

// 添加NVC返回按钮和事件
- (void)addNavgationLeftBarButtonItemForBack {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStylePlain target:self action:@selector(navigationPopBack)];
}

// 返回事件
-(void)navigationPopBack{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        // 自动显示和隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
        [self addNavgationLeftBarButtonItemForBack];
    }
    [super pushViewController:viewController animated:animated];
}


@end
