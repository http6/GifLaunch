//
//  GifVC.m
//  GifLaunch
//
//  Created by cnmobi on 17/1/21.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

#import "GifVC.h"

@interface GifVC ()
{
    UIWebView *webView;
}

@end

@implementation GifVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor clearColor];
}

/// 加载动态启动图
- (void)loadGifWithName:(NSString *)name
{
    CGSize size = [[UIScreen mainScreen] bounds].size;
    
#pragma clang diagnostic ignored "-Wnonnull"
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"gif"];
    NSData *gifData = [NSData dataWithContentsOfFile:path];
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    [webView loadData:gifData MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    webView.scalesPageToFit = YES;
    webView.backgroundColor = [UIColor clearColor];
    webView.opaque = NO;
    [self.view addSubview:webView];
    
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
