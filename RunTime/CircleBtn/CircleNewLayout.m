//
//  CircleNewLayout.m
//  RunTime
//
//  Created by qt on 2020/3/25.
//  Copyright © 2020 wonders. All rights reserved.
//

#import "CircleNewLayout.h"
#define SCREENWIDTH [[UIScreen mainScreen] bounds].size.width
@implementation CircleNewLayout
{
    NSMutableArray * _attributeAttay;
}
-(void)prepareLayout{

    [super prepareLayout];
    _attributeAttay = [NSMutableArray array];
    NSInteger section = self.collectionView.numberOfSections;
    for (int n = 0;  n < section; n++) {
        //每组cell数
        NSInteger count = [self.collectionView numberOfItemsInSection:n];
        for (int i = 0 ; i < count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:n];
            //获取布局信息
            UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
            [_attributeAttay addObject:attrs];
        }
    }
    
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section > 0) {
        //组数
        NSInteger count = [self.collectionView numberOfItemsInSection:indexPath.section];
        CGFloat angle = 2 * M_PI / count * indexPath.item;
        //原本的布局信息
        UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        //设置半径 w + indexPath.section * 50
        CGFloat radius = 0;
        if (indexPath.section == 2) {
            radius = (SCREENWIDTH - 64) / 2;
        } else {
            radius = (SCREENWIDTH - 64) / 2 - 60;
        }
        CGFloat x = self.collectionView.frame.size.width/2;
        CGFloat y = self.collectionView.frame.size.height/2;
        //设置cell的中心
        attrs.center = CGPointMake(x + radius * sin(angle), y + radius *cos(angle));
        //设置宽高
        attrs.size = CGSizeMake(61, 61);
        return attrs;
    } else {
        //原本的布局信息
        UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        CGFloat x = self.collectionView.frame.size.width/2;
        CGFloat y = self.collectionView.frame.size.height/2;
        attrs.size = CGSizeMake(79, 79);
        attrs.center = CGPointMake(x, y);
        return attrs;
    }
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return _attributeAttay;
}
@end
