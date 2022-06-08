//
//  AppDelegate.m
//  AutoTrackDemo
//
//  Created by k w on 2022/1/19.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import <UMCommonLog/UMCommonLogHeaders.h>
#import <UMCommon/UMConfigure.h>
#import <UMCommon/MobClick.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [UMConfigure setLogEnabled:YES];
    [MobClick setAutoPageEnabled:YES];
    [MobClick setAutoEventEnabled:YES];
    [UMConfigure setCustomDomain:@"您的域名" standbyDomain:nil];
    [UMConfigure initWithAppkey:@"您的appkey" channel:@"App Store"];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[MainViewController alloc]init];
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(nonnull NSURL *)url options:(nonnull NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    [UMConfigure initUrl:url];
    if ([MobClick handleUrl:url]) {
        return YES;
    }

    return YES;
}

-(BOOL)application:(UIApplication*)application continueUserActivity:(nonnull NSUserActivity*)userActivity restorationHandler:(nonnull void(^)(NSArray<id<UIUserActivityRestoring>>*_Nullable))restorationHandler
{

   return YES;
}


//URL Scheme回调，iOS9以下，走这个方法
 -(BOOL)application:(UIApplication*)application openURL:(nonnull NSURL *)url sourceApplication:(nullable NSString*)sourceApplication annotation:(nonnull id)annotation
{
    [UMConfigure initUrl:url];

  return YES;
}


@end
