//
//  LeadPageView.m
//  XPXBaseProjectTools
//
//  Created by 许鹏翔 on 2017/6/7.
//  Copyright © 2017年 XTeam. All rights reserved.
//

#import "LeadPageView.h"

#define ImageArray @[@"app_leadImg_1",@"app_leadImg_2",@"app_leadImg_3"]

@interface LeadPageView ()

@property (nonatomic, weak)UIPageControl *pageControlForImage;

@end

@implementation LeadPageView

- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        //状态栏黑
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
        
        
        CGFloat _width = self.frame.size.width;
        CGFloat _height = self.frame.size.height;
        
        UIScrollView *scrollView = [[UIScrollView alloc]init];
        scrollView.bounces = NO;
        scrollView.delegate = self;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.pagingEnabled = YES;
        [scrollView setContentSize:CGSizeMake(ImageArray.count*_width, 0)];
        [scrollView setContentOffset:CGPointMake(0, 0)];
        [self addSubview:scrollView];
        [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        UIPageControl *pageControl = [[UIPageControl alloc]init];
        pageControl.numberOfPages = 3;
        pageControl.userInteractionEnabled = NO;
        [pageControl setPageIndicatorTintColor:RGB(177, 177, 177)];
        [pageControl setCurrentPageIndicatorTintColor:RGB(84, 48, 48)];
        [self addSubview:pageControl];
        self.pageControlForImage = pageControl;
        [self.pageControlForImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).with.offset(-15);
            make.centerX.equalTo(self.mas_centerX);
            make.height.mas_equalTo(15);
            make.width.mas_equalTo(150);
        }];
        
        //创建图片
        for (int i = 0; i < ImageArray.count; i++) {
            UIImage * image = Image_PNG(ImageArray[i]);
            UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(_width*i, 0, _width, _height)];
            imageView.image = image;
            [scrollView addSubview:imageView];
            
            if (i == imageNamesArr.count-1) {
                
                UIButton * btn = [[UIButton alloc] initWithMainBackGroundColorText:@"立即体验"];
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    NSInteger row = scrollView.contentOffset.x/ScreenWidth;
    self.pageControlForImage.currentPage = row;
}



@end
