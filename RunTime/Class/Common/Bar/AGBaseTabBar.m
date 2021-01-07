
#import "AGBaseTabBar.h"
@class AGBaseTabButton;
@interface AGBaseTabBar ()
/// 记录上一个按钮
@property (nonatomic, weak) UIButton * preButton;

@end

@implementation AGBaseTabBar

+ (instancetype)tabBarWithSBNames:(NSArray *)tabTitles{
    AGBaseTabBar *tabBar = [[AGBaseTabBar alloc] init];
    
    for (NSString *sbName in tabTitles) {
        AGBaseTabButton *btn = [AGBaseTabButton buttonWithType:UIButtonTypeCustom];
        
        btn.tag = tabBar.subviews.count;
        
        [tabBar addSubview:btn];
        
        //加载按钮中显示的图片
        NSString *imgName = [NSString stringWithFormat:@"TabBar_%@",sbName];
        NSString *selectedImgName = [NSString stringWithFormat:@"TabBar_%@_selected",sbName];
        
        //设置按钮的图片
        [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:selectedImgName] forState:UIControlStateSelected];
        [btn.imageView setContentMode:UIViewContentModeScaleAspectFit];
        //给按钮注册点击事件
        [btn addTarget:tabBar action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    }
    
    UIButton *btn = [tabBar.subviews firstObject];
    [tabBar btnClick:btn];
    
    return tabBar;
}

//点击按钮
- (void)btnClick:(UIButton *)sender {
    self.preButton.selected = NO;
    sender.selected = YES;
    self.preButton = sender;
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickedButton:selectedIndex:)]) {
        [self.delegate tabBarDidClickedButton:self selectedIndex:sender.tag];
    }
}

//设置按钮的位置
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat btnW = self.bounds.size.width / self.subviews.count;
    CGFloat btnX = 0;
    CGFloat btnH;
    CGFloat btnY;
    
    for (int i = 0; i < self.subviews.count; i++) {
        UIButton *btn = self.subviews[i];
        //设置按钮的位置
        if (i == 2) { // 中间不规则按钮位置计算
            btnY = -7;
            btnH = 56;
        } else { // 普通按钮位置计算
            btnY = 0;
            btnH = self.bounds.size.height;
        }
        btnX = i * btnW;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}
@end

@implementation AGBaseTabButton
- (void)setHighlighted:(BOOL)highlighted {
    
}
@end
