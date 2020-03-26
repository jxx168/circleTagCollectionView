//
//  AGWeekView.m
//  RunTime
//
//  Created by qt on 2020/3/26.
//  Copyright © 2020 wonders. All rights reserved.
//

#import "AGWeekView.h"
#import "AGDateHelpObject.h"
#import <Masonry.h>
@class AGWeekCell;
@interface AGWeekView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionV;
@property (nonatomic, strong) NSIndexPath *selectIndex;
@end
@implementation AGWeekView
- (instancetype)initWithFrame:(CGRect)frame date:(NSDate *)date {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _currentDate = date;
        [self setCollectionView];
    }
    return self;
}

//MARK: - settingView
- (void)setCollectionView {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake((self.frame.size.width - 1) / 7, dayCellH);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _collectionV = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 6 * dayCellH) collectionViewLayout:layout];
    _collectionV.scrollEnabled = NO;
    _collectionV.delegate = self;
    _collectionV.dataSource = self;
    _collectionV.backgroundColor = [UIColor whiteColor];
    [self addSubview:_collectionV];
    [_collectionV registerClass:[AGWeekCell class] forCellWithReuseIdentifier:@"AGWeekCell"];
}

//MARK: - setMethod
- (void)setEventArray:(NSArray *)eventArray {
    _eventArray = eventArray;
    [_collectionV reloadData];
}

-(void)setIsReload:(BOOL)isReload{
    _isReload = isReload;
    [_collectionV reloadData];
}

//MARK: - dateMethod
//获取cell的日期 (日 -> 六   格式,如需修改星期排序只需修改该函数即可)
- (NSDate *)dateForCellAtIndexPath:(NSIndexPath *)indexPath {
    return [[AGDateHelpObject shared] getEarlyOrLaterDate:_currentDate LeadTime:indexPath.row - 6 Type:2];
}

//MARK: - collectionViewDatasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 7;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AGWeekCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AGWeekCell" forIndexPath:indexPath];
    NSDate *cellDate = [self dateForCellAtIndexPath:indexPath];
    cell.selectDate = _selectDate;
    cell.currentDate = _currentDate;
    [cell bindDate:cellDate appearance:self.appearance];
    return cell;
}

//MARK: - collectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    _selectIndex = indexPath;
    _selectDate = [self dateForCellAtIndexPath:indexPath];
    if (_sendSelectDate) {
        _sendSelectDate(_selectDate);
    }
    [collectionView reloadData];
}
@end

@implementation AGWeekCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUIViewS];
    }
    return self;
}


-(void)bindDate:(NSDate *)cellDate appearance:(AGAppearance *)appearance{
    self.appearance = appearance;
    self.cellDate = cellDate;
    self.labDay.font = appearance.itemTextFont;
    [self unSelect];
    if ([[AGDateHelpObject shared] isSameDate:cellDate AnotherDate:_selectDate]) {
        self.viewBG.backgroundColor = _appearance.itemSelectColor;
        self.selected = YES;
    }
    if ([[NSCalendar currentCalendar] isDateInToday:cellDate]) {
           self.labDay.text = @"今";
    } else{
        self.labDay.text = [[AGDateHelpObject shared] getStrFromDateFormat:@"d" Date:cellDate];
    }
}

-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (selected) {
        self.viewBG.backgroundColor = _appearance.itemSelectColor;
        self.labDay.textColor = _appearance.itemTextSelectColor;
    } else {
        [self unSelect];
    }
}

-(void)unSelect{
    self.viewBG.backgroundColor = [UIColor clearColor];
    self.labDay.textColor = _appearance.itemTextColor;
    if (_appearance.ItemSunTextColor != nil) {
        if ([[AGDateHelpObject shared] getNumberInWeek:_cellDate] == 1 || [[AGDateHelpObject shared] getNumberInWeek:_cellDate] == 7) {
            self.labDay.textColor = _appearance.ItemSunTextColor;
        }
    }
}

-(void)setUIViewS{
    UIView * viewBG = [UIView new];
    [self.contentView addSubview:viewBG];
    [viewBG mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.height.mas_equalTo(25);
    }];
    viewBG.layer.cornerRadius = 12.5;
    viewBG.layer.masksToBounds = YES;
    self.viewBG = viewBG;
    
    UILabel * labDay = [UILabel new];
    labDay.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:labDay];
    [labDay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    self.labDay = labDay;
}
@end
