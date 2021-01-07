//
//  AGBaseTabBarController.m
//  RunTime
//
//  Created by yq on 2020/12/31.
//  Copyright © 2020 wonders. All rights reserved.
//

#import "AGBaseTabBarController.h"
#import "AGBaseTabBar.h"
@interface AGBaseTabBarController ()<BaseTabBarDelegate>

@end

@implementation AGBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    // 移除系统TabBar的UITabBarItem
    for (UIView *view in self.tabBar.subviews) {
        if (![view isKindOfClass:[AGBaseTabBar class]]) {
            [view removeFromSuperview];
        }
    }
}

/// 自定义tabbar
- (void)configureTabbar {
    // tabbar图标名称
    NSArray *sbNames = @[
                         @"icon_home_n",
                         @"Live",
                         @"EPG",
                         @"VIP",
                         @"Mine"
                         ];
    //2 设置自定义tabBar
    AGBaseTabBar *tabBar = [AGBaseTabBar tabBarWithSBNames:sbNames];
    //设置代理
    tabBar.delegate = self;
    // 加到系统tabbar位置
    [self.tabBar addSubview:tabBar];
    tabBar.frame = self.tabBar.bounds;
}

#pragma mark - BaseTabBarDelegate
//自定义tabBar的代理方法
- (void)tabBarDidClickedButton:(AGBaseTabBar *)tabBar selectedIndex:(NSInteger)selectedIndex {
    //让tabBarController中的对应子控制器显示
    self.selectedIndex = selectedIndex;
}

@end
