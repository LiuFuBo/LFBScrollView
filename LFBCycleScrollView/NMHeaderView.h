//
//  NMHeaderView.h
//  CollectionView实现滚动视图
//
//  Created by 刘富波 on 17/2/15.
//  Copyright © 2017年 mac1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NMHeaderModel.h"


@interface NMHeaderView : UIView

@property (nonatomic, copy) NSArray<NMHeaderModel *> *dataSource;

-(void)p_clickScrollViewImageWithBlock:(void (^)(NSString *clickUrl))clickUrl;

@end
