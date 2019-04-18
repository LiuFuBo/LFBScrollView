//
//  NMCycleScrollViewModel.m
//  CollectionView实现滚动视图
//
//  Created by 刘富波 on 17/2/14.
//  Copyright © 2017年 mac1. All rights reserved.
//

#import "LFBCycleScrollViewModel.h"

@implementation LFBCycleScrollViewModel

- (id)copyWithZone:(NSZone *)zone{
    LFBCycleScrollViewModel *model = [[LFBCycleScrollViewModel alloc]init];
    model.id = self.id;
    model.image = self.image;
    model.urlString = self.urlString;
    return model;
}

- (id)mutableCopyWithZone:(NSZone *)zone{
    LFBCycleScrollViewModel *model = [[LFBCycleScrollViewModel alloc]init];
    model.id = self.id;
    model.image = self.image;
    model.urlString = self.urlString;
    return model;
}

@end
