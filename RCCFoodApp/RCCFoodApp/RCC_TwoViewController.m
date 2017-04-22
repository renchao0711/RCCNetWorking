//
//  RCC_TwoViewController.m
//  RCCFoodApp
//
//  Created by 任超 on 17/4/19.
//  Copyright © 2017年 任超. All rights reserved.
//

#import "RCC_TwoViewController.h"

@interface RCC_TwoViewController ()
{
    UIImageView *img;
}
@end

@implementation RCC_TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    img = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:img];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    static int i = 2;
    NSString *name = [NSString stringWithFormat:@"%d",i];
    img.image = [UIImage imageNamed:name];
    i++;
    if (i>3) {
        i=1;
    }
    
    CATransition *animation = [CATransition animation];
    animation.type = @"fade";
    [img.layer addAnimation:animation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
