//
//  UIView+UMAutoTrack.h
//  UMMobClick
//
//  Created by k w on 2021/12/29.
//  Copyright © 2021 UMeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (UMAutoTrack)

/// AutoTrack 时，是否忽略该 View
@property (nonatomic, assign) BOOL UMAnalyticsIgnoreView;

/// AutoTrack 时，View 的扩展属性
@property (nonatomic, strong) NSDictionary* UMAnalyticsViewProperties;

/// AutoTrack 时，设置eventCode
@property (nonatomic, strong) NSString* UMAnalyticsEventCode;


@end

NS_ASSUME_NONNULL_END
