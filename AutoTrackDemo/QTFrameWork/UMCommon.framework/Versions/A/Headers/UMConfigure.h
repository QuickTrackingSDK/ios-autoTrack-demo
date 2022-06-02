//
//  UMConfigure.h
//  UMCommon
//
//  Created by San Zhang on 9/6/16.
//  Copyright © 2016 UMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UMConfigure : NSObject


/** 设置上报统计日志的主域名和备用域名。此函数必须在SDK初始化函数调用之前调用。
 
 @param primaryDomain 传日志的主域名收数地址,参数不能为null或者空串。例如：https://www.umeng.com
 @param standbyDomain 上传日志备用域名收数地址,参数可以为null或者空串，若此参数为空，SDK内部会自动将主域名设置为备用域名。
*/
+ (void)setCustomDomain:(NSString *)primaryDomain standbyDomain:(NSString *)standbyDomain;

/** 初始化友盟所有组件产品
 @param appKey 开发者在友盟官网申请的appkey.
 @param channel 渠道标识，可设置nil表示"App Store".
 */
+ (void)initWithAppkey:(NSString *)appKey channel:(NSString *)channel;

/** 自定义app版本号，默认获取version，只可设置一次建议在所有接口之前调用
 @param appVersion 自定义版本号
 */
+ (void)setAppVersion:(NSString *)appVersion;

/** 设置是否在console输出sdk的log信息.
 @param bFlag 默认NO(不输出log); 设置为YES, 输出可供调试参考的log信息. 发布产品时必须设置为NO.
 */
+ (void)setLogEnabled:(BOOL)bFlag;

/** 设置是否对日志信息进行加密, 默认NO(不加密).
 @param value 设置为YES, umeng SDK 会将日志信息做加密处理
 */
+ (void)setEncryptEnabled:(BOOL)value;

+ (NSString *)umidString;

/**
 集成测试需要device_id
 */
+ (NSString*)deviceIDForIntegration;

/** 是否开启统计，默认为YES(开启状态)
 @param value 设置为NO,可关闭友盟统计功能.
*/
+ (void)setAnalyticsEnabled:(BOOL)value;


/**
  是否hook系统方法，默认YES
  如果不让友盟hook系统方法，则需在初始化之前，调用该API设置为NO
*/
+ (void)isHook:(BOOL)bFlag;

//获取zid
+ (NSString *)getUmengZID;

+ (void)initUrl:(NSURL *)url;

+ (void)isHookUrl:(BOOL)bFlag;
+ (void)isHookEvent:(BOOL)bFlag;
+ (void)isHookPage:(BOOL)bFlag;

@end