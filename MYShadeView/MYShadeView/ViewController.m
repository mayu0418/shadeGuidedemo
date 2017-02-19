//
//  ViewController.m
//  MYShadeView
//
//  Created by mayu on 2017/2/17.
//  Copyright © 2017年 MY. All rights reserved.
//

#import "ViewController.h"
#import "MYShadeView.h"

@interface ViewController ()

@property(nonatomic, weak) UIView *view2;
@property(nonatomic, weak) UIView *view1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(170, 70, 70, 70)];
    view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view];
    self.view1 = view;
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(170, 170, 70, 70)];
    view1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view1];
    self.view2 = view1;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(200, 300, 70, 70)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"遮罩" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(shadeAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}

-(void)shadeAction {
    MYShadeGuideModel *model = [MYShadeGuideModel new];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(70, 70, 70, 70)];
    label.text = @"yellowColor";
    label.backgroundColor = [UIColor grayColor];
    model.guideImageView = label;
    model.clearRect = [self.view1 convertRect:self.view1.bounds toView:nil];
    
    MYShadeGuideModel *model1 = [MYShadeGuideModel new];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(70, 170, 70, 70)];
    label1.text = @"greenColor";
    label1.backgroundColor = [UIColor grayColor];
    model1.guideImageView = label1;
    model1.clearRect = [self.view2 convertRect:self.view2.bounds toView:nil];
    
    MYShadeView *shadeView = [MYShadeView new];
    shadeView.shadeGuideModels = @[model,model1];
    shadeView.dismiss = ^{
        NSLog(@"关闭");
    };
    [shadeView shadeGuideShow];
    [self.view addSubview:shadeView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
