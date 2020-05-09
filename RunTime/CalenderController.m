//
//  CalenderController.m
//  RunTime
//
//  Created by qt on 2020/3/26.
//  Copyright © 2020 wonders. All rights reserved.
//

#import "CalenderController.h"
#import "AGHomeCalendarView.h"
#define SCREENWIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREENHEIGHT  [[UIScreen mainScreen] bounds].size.height
@interface CalenderController ()

@end

@implementation CalenderController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    AGHomeCalendarView * calendar = [[AGHomeCalendarView alloc] initWithFrame:CGRectMake(0, 100, SCREENWIDTH, [AGHomeCalendarView getMonthTotalHeight:[NSDate date] type:CalendarType_Month]) date:[NSDate date] appearance:[AGAppearance new] type:CalendarType_Month];
    __weak AGHomeCalendarView * weakCalendar = calendar;
    calendar.refreshH = ^(CGFloat viewH) {
        [UIView animateWithDuration:0.3 animations:^{
            weakCalendar.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, viewH);
        }];
        
    };
    calendar.sendSelectDate = ^(NSString * _Nonnull dateStr) {
        NSLog(@"%@",dateStr);
    };
    [self.view addSubview:calendar];
}
@end
