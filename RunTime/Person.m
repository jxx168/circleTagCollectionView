//
//  Person.m
//  RunTime
//
//  Created by 闫强 on 2020/3/24.
//  Copyright © 2020 wonders. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
@implementation Person
//重写父类方法：处理类方法
+ (BOOL)resolveClassMethod:(SEL)sel{
    if(sel == @selector(haveMeal:)){
        class_addMethod(object_getClass(self), sel, class_getMethodImplementation(object_getClass(self), @selector(zs_haveMeal:)), "v@");
        return YES;   //添加函数实现，返回YES
    }
    return [class_getSuperclass(self) resolveClassMethod:sel];
}
@end
