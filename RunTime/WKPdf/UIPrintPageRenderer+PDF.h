//
//  UIPrintPageRenderer+PDF.h
//  RunTime
//
//  Created by yq on 2020/7/1.
//  Copyright © 2020 wonders. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIPrintPageRenderer (PDF)
- (NSData*) printToPDF;
@end

NS_ASSUME_NONNULL_END
