//
//  UIViewController+Extension.m
//  v2ex
//
//  Created by gengjie on 16/8/26.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

#import "UIViewController+Extension.h"
#import "MobClick.h"
#import "UIImage+Extension.h"

@implementation UIViewController (Extension)

- (void)setTempNavImageView
{
    UIImageView *greeenView = [[UIImageView alloc] init];
    greeenView.image = [UIImage imageWithColor: [UIColor colorWithHexString: WTAppLightColor]];
    [self.view addSubview: greeenView];
    greeenView.frame = CGRectMake(0, 0, WTScreenWidth, 64);
}

/** 设置导航栏的背景图片 */
- (void)setNavBackgroundImage
{
    [self.navigationController.navigationBar setBackgroundImage: [UIImage imageWithColor: [UIColor colorWithHexString: WTAppLightColor]] forBarMetrics:UIBarMetricsDefault];
}

+ (void)load
{
    Method wt_viewWillAppear = class_getInstanceMethod(self, @selector(wt_viewWillAppear:));
    
    Method viewWillAppear = class_getInstanceMethod(self, @selector(viewWillAppear:));
    
    Method wt_viewWillDisappear = class_getInstanceMethod(self, @selector(wt_viewWillDisappear:));
    
    Method viewWillDisappear = class_getInstanceMethod(self, @selector(viewWillDisappear:));
    
    method_exchangeImplementations(wt_viewWillAppear, viewWillAppear);
    
    method_exchangeImplementations(wt_viewWillDisappear, viewWillDisappear);
}

- (void)wt_viewWillAppear:(BOOL)animated
{
    [self wt_viewWillAppear: animated];
   
    
    if (![self isMemberOfClass: [UINavigationController class]] || ![self isMemberOfClass: [UITabBarController class]])
    {
         WTLog(@"%@ wt_viewWillAppear", NSStringFromClass([self class]))
        [MobClick beginLogPageView: NSStringFromClass([self class])];
    }
    
    
}

- (void)wt_viewWillDisappear:(BOOL)animated
{
    [self wt_viewWillDisappear: animated];
    if (![self isMemberOfClass: [UINavigationController class]] || ![self isMemberOfClass: [UITabBarController class]])
    {
        WTLog(@"%@ wt_viewWillDisappear", NSStringFromClass([self class]))
        [MobClick endLogPageView: NSStringFromClass([self class])];
    }
}

@end
