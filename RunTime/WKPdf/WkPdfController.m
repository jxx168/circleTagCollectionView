//
//  WkPdfController.m
//  RunTime
//
//  Created by yq on 2020/7/1.
//  Copyright © 2020 wonders. All rights reserved.
//

#import "WkPdfController.h"
#import <WebKit/WebKit.h>
#import "UIPrintPageRenderer+PDF.h"
@interface WkPdfController ()<WKNavigationDelegate>
@property (nonatomic,strong) WKWebView * web;
@end

@implementation WkPdfController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"wk转PDF";
    [self.view addSubview:self.web];
    [self.web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://github.com/iclems/iOS-htmltopdf"]]];
    
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    UIPrintPageRenderer *render = [[UIPrintPageRenderer alloc] init];
    [render addPrintFormatter:webView.viewPrintFormatter startingAtPageAtIndex:0];//关联对象
    NSUInteger contentHeight = webView.scrollView.contentSize.height;
    NSUInteger contentWidth = webView.scrollView.contentSize.width;
    CGSize contentSize = CGSizeMake(contentWidth, contentHeight);
    //  需要打印的frame
    CGRect printableRect = CGRectMake(0,
                                      0,
                                      contentSize.width,
                                      contentSize.height);
    // 纸张的规格
    CGRect paperRect = CGRectMake(0, 0, contentSize.width, contentSize.height);
    [render setValue:[NSValue valueWithCGRect:paperRect] forKey:@"paperRect"]; //因为是readonly属性，所以我们只能用KVC 进行赋值
    [render setValue:[NSValue valueWithCGRect:printableRect] forKey:@"printableRect"];
    NSData *pdfData = [render printToPDF];
    NSString *fileUrl = [NSString stringWithFormat:@"%@temp.pdf",NSTemporaryDirectory()];
    [pdfData writeToFile:fileUrl atomically: YES];
}

-(WKWebView *)web{
    if (!_web) {
        //创建网页配置对象
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        _web = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height) configuration:config];
        _web.navigationDelegate = self;
    }
    return _web;
}
@end
