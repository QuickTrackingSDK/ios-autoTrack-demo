//
//  FirstViewController.m
//  AutoTrackDemo
//
//  Created by k w on 2022/1/19.
//

#import "FirstViewController.h"
#import "tableViewController.h"
#import "collectionViewController.h"
#import "otherViewController.h"
#import <UMCommon/UMAutoTrack.h>
#import <UMCommon/MobClick.h>
@implementation FirstViewController
- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    self.title=@"demo";
    CGRect mainScreenRC = [UIScreen mainScreen].bounds;

    UIButton* tableButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    tableButton.backgroundColor = [UIColor lightGrayColor];
    tableButton.frame = CGRectMake(50, 100, mainScreenRC.size.width-100, 40);
    [tableButton setTitle:@"table View" forState:(UIControlStateNormal)];
    [tableButton addTarget:self action:@selector(tableButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
  //  tableButton.UMAnalyticsIgnoreView=YES;
    [self.view addSubview:tableButton];
    
    UIButton* collectionButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    collectionButton.backgroundColor = [UIColor lightGrayColor];
    collectionButton.frame = CGRectMake(50, 200, mainScreenRC.size.width-100, 40);
    [collectionButton setTitle:@"collection" forState:(UIControlStateNormal)];
    [collectionButton addTarget:self action:@selector(collectionButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:collectionButton];

    
    UIButton* otherButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    otherButton.backgroundColor = [UIColor lightGrayColor];
    otherButton.frame = CGRectMake(50, 300, mainScreenRC.size.width-100, 40);
    
   // otherButton.UMAnalyticsEventCode=@"otherEventCode";
   // otherButton.UMAnalyticsViewProperties=@{@"key1":@"val1"};
   // otherButton.UMAnalyticsIgnoreView=YES;
    [otherButton setTitle:@"other" forState:UIControlStateNormal];
    [otherButton addTarget:self action:@selector(otherButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:otherButton];
}

-(void)tableButtonClick{
    tableViewController *vc = [[tableViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)collectionButtonClick{
    collectionViewController *vc = [[collectionViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)otherButtonClick{

    otherViewController *vc = [[otherViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

//-(NSDictionary *)getUMPageProperties
//{
//    return @{@"key1":@"val1",@"key2":@"val2"};
//}
//
//- (NSString *)getUMScreenUrl {
//    return @"um//um/page";
//}
//
//-(NSString *)getUMPageName
//{
//    return @"testpagename";
//}



@end
