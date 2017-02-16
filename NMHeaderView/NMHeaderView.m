//
//  NMHeaderView.m
//  CollectionView实现滚动视图
//
//  Created by 刘富波 on 17/2/15.
//  Copyright © 2017年 mac1. All rights reserved.
//

#import "NMHeaderView.h"
#import "NMCycleScrollView.h"
#import "Masonry.h"

@interface NMHeaderView ()<NMCycleScrollViewDelegate>

@property (nonatomic, strong) NMCycleScrollView *cycleScrollView;

@end

@implementation NMHeaderView{
    void(^_clickScrollViewBlock)();
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

-(void)p_clickScrollViewImageWithBlock:(void (^)(NSString *))clickUrl{
    _clickScrollViewBlock = [clickUrl copy];
}

#pragma mark - NMCycleScrollViewDelegate

-(void)cycleScrollView:(NMCycleScrollView *)cycleScrollView selectedAtIndex:(NSUInteger)currentIndex{
    NMHeaderModel *model = self.dataSource[currentIndex];
    _clickScrollViewBlock(model.clickUrl);
}

#pragma mark - getter & setter

-(void)setDataSource:(NSArray<NMHeaderModel *> *)dataSource{
    _dataSource = dataSource.copy;
    NSMutableArray<NMCycleScrollViewModel *> *models = [NSMutableArray array];
   [dataSource enumerateObjectsUsingBlock:^(NMHeaderModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       NMCycleScrollViewModel *model = [NMCycleScrollViewModel new];
       model.urlString = obj.imageUrl;
       model.image = obj.image;
       [models addObject:model];
   }];
    self.cycleScrollView.dataSources = models.copy;
}

-(NMCycleScrollView *)cycleScrollView{

    if (!_cycleScrollView) {
        _cycleScrollView = [[NMCycleScrollView alloc]init];
        _cycleScrollView.delegate = self;
    }
    return _cycleScrollView;
}














@end
