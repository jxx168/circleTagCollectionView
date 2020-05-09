//
//  AGWeekView.h
//  RunTime
//
//  Created by qt on 2020/3/26.
//  Copyright © 2020 wonders. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGHomeCalendarView.h"
@class AGAppearance;
NS_ASSUME_NONNULL_BEGIN
static CGFloat const dayCellH = 40;//日期cell高度
typedef void(^SendSelectDate)(NSDate *selDate);
@interface AGWeekView : UIView
@property (nonatomic, strong) NSDate * currentDate;          //当前月份
@property (nonatomic, strong) NSDate * selectDate;           //选中日期
@property (nonatomic, copy) SendSelectDate sendSelectDate;  //回传选中日期
@property (nonatomic, assign) CalendarType type;            //日历模式
@property (nonatomic, assign) BOOL isReload;  //刷新数据
@property (nonatomic, strong) NSArray * eventArray;          //事件数组
@property (nonatomic, strong) AGAppearance * appearance;
- (instancetype)initWithFrame:(CGRect)frame date:(NSDate *)date;
@end


@interface AGWeekCell : UICollectionViewCell
@property (nonatomic,strong) NSDate *selectDate;   //选择日期
@property (nonatomic,strong) NSDate *currentDate;  //当月日期
@property (nonatomic,strong) NSDate * cellDate;
@property (nonatomic,strong) UILabel * labDay;
@property (nonnull,strong) UIView * viewBG;
@property (nonatomic,strong) AGAppearance * appearance;
-(void)bindDate:(NSDate *)cellDate appearance:(AGAppearance *)appearance;
@end
NS_ASSUME_NONNULL_END
