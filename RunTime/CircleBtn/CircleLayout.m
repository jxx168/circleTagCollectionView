//
//  CircleLayout.m
//  RunTime
//
//  Created by qt on 2020/3/24.
//  Copyright © 2020 wonders. All rights reserved.
//

#import "CircleLayout.h"

@implementation CircleLayout
{
    NSMutableArray * _attributeAttay;
}
-(void)prepareLayout{
    [super prepareLayout];
    _itemCount = (int)[self.collectionView numberOfItemsInSection:1];
    _attributeAttay = [[NSMutableArray alloc]init];
    CGFloat radius = MIN(self.collectionView.frame.size.width, self.collectionView.frame.size.height)/2;
    //计算圆心位置
    CGPoint center = CGPointMake(self.collectionView.frame.size.width/2, self.collectionView.frame.size.height/2);
    for (int i=0; i<_itemCount; i++) {
        UICollectionViewLayoutAttributes * attris = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        //设置item大小
        attris.size = CGSizeMake(50, 50);
        float x = center.x+cosf(2*M_PI/_itemCount*i)*(radius-25);
        float y = center.y+sinf(2*M_PI/_itemCount*i)*(radius-25);
        attris.center = CGPointMake(x, y);
        [_attributeAttay addObject:attris];
    }
}
//设置内容区域的大小
-(CGSize)collectionViewContentSize{
    return self.collectionView.frame.size;
}

//返回设置数组
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return _attributeAttay;
}
@end
