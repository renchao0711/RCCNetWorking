//
//  RCC_oneCell.h
//  RCCFoodApp
//
//  Created by 任超 on 17/4/19.
//  Copyright © 2017年 任超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCC_OneModel.h"

@interface RCC_oneCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cityName;
@property (weak, nonatomic) IBOutlet UILabel *temperature;

@property (strong,nonatomic) RCC_OneModel *RccModel;

-(void)setRccModel:(RCC_OneModel *)model;

@end
