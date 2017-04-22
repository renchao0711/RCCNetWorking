//
//  RCC_navigationController.m
//  RCCFoodApp
//
//  Created by 任超 on 17/4/19.
//  Copyright © 2017年 任超. All rights reserved.
//

#import "RCC_navigationController.h"

@interface RCC_navigationController ()

@end

@implementation RCC_navigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) {
        //自动显示和隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
