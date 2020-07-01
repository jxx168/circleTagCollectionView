//
//  AGWechatShare.m
//  RunTime
//
//  Created by yq on 2020/6/28.
//  Copyright © 2020 wonders. All rights reserved.
//

#import "AGWechatShare.h"

@implementation AGWechatShare
+ (id)shareInstance {
    static AGWechatShare *weChatShareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        weChatShareInstance = [[AGWechatShare alloc] init];
    });
    return weChatShareInstance;
}

+ (BOOL)handleOpenUrl:(NSURL *)url {
    return [WXApi handleOpenURL:url delegate:[AGWechatShare shareInstance]];
}

+ (void)hangleWechatShareWith:(SendMessageToWXReq *)req {
    

    [WXApi sendReq:req completion:^(BOOL success) {
        //
    }];
}

#pragma mark - 微信分享回调

- (void)onResp:(BaseResp *)resp {
    if ([resp isKindOfClass:[SendMessageToWXResp class]]) {
        /*
         enum  WXErrCode {
         WXSuccess           = 0,    < 成功
         WXErrCodeCommon     = -1,  < 普通错误类型
         WXErrCodeUserCancel = -2,   < 用户点击取消并返回
         WXErrCodeSentFail   = -3,   < 发送失败
         WXErrCodeAuthDeny   = -4,   < 授权失败
         WXErrCodeUnsupport  = -5,   < 微信不支持
         };
         */
        SendMessageToWXResp *response = (SendMessageToWXResp *)resp;
        switch (response.errCode) {
            case WXSuccess: {
                NSLog(@"微信分享成功");
                break;
            }
            case WXErrCodeCommon: {
                NSLog(@"微信分享异常");
                break;
            }
            case WXErrCodeUserCancel: {
                NSLog(@"微信分享取消");
                break;
            }
            case WXErrCodeSentFail: {
                NSLog(@"微信分享失败");
                break;
            }
            case WXErrCodeAuthDeny: {
                NSLog(@"微信分享授权失败");
                break;
            }
            case WXErrCodeUnsupport: {
                NSLog(@"微信分享版本暂不支持");
                break;
            }
            default: {
                break;
            }
        }
    }
}
@end
