//
//  UIView+PBFrameExtension.m
//  PowerBull
//
//  Created by 刘岩 on 2020/3/5.
//  Copyright © 2020 wondersgroup. All rights reserved.
//

#import "UIView+PBFrameExtension.h"

@implementation UIView (PBFrameExtension)
#pragma mark - Origin

- (void)setPb_origin:(CGPoint)pb_origin{
    CGRect frame = self.frame;
    self.frame = CGRectMake(pb_origin.x, pb_origin.y, frame.size.width, frame.size.height);
}
- (CGPoint)pb_origin{
    return self.frame.origin;
}

- (void)setPb_originX:(CGFloat)pb_originX{
    CGRect frame = self.frame;
    self.frame = CGRectMake(pb_originX, frame.origin.y, frame.size.width, frame.size.height);
}
- (CGFloat)pb_originX{
    return self.frame.origin.x;
}

- (void)setPb_originY:(CGFloat)pb_originY{
    CGRect frame = self.frame;
    self.frame = CGRectMake(frame.origin.x, pb_originY, frame.size.width, frame.size.height);
}
- (CGFloat)pb_originY{
    return self.frame.origin.y;
}

#pragma mark - Size
- (void)setPb_size:(CGSize)pb_size{
    CGRect frame = self.frame;
    self.frame = CGRectMake(frame.origin.x, frame.origin.y, pb_size.width, pb_size.height);
}
- (CGSize)pb_size{
    return self.frame.size;
}

- (void)setPb_sizeW:(CGFloat)pb_sizeW{
    CGRect frame = self.frame;
    self.frame = CGRectMake(frame.origin.x, frame.origin.y, pb_sizeW, frame.size.height);
}
- (CGFloat)pb_sizeW{
    return self.frame.size.width;
}

- (void)setPb_sizeH:(CGFloat)pb_sizeH{
    CGRect frame = self.frame;
    self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, pb_sizeH);
}
- (CGFloat)pb_sizeH{
    return self.frame.size.height;
}

#pragma mark - Center

- (void)setPb_center:(CGPoint)pb_center{
    self.center = pb_center;
}
- (CGPoint)pb_center{
    return self.center;
}

- (void)setPb_centerX:(CGFloat)pb_centerX{
    CGPoint center = self.center;
    center.x = pb_centerX;
    self.center = center;
}
- (CGFloat)pb_centerX{
    return self.center.x;
}

- (void)setPb_centerY:(CGFloat)pb_centerY{
    CGPoint center = self.center;
    center.y = pb_centerY;
    self.center = center;
}
- (CGFloat)pb_centerY{
    return self.center.y;
}

#pragma mark - Bottom

- (void)setPb_bottom:(CGPoint)pb_bottom{
    CGRect frame = self.frame;
    self.frame = CGRectMake(pb_bottom.x-frame.size.width, pb_bottom.y-frame.size.height, frame.size.width, frame.size.height);
}
- (CGPoint)pb_bottom{
    CGFloat x = CGRectGetMaxX(self.frame);
    CGFloat y = CGRectGetMaxY(self.frame);
    
    return CGPointMake(x, y);
}

- (void)setPb_bottomX:(CGFloat)pb_bottomX{
    CGRect frame = self.frame;
    self.frame = CGRectMake(pb_bottomX-frame.size.width, frame.origin.y, frame.size.width, frame.size.height);
}
- (CGFloat)pb_bottomX{
    return CGRectGetMaxX(self.frame);
}

- (void)setPb_bottomY:(CGFloat)pb_bottomY{
    CGRect frame = self.frame;
    self.frame = CGRectMake(frame.origin.x, pb_bottomY-frame.size.height, frame.size.width, frame.size.height);
    
}
- (CGFloat)pb_bottomY{
    return CGRectGetMaxY(self.frame);
}
@end
