//
//  AGWechatShare.h
//  RunTime
//
//  Created by yq on 2020/6/28.
//  Copyright © 2020 wonders. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WXApi.h>
NS_ASSUME_NONNULL_BEGIN
// 分享类型枚举
typedef NS_ENUM(NSInteger, WechatShareType) {
    WechatShareTypeFriends,  // 好友
    WechatShareTypeTimeline,  // 朋友圈
};

// 分享后返回码枚举
typedef NS_ENUM(int, WechatShareStatusCode){
    WechatShareSuccess     = 0, // 分享成功
    WechatShareCancleShare = 1,// 取消分享
    WechatShareFailed      = 2   // 分享失败
};

@interface AGWechatShare : NSObject

+ (id)shareInstance;

+ (BOOL)handleOpenUrl:(NSURL *)url;

+ (void)hangleWechatShareWith:(SendMessageToWXReq *)req;
@end

NS_ASSUME_NONNULL_END
