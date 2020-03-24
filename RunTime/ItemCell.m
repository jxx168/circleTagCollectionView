//
//  ItemCell.m
//  RunTime
//
//  Created by 闫强 on 2020/3/24.
//  Copyright © 2020 wonders. All rights reserved.
//

#import "ItemCell.h"
#import <Masonry.h>
@class SuccessView;
@implementation ItemCell
{
    SuccessView * _successView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubView];
    }
    return self;
}

-(void)addSubView{
    UIView * viewB = [UIView new];
    viewB.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    [self addSubview:viewB];
    viewB.layer.cornerRadius = 21;
    viewB.layer.masksToBounds = YES;
    [viewB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset(4);
        make.width.height.mas_equalTo(42);
    }];
    
    
    UILabel * labTitle = [UILabel new];
    labTitle.text = @"哈哈";
    labTitle.textAlignment = NSTextAlignmentCenter;
    labTitle.font = [UIFont systemFontOfSize:13];
    labTitle.textColor = [UIColor whiteColor];
    [self addSubview:labTitle];
    [labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    _successView = [[SuccessView alloc] initWithFrame:CGRectMake(0, 0, 14, 14)];
    _successView.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    _successView.hidden = YES;
    [self addSubview:_successView];
    [_successView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(viewB.mas_right).offset(-10);
        make.width.height.mas_equalTo(14);
        make.top.equalTo(viewB.mas_top).offset(5);
    }];
}
-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    _successView.hidden = !selected;
}
@end

@implementation SuccessView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self checkAnimation];

    }
    return self;
}

-(void)checkAnimation{
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 7;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    //外切圆的边长
    CGFloat a = self.bounds.size.width;
    //设置三个点 A、B、C
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(a*2.7/10,a*5.4/10)];
    [path addLineToPoint:CGPointMake(a*4.5/10,a*7/10)];
    [path addLineToPoint:CGPointMake(a*7.8/10,a*3.8/10)];

    //显示图层
    CAShapeLayer *checkLayer = [CAShapeLayer layer];
    checkLayer.path = path.CGPath;
    checkLayer.fillColor = [UIColor clearColor].CGColor;
    checkLayer.strokeColor = [UIColor whiteColor].CGColor;
    checkLayer.lineWidth = 1;
    checkLayer.lineCap = kCALineCapRound;
    checkLayer.lineJoin = kCALineJoinRound;
    [self.layer addSublayer:checkLayer];

    //执行动画
//    CABasicAnimation *checkAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    checkAnimation.duration = 2;
//    checkAnimation.fromValue = @(0.0f);
//    checkAnimation.toValue = @(1.0f);
//    checkAnimation.delegate = self;
//    [checkAnimation setValue:@"checkAnimation" forKey:@"animationName"];
//    [checkLayer addAnimation:checkAnimation forKey:nil];
}

@end
