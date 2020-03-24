//
//  Person.h
//  RunTime
//
//  Created by 闫强 on 2020/3/24.
//  Copyright © 2020 wonders. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
//声明类方法，但未实现
+ (void)haveMeal:(NSString *)food;
//声明实例方法，但未实现
- (void)singSong:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
