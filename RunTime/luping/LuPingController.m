//
//  LuPingController.m
//  RunTime
//
//  Created by yq on 2020/7/29.
//  Copyright © 2020 wonders. All rights reserved.
//

#import "LuPingController.h"
#import "LuPingController.h"
#define SCREENWIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREENHEIGHT  [[UIScreen mainScreen] bounds].size.height

@interface LuPingController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tabB;
@end

@implementation LuPingController

-(void)btnLuZhi:(UIButton *)btn{
    if (btn.tag == 100) { //开始
        
    } else { //停止
        
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;//文字黑色
//    [self setNeedsStatusBarAppearanceUpdate];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;//文字黑色
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"录屏";
    [self.view addSubview:self.tabB];
    
    UIButton * btnStart = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnStart setTitle:@"开始录制" forState:UIControlStateNormal];
    [btnStart addTarget:self action:@selector(btnLuZhi:) forControlEvents:UIControlEventTouchUpInside];
    btnStart.tag = 100;
    btnStart.frame = CGRectMake(SCREENWIDTH-100, 100, 100, 40);
    [btnStart setBackgroundColor:[UIColor redColor]];
    [btnStart setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:btnStart];
    
    UIButton * btnStop = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnStop setTitle:@"停止录制" forState:UIControlStateNormal];
    btnStop.frame = CGRectMake(SCREENWIDTH-100, 160, 100, 40);
    btnStop.tag = 101;
    [btnStop setBackgroundColor:[UIColor cyanColor]];
    [btnStop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:btnStop];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
//    if (self.isStatusBarWhite) {
        return UIStatusBarStyleLightContent;
//    } else{
//        if (@available(iOS 13.0, *)) {
//            return UIStatusBarStyleDarkContent;
//        } else {
//            return UIStatusBarStyleDefault;
//        }
//    }
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"我是第%ld行",(long)indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(UITableView *)tabB{
    if (!_tabB) {
        _tabB = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height) style:UITableViewStylePlain];
        _tabB.delegate = self;
        _tabB.dataSource = self;
    }
    return _tabB;
}
@end
