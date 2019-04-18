//
//  NMCycleScrollView.h
//  CollectionView实现滚动视图
//
//  Created by 刘富波 on 17/2/14.
//  Copyright © 2017年 mac1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFBCycleScrollViewModel.h"

@class LFBCycleScrollView;
@protocol NMCycleScrollViewDelegate <NSObject>

@optional

/**
 视图滚动结束之后的回调

 @param cycleScrollView self
 @param currentIndex 当前索引，从0开始
 @param isAuto 是否为自动滚动，如果是定时器自动滑动的则为YES否则NO
 */
-(void)cycleScrollView:(LFBCycleScrollView *)cycleScrollView endScrollAtCurrentIndex:(NSUInteger)currentIndex isAuto:(BOOL)isAuto;

/**
 视图当前滚动的回调

 @param cycleScrollView self
 @param currentIndex 当前索引，从0开始
 */
-(void)cycleScrollView:(LFBCycleScrollView *)cycleScrollView cellAtIndex:(NSUInteger)currentIndex;


/**
 视图被点击的时候回调

 @param cycleScrollView self
 @param currentIndex 当前索引，从0开始
 */
-(void)cycleScrollView:(LFBCycleScrollView *)cycleScrollView selectedAtIndex:(NSUInteger)currentIndex;

@end

@class LFBCycleScrollViewModel;
@interface LFBCycleScrollView : UIView

/**
 数据源，配置配置scrollView显示内容
 */
@property (nonatomic, strong) NSArray<LFBCycleScrollViewModel *> *dataSources;

/**
 pageControl,页面控制器，如不需要设置hidden=YES
 */
@property (nonatomic, strong, readonly) UIPageControl *pageControl;

/**
 delegate,设置代理属性
 */
@property (nonatomic, weak) id<NMCycleScrollViewDelegate> delegate;

/**
 自动滚动时间，默认为3秒，如果autoScroll为NO,则定时器不会滚动，此属性就会失效，值保持不变
 */
@property (nonatomic, assign) NSTimeInterval timeInterval;

/**
 加载网络图片进行时的默认图片，如果此属性未设置，则会去查找NMCycleScrollViewModel的image属性作为加载时候的默认图片
 */
@property (nonatomic, strong) UIImage *placeholderImage;

/**
 是否自动滚动 default is YES
 */
@property (nonatomic, assign, getter=isAutoScroll) BOOL autoScroll;

/**
 ImageView.contentModel, default is UIViewContentModeScaleToFill
 */
@property (nonatomic, assign) UIViewContentMode contentModeForImage;

/**
 分页未选中指示器颜色 default is lightGrayColor
 */
@property (nonatomic, strong) UIColor *pageIndicatorTintColor;

/**
 分页选中指示器颜色 default is cyanColor
 */
@property (nonatomic, strong) UIColor *currentPageIndicatorTintColor;

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





@end
