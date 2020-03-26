//
//  ItemCell.m
//  RunTime
//
//  Created by qt on 2020/3/24.
//  Copyright © 2020 wonders. All rights reserved.
//

#import "ItemCell.h"
#import <Masonry.h>
@class SuccessView;
@interface ItemCell()
@property (nonatomic,strong) UILabel * labTitle;
@property (nonatomic,strong) UIImageView * imgSelect;
@end
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
    [viewB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(4, 4, 4, 4));
    }];
    viewB.layer.cornerRadius = (self.frame.size.width - 8) / 2;
    viewB.layer.masksToBounds = YES;
    
    UILabel * labTitle = [UILabel new];
    labTitle.text = @"哈哈";
    labTitle.textAlignment = NSTextAlignmentCenter;
    labTitle.font = [UIFont systemFontOfSize:13];
    labTitle.textColor = [UIColor whiteColor];
    [viewB addSubview:labTitle];
    [labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    self.labTitle = labTitle;
    
    UIImageView * imageR = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide-select"]];
    [self addSubview:imageR];
    [imageR mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self).offset(4);
        make.width.height.mas_equalTo(14);
    }];
    
    
}
-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (selected) {
        
    }
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
