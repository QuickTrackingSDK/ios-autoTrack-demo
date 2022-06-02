//
//  MainViewController.m
//  AutoTrackDemo
//
//  Created by k w on 2022/1/19.
//

#import "MainViewController.h"
#import "NavigationController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
@implementation MainViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [UITabBar appearance].translucent = NO;//不透明
    // 去掉tab黑色分割线
    self.tabBar.barStyle = UIBarStyleBlack;
    self.tabBar.shadowImage = [[UIImage alloc]init];
    
    FirstViewController *firstVc=[[FirstViewController alloc]init];
    SecondViewController *secondVc=[[SecondViewController alloc]init];

    NavigationController *nav1 = [[NavigationController alloc] initWithRootViewController:firstVc];
    NavigationController *nav2 = [[NavigationController alloc] initWithRootViewController:secondVc];

    [self addChildVC:nav1 title:@"vc1" image:@"" selectedImage:@""];
    [self addChildVC:nav2 title:@"vc2" image:@"" selectedImage:@""];
}

-(void)addChildVC:(UIViewController *)childVC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    childVC.tabBarItem.title = title;
    childVC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self selectedTapTabBarItems:childVC.tabBarItem];
    [self unSelectedTapTabBarItems:childVC.tabBarItem];
    [self addChildViewController:childVC];
}
//tab字体颜色
-(void)selectedTapTabBarItems:(UITabBarItem *)tabBarItem{
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:13],NSFontAttributeName,[UIColor orangeColor],NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
}
-(void)unSelectedTapTabBarItems:(UITabBarItem *)tabBarItem{
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:13], NSFontAttributeName,[UIColor whiteColor],NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
}
@end
