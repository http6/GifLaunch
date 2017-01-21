//
//  AppDelegate.m
//  GifLaunch
//
//  Created by hubin on 17/1/20.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

#import "AppDelegate.h"
#import "GifVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    
/*
 1、把LaunchScreen里的View的背景设置成黑色（当然，实际情况根据自己的需求来设置）
 2、为了保证效果，didFinishLaunchingWithOptions里只运行一个方法
 3、加载完Gif，再去处理其它业务
 iOS-加载gif的四种方式： http://www.jianshu.com/p/da89d102f3a0  有兴趣可以深入学习
*/
    
    /// 启动时加载Gif图片
    __weak AppDelegate *weakself = self;
    GifVC *vc = [[GifVC alloc] init];
    [vc loadGifWithName:@"X-circle"];
    
    vc.finishedBlock = ^(){
        [weakself loadGifFinished];
    };
    
    self.window.rootViewController = vc;
    
    return YES;
}

/// 加载Gif完成后的回调
- (void)loadGifFinished
{
    /// Do something
    self.window.backgroundColor = [UIColor whiteColor];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
