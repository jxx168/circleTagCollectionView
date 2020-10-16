
#import "SquereAnimationView.h"
#import "RaceLampView.h"

@interface SquereAnimationView ()<UIScrollViewDelegate>
/**定时器*/
@property (nonatomic, strong) NSTimer *timer;
/**滚动视图*/
@property (nonatomic, strong) UIScrollView *scrollView;
/** 记录已经加载的视图*/
@property (nonatomic, strong) NSMutableArray *viewList;
/**当前滑动第几个界面 1开始*/
@property (nonatomic, assign) NSInteger currentIndex;
/**处理的数组,因为要避免回退动画,就是最后一个回到第一个*/
@property (nonatomic, strong) NSMutableArray *tempArr;
@end

@implementation SquereAnimationView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self= [super initWithFrame:frame]) {
        [self initialize];
        [self createUI];
    }
    return self;
}

#pragma mark - 生命周期

-(void)dealloc{
    [self.timer invalidate];
    self.timer=nil;
}

#pragma mark - 初始化
-(void)initialize{
    self.currentIndex = 1;
}

#pragma mark - 创建UI

-(void)createUI{
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    self.scrollView.backgroundColor = UIColor.grayColor;
    self.scrollView.scrollEnabled = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    [self addSubview:self.scrollView];
}

#pragma mark - 私用方法

#pragma mark - 公共方法

- (void)startAnimation {
    if (!self.timer.isValid) {
        [self.timer fire];
    }
}

-(void) stopAnimation{  //结束动画
    if (self.timer.isValid) {
        [self.timer invalidate];
        self.timer=nil;
    }
}

#pragma mark - 通知方法
#pragma mark - 监听代理
-(void)refreshProgress{
    self.currentIndex++;
    CGFloat x = self.currentIndex * 10;
    [self.scrollView setContentOffset:CGPointMake(x,0) animated:YES];
}

#pragma mark - 代理协议
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView*)scrollView{
    NSLog(@"%lf",scrollView.contentOffset.x);
    if (scrollView.contentOffset.x > (self.tempArr.count - 1) * self.scrollView.frame.size.width) {
        
    }
}

#pragma mark - 懒加载
- (NSMutableArray*)viewList{
    if(!_viewList) {
        _viewList = [[NSMutableArray alloc] init];
    }
    return _viewList;
}

-(NSTimer*)timer{
    if(!_timer) {
        _timer = [NSTimer timerWithTimeInterval: 0.1f target:self selector:@selector(refreshProgress) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _timer;
}

-(NSMutableArray *)tempArr{
    if(!_tempArr) {
        _tempArr= [[NSMutableArray alloc]init];
    }
    return _tempArr;
}

#pragma mark - getset方法
-(void)setModels:(NSArray*)models{
    _models= models;
    //移除动画
    [self.scrollView.layer removeAllAnimations];
    for(UIView * v in self.scrollView.subviews) {
        if([v isKindOfClass:[RaceLampView class]]) {
            [v removeFromSuperview];
        }
    }
    [self.viewList removeAllObjects];
    self.tempArr = [NSMutableArray arrayWithArray:models];
    [self.tempArr addObject:models.firstObject];
    for(int i =0; i < self.tempArr.count; i++){
        NSDictionary*dic =self.tempArr[i];
        RaceLampView *nb = [[RaceLampView alloc] init];
        nb.frame = CGRectMake(i*self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        nb.tag= i;
        nb.labDes.text= dic[@"title"];
        nb.imgTemp.image= [UIImage imageNamed:dic[@"icon"]];
        [self.scrollView addSubview:nb];
        [self.viewList addObject:nb];
    }
    self.scrollView.contentSize = CGSizeMake(self.tempArr.count * self.scrollView.frame.size.width, 0);
    self.clipsToBounds = YES;
}
@end
