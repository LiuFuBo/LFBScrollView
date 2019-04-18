//
//  LFBHeaderView.m
//  CollectionView实现滚动视图
//
//  Created by 刘富波 on 17/2/15.
//  Copyright © 2017年 mac1. All rights reserved.
//

#import "LFBHeaderView.h"
#import "LFBCycleScrollView.h"
#import "Masonry.h"

@interface LFBHeaderView ()<NMCycleScrollViewDelegate>

@property (nonatomic, strong) LFBCycleScrollView *cycleScrollView;

@end

@implementation LFBHeaderView{
    void(^_clickScrollViewBlock)(LFBHeaderModel  *item);
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.cycleScrollView];
        [self.cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsZero);
        }];
    }
    return self;
}

-(void)p_clickScrollViewImageWithBlock:(void (^)(LFBHeaderModel *))clickItem{
    _clickScrollViewBlock = [clickItem copy];
}

#pragma mark - NMCycleScrollViewDelegate

-(void)cycleScrollView:(LFBCycleScrollView *)cycleScrollView selectedAtIndex:(NSUInteger)currentIndex{
    LFBHeaderModel *model = self.dataSource[currentIndex];
    _clickScrollViewBlock(model);
}

#pragma mark - getter & setter

-(void)setDataSource:(NSArray<LFBHeaderModel *> *)dataSource{
    _dataSource = dataSource.copy;
    NSMutableArray<LFBCycleScrollViewModel *> *models = [NSMutableArray array];
   [dataSource enumerateObjectsUsingBlock:^(LFBHeaderModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       LFBCycleScrollViewModel *model = [LFBCycleScrollViewModel new];
       model.urlString = obj.imageUrl;
       model.image = obj.image;
       [models addObject:model];
   }];
    self.cycleScrollView.dataSources = models.copy;
}

- (void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor{
    _pageIndicatorTintColor = pageIndicatorTintColor;
    [self.cycleScrollView setPageIndicatorTintColor:pageIndicatorTintColor];
}

- (void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor{
    _currentPageIndicatorTintColor = currentPageIndicatorTintColor;
    [self.cycleScrollView setCurrentPageIndicatorTintColor:currentPageIndicatorTintColor];
}

- (void)setImageContentModel:(UIViewContentMode)imageContentModel{
    _imageContentModel = imageContentModel;
    [self.cycleScrollView setContentModeForImage:imageContentModel];
}

- (void)setAutoScroll:(BOOL)autoScroll{
    _autoScroll = autoScroll;
    [self.cycleScrollView setAutoScroll:autoScroll];
}

- (void)setImageConeradius:(CGFloat)imageConeradius{
    _imageConeradius = imageConeradius;
    [self.cycleScrollView setImageConeradius:imageConeradius];
}

- (void)setAutoFullScreen:(BOOL)autoFullScreen{
    _autoFullScreen = autoFullScreen;
    [self.cycleScrollView setAutoFullScreen:autoFullScreen];
}

- (void)setLeftMargin:(CGFloat)leftMargin{
    _leftMargin = leftMargin;
    [self.cycleScrollView setLeftMargin:leftMargin];
}

- (void)setTopMargin:(CGFloat)topMargin{
    _topMargin = topMargin;
    [self.cycleScrollView setTopMargin:topMargin];
}

- (void)setRightMargin:(CGFloat)rightMargin{
    _rightMargin = rightMargin;
    [self.cycleScrollView setRightMargin:rightMargin];
}

- (void)setBottomMargin:(CGFloat)bottomMargin{
    _bottomMargin = bottomMargin;
    [self.cycleScrollView setBottomMargin:bottomMargin];
}

-(LFBCycleScrollView *)cycleScrollView{

    if (!_cycleScrollView) {
        _cycleScrollView = [[LFBCycleScrollView alloc]init];
        _cycleScrollView.delegate = self;
    }
    return _cycleScrollView;
}














@end
