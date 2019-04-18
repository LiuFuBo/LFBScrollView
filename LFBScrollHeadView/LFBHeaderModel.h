//
//  LFBHeaderModel.h
//  CollectionView实现滚动视图
//
//  Created by 刘富波 on 17/2/15.
//  Copyright © 2017年 mac1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class UIImage;
@interface LFBHeaderModel : NSObject
//图片id
@property (nonatomic, copy) NSString *id;
//图片url
@property (nonatomic, copy) NSString *imageUrl;
//点击滚动图片展示网页地址
@property (nonatomic, copy) NSString *clickUrl;
//默认滚动图片
@property (nonatomic, strong) UIImage *image;
//跳转类型 1:优惠券 2:服务详情 3:礼包详情
@property (nonatomic,  copy) NSNumber *jump_type;
// h5页面路径或者小程序路径
@property (nonatomic,  copy) NSString *page_input;



@end
