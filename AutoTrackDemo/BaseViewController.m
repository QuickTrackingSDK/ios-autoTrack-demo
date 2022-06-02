//
//  BaseViewController.m
//  AutoTrackDemo
//
//  Created by k w on 2022/1/19.
//

#import "BaseViewController.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseViewController

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}
//设置视图滑动手势
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    // rootViewController要关闭返回手势，否则有BUG
    if (self.navigationController.viewControllers.firstObject == self) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }else{
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //被色
    self.view.backgroundColor = [UIColor whiteColor];
    
    //状态栏文本颜色白色
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    //避免滚动视图顶部出现状态栏高度的空白以及push或者pop的时候页面有一个上移或者下移的异常动画的问题
    UITableView.appearance.estimatedRowHeight = 0;
    UITableView.appearance.estimatedSectionFooterHeight = 0;
    UITableView.appearance.estimatedSectionHeaderHeight = 0;
    if (@available(iOS 11.0, *)){
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    //滑动手势代理
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

@end
