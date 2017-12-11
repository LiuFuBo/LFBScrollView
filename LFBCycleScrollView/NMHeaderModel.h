//
//  NMHeaderModel.h
//  CollectionView实现滚动视图
//
//  Created by 刘富波 on 17/2/15.
//  Copyright © 2017年 mac1. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;
@interface NMHeaderModel : NSObject
//图片url
@property (nonatomic, copy) NSString *imageUrl;
//点击滚动图片展示网页地址
@property (nonatomic, copy) NSString *clickUrl;
//默认滚动图片
@property (nonatomic, strong) UIImage *image;



@end
