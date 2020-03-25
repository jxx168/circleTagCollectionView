//
//  ViewController.m
//  RunTime
//
//  Created by 闫强 on 2020/3/24.
//  Copyright © 2020 wonders. All rights reserved.
//

#import "ViewController.h"
#import "CircleLayout.h"
#import "UIView+PBFrameExtension.h"
#import "ItemCell.h"
#import "CircleNewLayout.h"
#import <Masonry.h>
#define SCREENWIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREENHEIGHT  [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)UICollectionView * collB;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CircleNewLayout * layout = [[CircleNewLayout alloc]init];
    UICollectionView * collect  = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 100, SCREENWIDTH, SCREENWIDTH) collectionViewLayout:layout];
    collect.backgroundColor = [UIColor redColor];
    collect.allowsMultipleSelection = YES;
    collect.delegate=self;
    collect.dataSource=self;
    [collect registerClass:[ItemCell class] forCellWithReuseIdentifier:@"cellid"];
    [self.view addSubview:collect];
    self.collB = collect;
    
    
//
//    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(61, 61, 64, 64);
//    btn.backgroundColor = [UIColor redColor];
//    btn.layer.cornerRadius = 32;
//    btn.layer.masksToBounds = YES;
//    [self.collB1 addSubview:btn];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    } else if(section == 1){
        return 6;
    }
    return 8;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ItemCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ItemCell * cell = (ItemCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSLog(@"我是外层：%ld",(long)indexPath.item);
    cell.selected = !cell.selected;
}
@end
