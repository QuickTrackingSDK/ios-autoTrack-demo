//
//  tableViewController.m
//  UMVisualDemo
//
//  Created by wangkai on 2019/12/16.
//  Copyright © 2019 wangkai. All rights reserved.
//
#define     TABLE_WIDTH      [UIScreen mainScreen].bounds.size.width
#define     TABLE_HEIGHT     [UIScreen mainScreen].bounds.size.height
#import "tableViewController.h"

@interface tableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong, nullable) NSArray *digitalArr;
@property (nonatomic, strong, nullable) NSArray *letterArr;

@end

@implementation tableViewController

- (void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];


}


- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"pageA";
    // 装载数据源
    self.digitalArr = @[@"0", @"1", @"2",@"3",@"4",@"5",@"7",@"8",@"9",@"10",@"11",@"12",@"13"];
    self.letterArr  = @[@"A", @"B", @"C",@"D", @"E", @"F",@"G", @"H", @"I"];
    // 添加tableView到self.view
    [self.view addSubview:self.tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDelegate

// cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
}


// Header高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 30;
}


// Footer高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 30;
}


// 选中了某个cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
    NSLog(@"cell--%@",indexPath);
}


#pragma mark - UITableViewDataSource

// Section数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}


// 对应Section中cell的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (section) {
            case 0:     // 数字组
            return self.digitalArr.count;
            break;
            
            case 1:     // 字母组
            return self.letterArr.count;
            break;
            
        default:
            break;
    }
    
    return 0;
}


// Header标题
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    switch (section) {
            
            case 0:     // 数字组
            return @"数字组头";
            break;
            
            case 1:     // 字母组
            return @"字母组头";
            break;
            
        default:
            break;
    }
    
    return nil;
}


// Footer标题
- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    switch (section) {
            
            case 0:     // 数字组
            return @"数字组尾";
            break;
            
            case 1:     // 字母组
            return @"字母组尾";
            break;
            
        default:
            break;
    }
    
    return nil;
}


// cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 实例化一个UITableViewCell
    UITableViewCell *cell = nil;
    // 由于已经注册过重用cell,所以这里不必判断是否存在
    
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
          

        }
    
    // 设置cell相关属性
    switch (indexPath.section) {
            
            case 0:     // 数字组
            if (indexPath.row < self.digitalArr.count) {
                cell.textLabel.text = self.digitalArr[indexPath.row];
                
            }
            
          
            break;
            
            case 1:     // 字母组
            if (indexPath.row < self.letterArr.count) {
                cell.textLabel.text = self.letterArr[indexPath.row];

            }
            break;
            
        default:
            break;
    }
    
    // 返回cell
    return cell;
}


#pragma mark - 懒加载

- (UITableView *)tableView {
    
    if (_tableView == nil) {
        // 实例化一个UITableView
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, TABLE_WIDTH, TABLE_HEIGHT)
                                                  style:UITableViewStylePlain];
        // 注册一个cell
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"myCell"];
        // 设置代理
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    
    return _tableView;
}




@end

