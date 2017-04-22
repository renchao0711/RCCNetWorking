//
//  RCC_oneCell.m
//  RCCFoodApp
//
//  Created by 任超 on 17/4/19.
//  Copyright © 2017年 任超. All rights reserved.
//

#import "RCC_oneCell.h"
#import "UIImageView+WebCache.h"

@implementation RCC_oneCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
-(void)setRccModel:(RCC_OneModel *)model{
    //[self.imageView sd_setImageWithURL:nil];
    self.cityName.text = model.high;
    self.temperature.text = model.low;
}

@end
