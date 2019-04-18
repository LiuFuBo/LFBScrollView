//
//  LFBHeaderView.h
//  CollectionView实现滚动视图
//
//  Created by 刘富波 on 17/2/15.
//  Copyright © 2017年 mac1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFBHeaderModel.h"


@interface LFBHeaderView : UIView

/**
 banner图片填充模式
 */
@property (nonatomic, assign) UIViewContentMode imageContentModel;
/**
 是否自动滚动 default is YES
 */
@property (nonatomic, assign, getter=isAutoScroll) BOOL autoScroll;
/**
 分页未选中指示器颜色 default is lightGrayColor
 */
@property (nonatomic, strong) UIColor *pageIndicatorTintColor;
/**
 图片圆角,当圆角大于零则生效
 */
@property (nonatomic, assign) CGFloat imageConeradius;
/**
 是否满屏展示,默认为YES,  当不满屏时，设置边距有效
 */
@property (nonatomic, assign) BOOL autoFullScreen;
/**
 左间距
 */
@property (nonatomic, assign) CGFloat leftMargin;
/**
 上边距
 */
@property (nonatomic, assign) CGFloat topMargin;
/**
 右边距
 */
@property (nonatomic, assign) CGFloat rightMargin;
/**
 下边距
 */
@property (nonatomic, assign) CGFloat bottomMargin;
/**
 分页选中指示器颜色 default is cyanColor
 */
@property (nonatomic, strong) UIColor *currentPageIndicatorTintColor;
/**
 banner图片数据源
 */
@property (nonatomic, copy) NSArray<LFBHeaderModel *> *dataSource;
/**
 点击图片事件
 */
-(void)p_clickScrollViewImageWithBlock:(void (^)(LFBHeaderModel *clickItem))clickItem;

@end
