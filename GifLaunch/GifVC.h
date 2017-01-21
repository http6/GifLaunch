//
//  GifVC.h
//  GifLaunch
//
//  Created by cnmobi on 17/1/21.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

/// 启动时加载Gif图片

#import <UIKit/UIKit.h>

@interface GifVC : UIViewController

/// 加载动态启动图
- (void)loadGifWithName:(NSString *)name;

/// 手动移除
- (void)remove;

/// 加载完成的回调
@property (copy, nonatomic) void (^finishedBlock)();

@end
