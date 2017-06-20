//
//  YXTabBarController.m
//  XPXBaseProjectTools
//
//  Created by 许鹏翔 on 2017/6/7.
//  Copyright © 2017年 XTeam. All rights reserved.
//

#import "XTabBarController.h"
#import "XNavigationController.h"
#import "HomePageVC.h"
#import "CreditVC.h"
#import "LoanVC.h"
#import "MineVC.h"
#import "LoginVC.h"

@interface XTabBarController () <UITabBarControllerDelegate>

@end

@implementation XTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (instancetype)init {
    
    if (self == [super init]) {
        
        HomePageVC *home =   [[HomePageVC alloc] init];
        CreditVC   *credit = [[CreditVC alloc] init];
        LoanVC     *loan =   [[LoanVC alloc] init];
        MineVC     *mine =    [[MineVC alloc] init];
        
        YXNavigationController *nvc1 = [[YXNavigationController alloc] initWithRootViewController:home];
        YXNavigationController *nvc2 = [[YXNavigationController alloc] initWithRootViewController:credit];
        YXNavigationController *nvc3 = [[YXNavigationController alloc] initWithRootViewController:loan];
        YXNavigationController *nvc4 = [[YXNavigationController alloc] initWithRootViewController:mine];
        
        
        nvc1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[[UIImage imageNamed:@"home"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"home_select"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ]];
        nvc2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"二页" image:[[UIImage imageNamed:@"credit"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"credit_select"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        nvc3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"三页" image:[[UIImage imageNamed:@"loan"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"loan_select"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        nvc4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"mine"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"mine_select"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        self.tabBar.tintColor = MAINCOLOR;
        self.tabBar.translucent = NO;
        self.tabBar.backgroundColor = [UIColor whiteColor];
        self.delegate = self;
        [self addChildViewController:nvc1];
        [self addChildViewController:nvc2];
        [self addChildViewController:nvc3];
        [self addChildViewController:nvc4];
    }
    
    return self;
}


- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    if ([viewController.tabBarItem.title isEqualToString:@"我的"]) {
        
        if ([SingleExampleProperty singleProperty].userName) {
            return YES;
        }else{
            LoginVC *loginVC = [[LoginVC alloc] init];
            loginVC.navigationController = self.navigationController;
            [self presentViewController:loginVC animated:YES completion:nil];
            return NO;
        }
    }else{
        return YES;
    }
}


@end
