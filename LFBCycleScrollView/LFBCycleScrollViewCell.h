//
//  NMCycleScrollViewCell.h
//  CollectionView实现滚动视图
//
//  Created by 刘富波 on 17/2/14.
//  Copyright © 2017年 mac1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFBCycleScrollViewCell : UICollectionViewCell
//imageView
@property (nonatomic, strong) UIImageView *imageView;
 //是否满屏展示,默认为YES,  当不满屏时，设置边距有效
@property (nonatomic, assign) BOOL autoFullScreen;
 //左间距
@property (nonatomic, assign) CGFloat leftMargin;
 //上边距
@property (nonatomic, assign) CGFloat topMargin;
 //右边距
@property (nonatomic, assign) CGFloat rightMargin;
 //下边距
@property (nonatomic, assign) CGFloat bottomMargin;





@end
