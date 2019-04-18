//
//  NMCycleScrollViewModel.h
//  CollectionView实现滚动视图
//
//  Created by 刘富波 on 17/2/14.
//  Copyright © 2017年 mac1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class UIImage;
@interface LFBCycleScrollViewModel : NSObject<NSCopying,NSMutableCopying>

//图片id 作为有参数的跳转Id
@property (nonatomic, copy) NSString *id;

/**
 默认显示在scrollView上的图片
 */
@property (nonatomic, strong) UIImage *image;


/**
 显示在scrollView上的图片
 */
@property (nonatomic, copy) NSString *urlString;




@end
