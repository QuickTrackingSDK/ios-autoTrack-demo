//
//  UMAutoTrack.h
//  UMMobClick
//
//  Created by k w on 2021/12/30.
//  Copyright © 2021 UMeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UMCommon/UIView+UMAutoTrack.h>

NS_ASSUME_NONNULL_BEGIN

@interface UMAutoTrack : NSObject

/// AutoTrack 时，是否忽略该 View
@property (nonatomic, assign) BOOL UMAnalyticsIgnoreView;

/// AutoTrack 时，View 的扩展属性
@property (nonatomic, strong) NSDictionary* UMAnalyticsViewProperties;


/**
 * @abstract
 * 忽略某一页面的点击
 *
 * @param PageObject 对应容器
 */
+(void)ignorePageView:(id)PageObject;

/**
 * @abstract
 * 忽略某一类型的点击
 *
 * @param aClass View 对应的 Class
 */
+(void)ignoreViewType:(Class)aclass;
@end

NS_ASSUME_NONNULL_END
