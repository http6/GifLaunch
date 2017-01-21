//
//  GifView.h
//  GifLaunch
//
//  Created by hubin on 17/1/20.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

/// 启动时加载Gif图片

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GifView : NSObject

/// 加载动态启动图
- (void)loadGifWithName:(NSString *)name inView:(UIView *)superView;

/// 手动移除
- (void)remove;

/// 加载完成的回调
@property (copy, nonatomic) void (^finishedBlock)();

@end
