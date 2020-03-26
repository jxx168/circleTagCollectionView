//
//  AGHomeCalendarView.m
//  RunTime
//
//  Created by qt on 2020/3/26.
//  Copyright © 2020 wonders. All rights reserved.
//

#import "AGHomeCalendarView.h"
#import "AGDateHelpObject.h"
#import "AGWeekView.h"
#import <Masonry.h>
#import "UIColor+NSSString.h"
#define ViewW self.frame.size.width     //当前视图宽度
#define ViewH self.frame.size.height    //当前视图高度
static CGFloat const yearMonthH = 30;   //年月高度
static CGFloat const weeksH = 24;       //周高度
@interface AGHomeCalendarView()<UIScrollViewDelegate>
@property (nonatomic, strong) UILabel *yearMonthL;      //年月label
@property (nonatomic, strong) UIScrollView *scrollV;    //scrollview
@property (nonatomic, strong) NSDate *currentDate;      //当前月份
@property (nonatomic, strong) NSDate *selectDate;       //选中日期
@property (nonatomic, strong) NSDate *tmpCurrentDate;   //记录上下滑动日期

@property (nonatomic, strong) AGWeekView *leftView;    //左侧日历
@property (nonatomic, strong) AGWeekView *middleView;  //中间日历
@property (nonatomic, strong) AGWeekView *rightView;   //右侧日历

@property (nonatomic, strong) NSMutableArray * weeks;//所有周view
@property (nonatomic,strong) AGAppearance * appearance;//状态设置

@end
@implementation AGHomeCalendarView
- (instancetype)initWithFrame:(CGRect)frame date:(NSDate *)date appearance:(AGAppearance *)appearance{
    if (self = [super initWithFrame:frame]) {
        _appearance = appearance;
        _selectDate = _tmpCurrentDate = date;
        self.weeks = [NSMutableArray array];
        _currentDate = [[AGDateHelpObject shared] getLastdayOfTheWeek:date];
        [self settingViews];
    }
    return self;
}

- (void)dealloc
{
    [_scrollV removeObserver:self forKeyPath:@"contentOffset"];
}

- (void)settingViews {
    [self settingHeadLabel];
    [self settingScrollView];
    [self addObserver];
}

- (void)settingHeadLabel {
    _yearMonthL = [UILabel new];
    _yearMonthL.text = [[AGDateHelpObject shared] getStrFromDateFormat:@"yyyy-MM" Date:_currentDate];
    _yearMonthL.textColor = self.appearance.yearMonthColor;
    _yearMonthL.textAlignment = NSTextAlignmentCenter;
    _yearMonthL.font = self.appearance.yearFont;
    _yearMonthL.layer.borderColor = self.appearance.yerarLayerColor.CGColor;
    _yearMonthL.layer.borderWidth = self.appearance.yearLayerWidth;
    [self addSubview:_yearMonthL];
    [_yearMonthL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.width.mas_equalTo(110);
        make.height.mas_equalTo(yearMonthH);
    }];
    _yearMonthL.layer.cornerRadius = yearMonthH / 2;
    
    NSArray *weekdays = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    CGFloat weekdayW = ViewW/7;
    for (int i = 0; i < 7; i++) {
        UILabel *weekL = [[UILabel alloc] initWithFrame:CGRectMake(i*weekdayW, yearMonthH, weekdayW, weeksH)];
        weekL.textAlignment = NSTextAlignmentCenter;
        weekL.font = self.appearance.weekFont;
        weekL.textColor = self.appearance.weekColor;
        if (self.appearance.weekSunColor != nil) {
            if (i==0 || i==6) {
                weekL.textColor = self.appearance.weekSunColor;
            }
        }
        weekL.text = weekdays[i];
        [self addSubview:weekL];
        [self.weeks addObject:weekL];
    }
}

- (void)settingScrollView {
    _scrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, yearMonthH + weeksH, ViewW, ViewH - yearMonthH - weeksH)];
    _scrollV.contentSize = CGSizeMake(ViewW * 3, 0);
    _scrollV.pagingEnabled = YES;
    _scrollV.scrollEnabled = _appearance.isScrollDate;
    _scrollV.showsHorizontalScrollIndicator = NO;
    _scrollV.showsVerticalScrollIndicator = NO;
    _scrollV.delegate = self;
    [self addSubview:_scrollV];
    
    __weak typeof(self) weakSelf = self;
    CGFloat height = 6 * dayCellH;
    _leftView = [[AGWeekView alloc] initWithFrame:CGRectMake(0, 0, ViewW, height) date:[[AGDateHelpObject shared]getEarlyOrLaterDate:_currentDate LeadTime:-7 Type:2]];
    _leftView.selectDate = _selectDate;
    
    _middleView = [[AGWeekView alloc] initWithFrame:CGRectMake(ViewW, 0, ViewW, height) date:_currentDate];
    _middleView.selectDate = _selectDate;
    _middleView.sendSelectDate = ^(NSDate *selDate) {
        weakSelf.selectDate = selDate;
        if (weakSelf.sendSelectDate) {
            weakSelf.sendSelectDate([[AGDateHelpObject shared] getStrFromDateFormat:@"yyyy-MM-dd" Date:selDate]);
        }
        [weakSelf setData];
    };
    
    _rightView = [[AGWeekView alloc] initWithFrame:CGRectMake(ViewW * 2, 0, ViewW, height) date:[[AGDateHelpObject shared]getEarlyOrLaterDate:_currentDate LeadTime:7 Type:2]];
    _rightView.selectDate = _selectDate;
    
    [_scrollV addSubview:_leftView];
    [_scrollV addSubview:_middleView];
    [_scrollV addSubview:_rightView];
    _leftView.appearance = _middleView.appearance = _rightView.appearance = self.appearance;
    
    [self scrollToCenter];
}

- (void)setData {
    _middleView.currentDate = _currentDate;
    _middleView.selectDate = _selectDate;
    _leftView.currentDate = [[AGDateHelpObject shared] getEarlyOrLaterDate:_currentDate LeadTime:-7 Type:2];
    _leftView.selectDate = _selectDate;
    _rightView.currentDate = [[AGDateHelpObject shared] getEarlyOrLaterDate:_currentDate LeadTime:7 Type:2];
    _rightView.selectDate = _selectDate;
}

//MARK: - kvo
- (void)addObserver {
    [_scrollV addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"contentOffset"]) {
        [self monitorScroll];
    }
}

- (void)monitorScroll {
    
    if (_scrollV.contentOffset.x > 2*ViewW -1) {
        //下周
        _middleView.currentDate = [[AGDateHelpObject shared] getEarlyOrLaterDate:_currentDate LeadTime:7 Type:2];
        _middleView.selectDate = _selectDate;
        _leftView.currentDate = _currentDate;
        _leftView.selectDate = _selectDate;
        _currentDate = [[AGDateHelpObject shared] getEarlyOrLaterDate:_currentDate LeadTime:7 Type:2];
        _tmpCurrentDate = _currentDate.copy;
        _rightView.currentDate = [[AGDateHelpObject shared] getEarlyOrLaterDate:_currentDate LeadTime:7 Type:2];
        _rightView.selectDate = _selectDate;
        _yearMonthL.text = [[AGDateHelpObject shared] getStrFromDateFormat:@"yyyy-MM" Date:_currentDate];
        [self scrollToCenter];
        
    } else if (_scrollV.contentOffset.x < 1) {
        //上周
        _middleView.currentDate = [[AGDateHelpObject shared] getEarlyOrLaterDate:_currentDate LeadTime:-7 Type:2];
        _middleView.selectDate = _selectDate;
        _rightView.currentDate = _currentDate;
        _rightView.selectDate = _selectDate;
        _currentDate = [[AGDateHelpObject shared] getEarlyOrLaterDate:_currentDate LeadTime:-7 Type:2];
        _tmpCurrentDate = _currentDate.copy;
        _leftView.currentDate = [[AGDateHelpObject shared] getEarlyOrLaterDate:_currentDate LeadTime:-7 Type:2];
        _leftView.selectDate = _selectDate;
        _yearMonthL.text = [[AGDateHelpObject shared] getStrFromDateFormat:@"yyyy-MM" Date:_currentDate];
        [self scrollToCenter];
    }
    _leftView.isReload = _middleView.isReload = _rightView.isReload = YES;
}

//MARK: - scrollViewMethod
- (void)scrollToCenter {
    _scrollV.contentOffset = CGPointMake(ViewW, 0);
    //可以在这边进行网络请求获取事件日期数组等,记得取消上个未完成的网络请求
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        NSString *dateStr = [NSString stringWithFormat:@"%@-%d",[[AGDateHelpObject shared] getStrFromDateFormat:@"MM" Date:_currentDate],1 + arc4random()%28];
        [array addObject:dateStr];
    }
    _middleView.eventArray = array;
}
@end

@implementation AGAppearance
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isScrollDate = YES;
        self.weekColor = [UIColor colorWithString:@"#3A4C69"];
        self.weekSunColor = [UIColor colorWithString:@"#B0B5C0"];
        self.yearMonthColor = [UIColor colorWithString:@"#3A4C69"];
        self.yearFont = [UIFont systemFontOfSize:16];
        self.yerarLayerColor = [UIColor clearColor];
        self.yearLayerWidth = 0;
        self.itemTextColor = [UIColor colorWithString:@"#3A4C69"];
        self.itemTextSelectColor = [UIColor whiteColor];
        self.itemSelectColor = [UIColor colorWithString:@"#FC9A02"];
        self.itemTextFont = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
        self.ItemSunTextColor = [UIColor colorWithString:@"#B0B5C0"];
        self.weekFont = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
    }
    return self;
}
@end
