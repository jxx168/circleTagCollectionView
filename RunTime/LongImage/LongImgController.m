//
//  LongImgController.m
//  RunTime
//
//  Created by yq on 2020/7/1.
//  Copyright © 2020 wonders. All rights reserved.
//

#import "LongImgController.h"
#import <Masonry.h>
#import "UIImageView+WebCache.h"
@interface LongImgController ()
@property (nonatomic,strong) UIScrollView * scrollview;
@end

@implementation LongImgController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIScrollView * scrollB = [UIScrollView new];
    scrollB.showsVerticalScrollIndicator = NO;
    scrollB.showsHorizontalScrollIndicator = NO;
    scrollB.backgroundColor = [UIColor clearColor];
    [self.view addSubview:scrollB];
    [scrollB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    
    UIImageView * imgT = [[UIImageView alloc] init];
    imgT.contentMode = UIViewContentModeScaleAspectFit;
    [imgT sd_setImageWithURL:[NSURL URLWithString:@"http://manniu-app-production.oss-cn-shanghai.aliyuncs.com/agent/tjhaibao.png"] placeholderImage:[UIImage imageNamed:@""]];
    [scrollB addSubview:imgT];
    [imgT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.width.equalTo(scrollB);
        make.height.mas_greaterThanOrEqualTo(100);
    }];
    
//    UIView * viewT = [UIView new];
//    viewT.backgroundColor = [UIColor redColor];
//    [scrollB addSubview:viewT];
//    [viewT mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(scrollB);
//        make.left.width.equalTo(scrollB);
//        make.height.mas_equalTo(800);
//    }];
//    UILabel * labB = [[UILabel alloc] init];
//    labB.textColor = [UIColor blueColor];
//    labB.text = @"12312312321";
//    [viewT addSubview:labB];
//    [labB mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(viewT);
//    }];
    
    UIView * viewB = [UIView new];
    viewB.backgroundColor = [UIColor cyanColor];
    [scrollB addSubview:viewB];
    [viewB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(scrollB);
        make.top.equalTo(imgT.mas_bottom).offset(10);
        make.height.mas_equalTo(900);
        make.bottom.equalTo(scrollB);
    }];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"截图" style:UIBarButtonItemStylePlain target:self action:@selector(jt)];
    
    self.scrollview = scrollB;
}

-(void)jt{
    UIImage * image = [self saveLongImage:self.scrollview];
    NSLog(@"当前截图为：%@",image);
}

-(UIImage *)saveLongImage:(UIScrollView *)scrollView{
    UIImage* image = nil;
    UIGraphicsBeginImageContext(scrollView.contentSize);
    {
        CGPoint savedContentOffset = scrollView.contentOffset;
        CGRect savedFrame = scrollView.frame;
        scrollView.contentOffset = CGPointZero;
        scrollView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height);
        
        [scrollView.layer renderInContext: UIGraphicsGetCurrentContext()];
        image = UIGraphicsGetImageFromCurrentImageContext();
        
        scrollView.contentOffset = savedContentOffset;
        scrollView.frame = savedFrame;
    }
    UIGraphicsEndImageContext();
    
    if (image != nil) {
        return image;
    }
    return nil;
}
@end
