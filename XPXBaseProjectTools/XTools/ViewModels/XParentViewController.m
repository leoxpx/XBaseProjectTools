//
//  XParentViewController.m
//  KidsGrowingNotes
//
//  Created by 薪王iOS1 on 2017/7/12.
//  Copyright © 2017年 杭州薪王信息技术有限公司. All rights reserved.
//

#import "XParentViewController.h"

@interface XParentViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation XParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 网络参数初始化
    self.parametersDic = [NSMutableDictionary dictionary];
}


// 设置导航栏属性
- (void)setupNavigationTitle:(NSString *)title {
    
    self.title = title; // 标题
    NSDictionary *dic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor whiteColor], [UIFont systemFontOfSize:18], nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, NSFontAttributeName, nil]];
    self.navigationController.navigationBar.titleTextAttributes = dic; // 颜色
    
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault; // 镂空样式
    self.navigationController.navigationBar.translucent = NO; // 64
    self.navigationController.navigationBar.barTintColor = MainColor; // nvc颜色
    self.navigationController.navigationBar.tintColor = [UIColor redColor]; // 镂空图片字体颜色
    
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
}
/*
 // push
 - (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animating complete:(void(^)(BOOL finished))finish {
 
 // rt_push
 [self.rt_navigationController pushViewController:viewController
 animated:animating
 complete:finish];
 // 如若push后关闭本页 complete内执行: [self.rt_navigationController removeViewController:self];
 
 // 隐藏tabbar
 self.tabBarController.hidesBottomBarWhenPushed = YES;
 }
  */

 // 添加多个按钮或如果需要添加返回按钮其他事件, 继承类中需要手动添加方法1并重写方法2.
- (void)addNvcBackItem {
 
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setImage:Image_PNG(@"nvc_back") forState:UIControlStateNormal];
     [btn sizeToFit];
     [btn addTarget:self action:@selector(nvcBackClick) forControlEvents:UIControlEventTouchUpInside];
     UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
 
     self.navigationItem.leftBarButtonItem = item;
}
- (void)nvcBackClick {
     [self.navigationController popViewControllerAnimated:YES];
}

/*
// 返回按钮. 如果对于返回事件不需要做任何处理，但是有想要自定义返回按钮的样式，可以直接重写这个方法
- (UIBarButtonItem *)customBackItemWithTarget:(id)target action:(SEL)action{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setImage:Image_PNG(@"nvc_back") forState:UIControlStateNormal];
//    [btn setImage:Image_PNG(@"regist_head") forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    return item;
}
*/

// 隐藏NVC
- (void)hiddenNavigationController {
    
    self.navigationController.navigationBarHidden = YES;
}

// 透明NVC
- (void)alphaZeroNavigationController {
    
    self.navigationController.navigationBar.subviews.firstObject.alpha = 0;
}

// 取消返回手势
- (void)disableInteractivePop {
    
    // 取消手势返回
//    self.rt_disableInteractivePop = YES;
}

// 创建tableview
- (void)createTableView {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height-64) style:UITableViewStyleGrouped];
    tableView.backgroundColor = BackgroundColor;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 50;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}


// 是否登录
- (void)checkLogin:(void (^)(void))block{
    
    if ([[XDataTools filterStrNull: [ShareSingle shareSingle].user_token] isEqualToString:@""]) {
        
        
        
    } else {
        block();
    }
}

// 删除账户
- (void)deleteAccountInfo {
    
    [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"LoginPhone"];
    [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"LoginPass"];
    [ShareSingle shareSingle].user_token = @"";
}

// 获取某个view所在的控制器
- (UIViewController *)viewController
{
    UIViewController *viewController = nil;
    UIResponder *next = self.nextResponder;
    while (next) {
        if ([next isKindOfClass:[UIViewController class]]) {
            viewController = (UIViewController *)next;
            break;
        }
        next = next.nextResponder;
    }
    return viewController;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
