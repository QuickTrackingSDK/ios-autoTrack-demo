//
//  otherViewController.m
//  UMVisualDemo
//
//  Created by wangkai on 2019/12/16.
//  Copyright © 2019 wangkai. All rights reserved.
//

#import "otherViewController.h"
#import "TestViewController.h"
@interface otherViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)UISegmentedControl *segmentedControl;
@property(nonatomic,strong)UISlider *slider;

@end
@implementation otherViewController
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

    self.title=@"pageC";


    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(30, 40, 100, 40)];
    [button setBackgroundColor:[UIColor colorWithRed:141/255.0 green:166/255.0 blue:196/255.0 alpha:1.0]];
    [button.layer setCornerRadius:5.0];
    [button setTitle:@"button" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    [self.view addSubview:button];
    
    
    UIPageControl *pc = [[UIPageControl alloc] initWithFrame:CGRectMake(20,100,300,50)];
    pc.backgroundColor = [UIColor grayColor];
    pc.numberOfPages = 3;
    [pc addTarget:self action:@selector(pageValue) forControlEvents:UIControlEventValueChanged];

    pc.userInteractionEnabled = YES;
    pc.currentPageIndicatorTintColor = [UIColor redColor];//当前图的颜色
    pc.tag=5;
    pc.pageIndicatorTintColor = [UIColor greenColor];
    [self.view addSubview:pc];
    
    UISwitch *pushSwitch = [[UISwitch alloc] init];
     //位置的x,y可以改，但是按钮宽、高不可以改，就算设置了也没效果
    pushSwitch.frame = CGRectMake(100, 150, 80, 40);
    [pushSwitch addTarget:self action:@selector(switchChange) forControlEvents:UIControlEventValueChanged];

    [self.view addSubview:pushSwitch];
    
    UIStepper  *stepper = [[UIStepper  alloc] init];
    stepper.minimumValue  = 2;
    stepper.maximumValue  = 5;
    stepper.stepValue  = 2;
    stepper.value  = 3;
    stepper.tag=3;
    stepper.center  = CGPointMake(100, 300);
    [stepper addTarget:self  action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:stepper];
    
    
    
    UIImage *image = [UIImage imageNamed:@"img.png"];
    //图片的显示是需要载体的；需要放在UIImageView；
    UIImageView *imgView = [[UIImageView alloc]init];
    //图片显示在屏幕上的大小是由载体控制的；
    //现在把载体的大小设置成图片的大小，使用图片的大小设置UIImageView的长宽；
    imgView.frame = CGRectMake(200, 260, 150, 150);
    imgView.backgroundColor = [UIColor yellowColor];
    [imgView setImage:image];
    imgView.tag=7;
    imgView.userInteractionEnabled=YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapHandle)];
//    tap.numberOfTouchesRequired = 2;
    [imgView addGestureRecognizer:tap];
    [self.view addSubview:imgView];
    
    UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandle1)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 400, 100, 100)];
        // 2. 将点击事件添加到label上
    label.backgroundColor=[UIColor redColor];
        [label addGestureRecognizer:labelTapGestureRecognizer];
        label.userInteractionEnabled = YES; // 可以理解为设置label可被点击
    label.text=@"label";
    [self.view addSubview:label];
 
    
    [self.view addSubview:[self segmentedControl]];
    [self.view addSubview:self.slider];

    _slider.frame=CGRectMake(20,200, 300, 50);
    
    //minimunmValue 当值可以改变时，滑动为最小。默认为0.0
    
    _slider.minimumValue=0.0;
    
    //maximumValue 当值可以改变时，滑动为最大。默认为1.0
    
    _slider.maximumValue=100;
    
    //当前值为多少
    
    _slider.value=20;
    
    //设置为yes，在拖动滑块的时候，滑动的值会改变。默认值为yes
    
    [_slider setContinuous:YES];
    
    //设置最小处的图片。 默认为空
    
    _slider.minimumValueImage=[UIImage imageNamed:@""];
    
    //设置最大处的图片。 默认为空
    
    _slider.maximumValueImage=[UIImage imageNamed:@""];
    
    //小于当前滑动的颜色
    
    _slider.minimumTrackTintColor=[UIColor blueColor];
    
    //大于当前滑动的颜色
    
    _slider.maximumTrackTintColor=[UIColor redColor];
    
    //当前滑动值的颜色
    
    _slider.thumbTintColor=[UIColor blueColor];
    
    //添加事件
    
    [_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];

}

-(void)pageValue{
    NSLog(@"page");
}

- (UISegmentedControl *)segmentedControl{
    if (_segmentedControl==nil) {
        _segmentedControl=[[UISegmentedControl alloc]initWithItems:@[@"最新",@"最热",@"经典"]];
        _segmentedControl.tintColor=[UIColor redColor];
        _segmentedControl.selectedSegmentIndex=0;
        _segmentedControl.tag=4;
        _segmentedControl.frame= CGRectMake(180, 30, 150, 50);
        [_segmentedControl addTarget:self action:@selector(changeIndex) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentedControl;
}
-(void)changeIndex{
    
}
-(void)valueChanged{
    NSLog(@"1111");
}

-(void)tapHandle1
{
    NSLog(@"label click");
}

-(void)tapHandle
{
    NSLog(@"image click");
}


-(void)segmentSelect:(UISegmentedControl*)seg
{
}
-(void)buttonClick
{
    
    TestViewController *vc=[[TestViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    

}
-(void)switchChange:(id)sender{
}
-(void)sliderValueChanged:(UISlider *)slider
{
    NSLog(@"slider value%f",slider.value);
}

- (UISlider *)slider{
    
    if (_slider==nil) {
        
        _slider=[[UISlider alloc]init];
        
    }
    
    return _slider;
    
}

-(void)switchChange{
    NSLog(@"11");
}
@end
