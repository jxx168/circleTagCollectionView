//
//  ShadowController.m
//  RunTime
//
//  Created by yq on 2020/5/27.
//  Copyright © 2020 wonders. All rights reserved.
//

#import "ShadowController.h"
#import "AGView.h"
@interface ShadowController ()
{
    BOOL flag;
    AGView * viewV;
}
@property (nonatomic,copy) NSString * isUser;
@end

@implementation ShadowController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    AGView * viewB = [[AGView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    viewB.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:viewB];
    viewV = viewB;
//    __block AGView * weakViewB = viewV;
//    viewB.RBlock = ^(NSInteger tag) {
//        self->flag = YES;
//        [weakViewB.btnTitle setTitle:@"哈哈" forState:UIControlStateNormal];
//    };
    
//    [UIView animateWithDuration:0.2 animations:^{
//        self->flag = YES;
//    }];
}

- (void)dealloc
{
    NSLog(@"我输出了");
}
@end
