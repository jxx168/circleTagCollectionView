//
//  SquereAnimationView.h
//  RunTime
//
//  Created by yq on 2020/9/8.
//  Copyright © 2020 wonders. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SquereAnimationView : UIView
@property (nonatomic,copy) NSArray * models;

- (void)startAnimation;
-(void)stopAnimation;
@end

NS_ASSUME_NONNULL_END
