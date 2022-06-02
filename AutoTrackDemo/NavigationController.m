//
//  NavigationController.m
//  AutoTrackDemo
//
//  Created by k w on 2022/1/19.
//

#import "NavigationController.h"

@implementation NavigationController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.shadowImage = [[UIImage alloc]init];
    [self.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    
    //配置导航栏颜色
    self.navigationBar.backgroundColor = self.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationBar.translucent = NO;
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];}


@end
