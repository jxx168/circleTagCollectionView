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
    AGHomeCalendarView * calendar = [[AGHomeCalendarView alloc] initWithFrame:CGRectMake(0, 100, SCREENWIDTH, 300) date:[NSDate date] appearance:[AGAppearance new]];
    calendar.sendSelectDate = ^(NSString * _Nonnull dateStr) {
        NSLog(@"%@",dateStr);
    };
    [self.view addSubview:calendar];
}
@end
