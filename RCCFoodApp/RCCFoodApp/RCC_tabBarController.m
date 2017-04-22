//
//  RCC_tabBarController.m
//  RCCFoodApp
//
//  Created by 任超 on 17/4/19.
//  Copyright © 2017年 任超. All rights reserved.
//

#import "RCC_tabBarController.h"
#import "RCC_OneTableViewController.h"
#import "RCC_TwoViewController.h"
#import "RCC_ThreeViewController.h"
#import "RCC_navigationController.h"

@interface RCC_tabBarController ()

@end

@implementation RCC_tabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpAllChildVC];
}

-(void)setUpAllChildVC{
    RCC_OneTableViewController *oneVC = [[RCC_OneTableViewController alloc]init];
    [self setUpAVC:oneVC image:nil title:@"One"];
    
    RCC_TwoViewController *twoVC = [[RCC_TwoViewController alloc]init];
    [self setUpAVC:twoVC image:nil title:@"Two"];
    
    RCC_ThreeViewController *threeVC = [[RCC_ThreeViewController alloc]init];
    [self setUpAVC:threeVC image:nil title:@"Three"];
    
}

-(void)setUpAVC:(UIViewController *)viewController image:(UIImage*)image title:(NSString *)title{
    RCC_navigationController *nav = [[RCC_navigationController alloc]initWithRootViewController:viewController];
    nav.title = title;
    nav.tabBarItem.image = image;
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
    viewController.navigationItem.title = title;
    [self addChildViewController:nav];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
