//
//  UIColor+NSSString.h
//  Agent
//
//  Created by frank on 2020/3/20.
//  Copyright © 2020 wonders. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (NSSString)

//以#开头的字符串（不区分大小写），如：#ffFFff，若需要alpha，则传#abcdef255，不传默认为1
+ (UIColor *)colorWithString:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
