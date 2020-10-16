//
//  RaceLampView.m
//  RunTime
//
//  Created by yq on 2020/9/8.
//  Copyright © 2020 wonders. All rights reserved.
//

#import "RaceLampView.h"
@interface RaceLampView()

@end

@implementation RaceLampView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self initUIViews];
    }
    return self;
}

-(void)initUIViews{
    [self addSubview:self.imgTemp];
    [self addSubview:self.labDes];
    
}

-(UIImageView *)imgTemp{
    if (!_imgTemp) {
        _imgTemp = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    }
    return _imgTemp;
}

-(UILabel *)labDes{
    if (!_labDes) {
        _labDes = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 100, 40)];
        _labDes.textColor = [UIColor redColor];
    }
    return _labDes;
}
@end
