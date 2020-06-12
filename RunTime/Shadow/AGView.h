//
//  AGView.h
//  RunTime
//
//  Created by yq on 2020/6/10.
//  Copyright © 2020 wonders. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^refreshBlcok)(NSInteger tag);
@interface AGView : UIView
@property (nonatomic,copy) refreshBlcok RBlock;
@property (nonatomic,strong) UIButton * btnTitle;
@end

NS_ASSUME_NONNULL_END
