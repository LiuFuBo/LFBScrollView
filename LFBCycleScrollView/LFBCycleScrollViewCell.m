//
//  NMCycleScrollViewCell.m
//  CollectionView实现滚动视图
//
//  Created by 刘富波 on 17/2/14.
//  Copyright © 2017年 mac1. All rights reserved.
//

#import "LFBCycleScrollViewCell.h"

@implementation LFBCycleScrollViewCell

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imageView = [UIImageView new]];
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
}



@end
