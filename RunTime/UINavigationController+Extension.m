//
//  UINavigationController+Extension.m
//  RunTime
//
//  Created by yq on 2020/7/31.
//  Copyright © 2020 wonders. All rights reserved.
//

#import "UINavigationController+Extension.h"

@implementation UINavigationController (Extension)
- (UIStatusBarStyle)preferredStatusBarStyle {
    return [self.topViewController preferredStatusBarStyle];
}

//以 topViewController 的 preferredStatusBarStyle 来设置 statusBarStyle
- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}
@end
