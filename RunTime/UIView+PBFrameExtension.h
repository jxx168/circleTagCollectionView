//
//  UIView+PBFrameExtension.h
//  PowerBull
//
//  Created by 刘岩 on 2020/3/5.
//  Copyright © 2020 wondersgroup. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (PBFrameExtension)
#pragma mark - Origin 轴坐标

@property (assign, nonatomic) CGPoint pb_origin;
@property (assign, nonatomic) CGFloat pb_originX;
@property (assign, nonatomic) CGFloat pb_originY;

#pragma mark - Size 尺寸大小
@property (assign, nonatomic) CGSize  pb_size;
@property (assign, nonatomic) CGFloat pb_sizeW;
@property (assign, nonatomic) CGFloat pb_sizeH;

#pragma mark - Center 中心点坐标

@property (assign, nonatomic) CGPoint pb_center;
@property (assign, nonatomic) CGFloat pb_centerX;
@property (assign, nonatomic) CGFloat pb_centerY;

#pragma mark - Bottom 右边、下面坐标

@property (assign, nonatomic) CGPoint pb_bottom;
@property (assign, nonatomic) CGFloat pb_bottomX;
@property (assign, nonatomic) CGFloat pb_bottomY;


@end

NS_ASSUME_NONNULL_END
