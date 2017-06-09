//
//  LeadPageView.m
//  youxin_company
//
//  Created by ldhios2 on 17/5/4.
//  Copyright © 2017年 杭州稳瞻信息科技有限公司. All rights reserved.
//

#import "LeadPageView.h"

@interface LeadPageView ()

//@property (nonatomic, weak)UIPageControl *pageControlForImage;

@end

@implementation LeadPageView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        //状态栏黑
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
        
        //创建引导页图片数组
        NSArray * imageNamesArr = @[@"company_leadImg_1",@"company_leadImg_2",@"company_leadImg_3"];
        
        CGFloat _width = self.frame.size.width;
        CGFloat _height = self.frame.size.height;
        
        UIScrollView *scrollView = [[UIScrollView alloc]init];
        scrollView.bounces = NO;
        scrollView.delegate = self;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.pagingEnabled = YES;
        [scrollView setContentSize:CGSizeMake(imageNamesArr.count*_width, 0)];
        [scrollView setContentOffset:CGPointMake(0, 0)];
        [self addSubview:scrollView];
        [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        //        UIPageControl *pageControl = [[UIPageControl alloc]init];
        //        pageControl.numberOfPages = 3;
        //        pageControl.userInteractionEnabled = NO;
        //        [pageControl setPageIndicatorTintColor:RGB(177, 177, 177, 1.0)];
        //        [pageControl setCurrentPageIndicatorTintColor:RGB(84, 48, 48, 1.0)];
        //        [self addSubview:pageControl];
        //        self.pageControlForImage = pageControl;
        //        [self.pageControlForImage mas_makeConstraints:^(MASConstraintMaker *make) {
        //            make.bottom.equalTo(self.mas_bottom).with.offset(-15);
        //            make.centerX.equalTo(self.mas_centerX);
        //            make.height.mas_equalTo(15);
        //            make.width.mas_equalTo(150);
        //        }];
        
        //创建图片
        for (int i = 0; i<imageNamesArr.count; i++) {
            UIImage * image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageNamesArr[i] ofType:@"png"]];
            UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(_width*i, 0, _width, _height)];
            imageView.image = image;
            [scrollView addSubview:imageView];
            
            if (i == imageNamesArr.count-1) {
                UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.layer.cornerRadius = 5;
                btn.layer.masksToBounds = YES;
                btn.layer.borderColor = RGB(50, 213, 207, 1).CGColor;
                btn.layer.borderWidth = 1;
                [btn setTitle:@"立即体验" forState:UIControlStateNormal];
                [btn setTitleColor:RGB(50, 213, 207, 1) forState:UIControlStateNormal];
                btn.titleLabel.font = [UIFont systemFontOfSize:19];
                [btn setTitleColor:MAINCOLOR forState:UIControlStateNormal];
                
                [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
                imageView.userInteractionEnabled = YES;
                [imageView addSubview:btn];
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerX.equalTo(imageView.mas_centerX);
                    make.size.mas_equalTo(CGSizeMake(150, 44));
                    make.bottom.equalTo(imageView.mas_bottom).with.offset(-90);
                }];
                
                
            }
        }
    }
    
    return self;
}

//点击事件
- (void)btnClick:(UIButton *)btn{
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = CGRectMake(-ScreenWidth, 0, ScreenWidth, ScreenHeight);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        //状态栏白
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }];
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

//    NSInteger row = scrollView.contentOffset.x/ScreenWidth;
//    self.pageControlForImage.currentPage = row;
//}



@end
