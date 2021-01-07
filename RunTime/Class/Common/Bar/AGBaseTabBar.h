//
//  AGBaseTabBar.h
//  RunTime
//
//  Created by yq on 2020/12/31.
//  Copyright © 2020 wonders. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AGBaseTabBar;

NS_ASSUME_NONNULL_BEGIN

@protocol BaseTabBarDelegate <NSObject>
- (void)tabBarDidClickedButton:(AGBaseTabBar *)tabBar selectedIndex:(NSInteger)selectedIndex;
@end

@interface AGBaseTabBar : UIView

@property (nonatomic,assign) id<BaseTabBarDelegate>delegate;

+ (instancetype)tabBarWithSBNames:(NSArray *)sbNames;

@end

@interface AGBaseTabButton : UIButton

@end

NS_ASSUME_NONNULL_END
