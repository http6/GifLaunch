//
//  GifView.m
//  GifLaunch
//
//  Created by hubin on 17/1/20.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

#import "GifView.h"

@implementation GifView
{
    UIWebView *webView;
}

/// 加载动态启动图
- (void)loadGifWithName:(NSString *)name inView:(UIView *)superView
{
    CGSize size = [[UIScreen mainScreen] bounds].size;
    
#pragma clang diagnostic ignored "-Wnonnull"
    NSString *path = [[NSBundle mainBundle] pathForResource:@"X-circle" ofType:@"gif"];
    NSData *gifData = [NSData dataWithContentsOfFile:path];
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    [webView loadData:gifData MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    webView.scalesPageToFit = YES;
    webView.backgroundColor = [UIColor clearColor];
    webView.opaque = NO;
    [superView addSubview:webView];
    
    /// 移除Gif的加载
    [self performSelector:@selector(removeGif) withObject:nil afterDelay:3.8];
    
    /// 完成后回调
    [self performSelector:@selector(finished) withObject:nil afterDelay:4.0];
}

/// 手动移除
- (void)remove
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(removeGif) object:nil];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(finished) object:nil];
    
    [self removeGif];
    [self finished];
}

/// 移除Gif的加载
- (void)removeGif
{
    [UIView animateWithDuration:0.3 animations:^{
        [webView setAlpha:0];
    } completion:^(BOOL finished) {
        [webView removeFromSuperview];
    }];
}

/// 完成后回调
- (void)finished
{
    if (_finishedBlock)
    {
        _finishedBlock();
    }
}



@end
