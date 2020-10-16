//
//  SquereController.m
//  RunTime
//
//  Created by yq on 2020/9/8.
//  Copyright © 2020 wonders. All rights reserved.
//

#import "SquereController.h"
#import "SquereAnimationView.h"
@interface SquereController ()

@end

@implementation SquereController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    

    SquereAnimationView *marqueeView = [[SquereAnimationView alloc] initWithFrame:CGRectMake(0,100,self.view.bounds.size.width,44)];
        [self.view addSubview:marqueeView];
        [marqueeView setModels:@[@{@"title":@"你好吗",@"icon":@"guide-select"},@{@"title":@"我很好",@"icon":@"guide-select"}]];
        //开始动画
        [marqueeView startAnimation];

}


@end
