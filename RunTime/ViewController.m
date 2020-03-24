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
#define SCREENWIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREENHEIGHT  [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)UICollectionView * collB;
@property (nonatomic,strong)UICollectionView * collB1;
@property (nonatomic,strong)UIView * successView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView * viewBG = [[UIView alloc] initWithFrame:CGRectMake(20, 200, SCREENWIDTH-40, 386)];
    viewBG.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:viewBG];
   
    CircleLayout * layout = [[CircleLayout alloc]init];
    UICollectionView * collect  = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 303, 297) collectionViewLayout:layout];
    collect.allowsMultipleSelection = YES;
    collect.delegate=self;
    collect.dataSource=self;
    collect.backgroundColor = [UIColor clearColor];
    [collect registerClass:[ItemCell class] forCellWithReuseIdentifier:@"cellid"];
    [viewBG addSubview:collect];
    self.collB = collect;
    
    CircleLayout * layout1 = [[CircleLayout alloc]init];
    UICollectionView * collect1  = [[UICollectionView alloc]initWithFrame:CGRectMake(56, 56, 186, 186) collectionViewLayout:layout1];
    collect1.delegate=self;
    collect1.dataSource=self;
    collect1.layer.cornerRadius = 70;
    collect1.layer.masksToBounds = YES;
    collect1.allowsMultipleSelection = YES;
    collect1.backgroundColor = [UIColor clearColor];
    [collect1 registerClass:[ItemCell class] forCellWithReuseIdentifier:@"cell2"];
    [viewBG addSubview:collect1];
    self.collB1 = collect1;
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(61, 61, 64, 64);
    btn.backgroundColor = [UIColor redColor];
    btn.layer.cornerRadius = 32;
    btn.layer.masksToBounds = YES;
    [self.collB1 addSubview:btn];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionView == self.collB) {
        return 12;
    }
    return 8;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == self.collB) {
        ItemCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
        return cell;
    } else {
        ItemCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell2" forIndexPath:indexPath];
        return cell;
    }
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ItemCell * cell = (ItemCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if (collectionView == self.collB) {
        NSLog(@"我是外层：%ld",(long)indexPath.item);
        cell.selected = !cell.selected;
    } else {
        NSLog(@"我是内层：%ld",(long)indexPath.item);
        cell.selected = !cell.selected;
    }
}

@end
