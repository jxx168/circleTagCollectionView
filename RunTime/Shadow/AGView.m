//
//  AGView.m
//  RunTime
//
//  Created by yq on 2020/6/10.
//  Copyright © 2020 wonders. All rights reserved.
//

#import "AGView.h"
@interface AGView()

@end
@implementation AGView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.btnTitle = [UIButton buttonWithType:UIButtonTypeSystem];
        self.btnTitle.frame = CGRectMake(0, 0, 100, 100);
        [self.btnTitle setTitle:@"点点" forState:UIControlStateNormal];
        [self.btnTitle setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self addSubview:self.btnTitle];
        [self.btnTitle addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)click{
    if (self.RBlock) {
        self.RBlock(10);
    }
}
@end
