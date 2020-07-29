//
//  ViewController.m
//  RunTime
//
//  Created by qt on 2020/3/24.
//  Copyright © 2020 wonders. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "CircleController.h"
#import "CalenderController.h"
#import "ShadowController.h"
#import "WkPdfController.h"
#import "LongImgController.h"
#import "LuPingController.h"
#define SCREENWIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREENHEIGHT  [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tabB;
@property (nonatomic,copy) NSArray * arrData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrData = @[@"圆形布局",@"日历",@"微信原生分享",@"WK打印PDF",@"截长图",@"录屏"];
    [self.view addSubview:self.tabB];
    [self.tabB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.arrData[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        CircleController * circle = [CircleController new];
        [self.navigationController pushViewController:circle animated:YES];
    } else if (indexPath.row == 1){
        CalenderController * calender = [CalenderController new];
        [self.navigationController pushViewController:calender animated:YES];
    } else if (indexPath.row == 2) {
        ShadowController * shadow = [ShadowController new];
        [self.navigationController pushViewController:shadow animated:YES];
    } else if (indexPath.row == 3) {
        WkPdfController * pdf = [WkPdfController new];
        [self.navigationController pushViewController:pdf animated:YES];
    } else if (indexPath.row == 4) {
        LongImgController * lon = [LongImgController new];
        [self.navigationController pushViewController:lon animated:YES];
    } else if (indexPath.row == 5) {
        LuPingController * luping = [LuPingController new];
        [self.navigationController pushViewController:luping animated:YES];
    }
}

-(UITableView *)tabB{
    if (!_tabB) {
        _tabB = [[UITableView alloc] init];
        _tabB.delegate = self;
        _tabB.dataSource = self;
    }
    return _tabB;
}
@end
