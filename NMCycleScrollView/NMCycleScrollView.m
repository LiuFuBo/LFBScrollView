//
//  NMCycleScrollView.m
//  CollectionView实现滚动视图
//
//  Created by 刘富波 on 17/2/14.
//  Copyright © 2017年 mac1. All rights reserved.
//

#import "NMCycleScrollView.h"
#import "NMCycleScrollViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIView+WebCache.h"


#define _NMCycleScrollViewIsResponds(__obj,__selMethod)(__obj && [__obj respondsToSelector:__selMethod])

static NSString *const kNMCycleScrollViewCellID = @"kNMCycleScrollViewCellID";

@interface NMCycleScrollView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray<NMCycleScrollViewModel *> *showData;
@property (nonatomic, assign) NSInteger firstIndex;
@property (nonatomic, assign) NSInteger lastIndex;
@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation NMCycleScrollView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:[UIView new]];
        [self addSubview:self.collectionView];
        [self addSubview:self.pageControl];
        
        self.timeInterval = 3;
        self.autoScroll = YES;
        self.contentModeForImage = UIViewContentModeScaleToFill;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:[UIView new]];
        [self addSubview:self.collectionView];
        [self addSubview:self.pageControl];
        
        self.timeInterval = 3;
        self.autoScroll = YES;
        self.contentModeForImage = UIViewContentModeScaleToFill;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


-(void)drawRect:(CGRect)rect{

    if (self.dataSources.count == 0) {
        return;
    }
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];

}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.collectionView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    ((UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout).itemSize = CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    self.pageControl.frame = CGRectMake(0, CGRectGetHeight(self.frame) - 20, CGRectGetWidth(self.frame), 20);

}

#pragma mark - collectionView

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.showData.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    NMCycleScrollViewModel *model = self.showData[indexPath.row];
    NMCycleScrollViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kNMCycleScrollViewCellID forIndexPath:indexPath];
    cell.imageView.image = model.image;
    
    cell.imageView.contentMode = self.contentModeForImage;
   
    if (model.urlString) {
        [cell.imageView sd_setShowActivityIndicatorView:YES];
        [cell.imageView sd_setIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.urlString] placeholderImage:self.placeholderImage?:model.image];
    }
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    if (_NMCycleScrollViewIsResponds(self.delegate, @selector(cycleScrollView:selectedAtIndex:))) {
        [self.delegate cycleScrollView:self selectedAtIndex:self.currentIndex];
    }
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{

    self.collectionView.userInteractionEnabled = NO;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{

    if (self.timer) {
        dispatch_cancel(self.timer);
        self.timer = nil;
    }
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self p_reloadCollectionView:scrollView animation:YES];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self p_reloadCollectionView:scrollView animation:NO];
    if (self.timer == nil && self.isAutoScroll) {
        [self p_configureTimer];
    }
}

#pragma mark - private

-(void)p_initShowData{

    if (!_dataSources) {
        return;
    }
    if (_dataSources.count>1) {
        self.showData = [NSMutableArray arrayWithCapacity:3];
        
        self.firstIndex = _dataSources.count - 1;
        self.lastIndex = 1;
        
        //init data
        self.showData[0] = _dataSources[self.firstIndex];
        self.showData[1] = _dataSources.firstObject;
        self.showData[2] = _dataSources[self.lastIndex];
    }
    else{
        self.showData = [NSMutableArray arrayWithObject:_dataSources.firstObject];
    }
}

-(void)p_reloadCollectionView:(UIScrollView *)scrollView animation:(BOOL)animation{

    self.collectionView.userInteractionEnabled = YES;
    if (scrollView.contentOffset.x == 0) { //scroll to first view
        [self.showData exchangeObjectAtIndex:0 withObjectAtIndex:1];
        [self.showData exchangeObjectAtIndex:0 withObjectAtIndex:2];
        
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        [self.collectionView reloadData];
        
        if (self.firstIndex == 0) {
            self.firstIndex = self.dataSources.count - 1;
        }
        else{
            self.firstIndex -= 1;
        }
        
        self.lastIndex = self.firstIndex + 2;
        if (self.lastIndex == self.dataSources.count) {
            self.lastIndex = 0;
        }
        else if (self.lastIndex > self.dataSources.count){
            self.lastIndex = 1;
        }
    }
    else if (scrollView.contentOffset.x == self.frame.size.width * (self.showData.count - 1)){ //scroll to last view
    
        [self.showData exchangeObjectAtIndex:2 withObjectAtIndex:1];
        [self.showData exchangeObjectAtIndex:2 withObjectAtIndex:0];
        
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        [self.collectionView reloadData];
        
        self.lastIndex ++;
        if (self.lastIndex == self.dataSources.count) {
            self.lastIndex = 0;
        }
        else if (self.lastIndex > self.dataSources.count){
            self.lastIndex = 1;
        }
        
        self.firstIndex = self.lastIndex - 2;
        if (self.lastIndex == 1) {
            self.firstIndex = self.dataSources.count - 1;
        }
        else if (self.lastIndex == 0){
            self.firstIndex = self.dataSources.count - 2;
        }
    }
    
    self.currentIndex = self.firstIndex + 1;
    if (self.currentIndex == self.dataSources.count) {
        self.currentIndex = 0;
    }
    self.pageControl.currentPage = self.currentIndex;
    
    self.showData[0] = self.dataSources[self.firstIndex];
    self.showData[2] = self.dataSources[self.lastIndex];
    
    //call delegate
    if (_NMCycleScrollViewIsResponds(self.delegate, @selector(cycleScrollView:endScrollAtCurrentIndex:isAuto:))) {
        [self.delegate cycleScrollView:self endScrollAtCurrentIndex:self.currentIndex isAuto:animation];
    }
}

-(void)p_configureTimer{

    if (self.dataSources.count == 0) {
        return;
    }
  
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(self.timer, dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.timeInterval * NSEC_PER_SEC)), self.timeInterval * NSEC_PER_SEC, 0*NSEC_PER_SEC);
    __weak typeof(self) weak_self = self;
    dispatch_source_set_event_handler(self.timer, ^{
        __strong typeof(weak_self) strong_self = weak_self;
        strong_self.collectionView.userInteractionEnabled = NO;
        [strong_self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:2 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    });
    dispatch_resume(self.timer);
}

#pragma mark - gettter & setter

-(UICollectionView *)collectionView{
 
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumLineSpacing = CGFLOAT_MIN;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        
        [_collectionView registerClass:[NMCycleScrollViewCell class] forCellWithReuseIdentifier:kNMCycleScrollViewCellID];
    }
    return _collectionView;
}

-(UIPageControl *)pageControl{

    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor cyanColor];
    }
    return _pageControl;
}

-(void)setDataSources:(NSArray<NMCycleScrollViewModel *> *)dataSources{
    _dataSources = dataSources;
  
    if (dataSources.count == 0) {
        return;
    }
    
    [self p_initShowData];
    [self.collectionView reloadData];
    self.pageControl.numberOfPages = dataSources.count;
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    
    if (self.timer) {
        dispatch_cancel(self.timer);
        self.timer = nil;
    }
    
    [self p_configureTimer];
}

-(void)setTimeInterval:(NSTimeInterval)timeInterval{
    _timeInterval = timeInterval;

    if (self.isAutoScroll) {
        if (self.timer) {
            dispatch_cancel(self.timer);
            self.timer = nil;
        }
    }
    [self p_configureTimer];
}

-(void)setAutoScroll:(BOOL)autoScroll{
    _autoScroll = autoScroll;
  
    if (self.timer) {
        dispatch_cancel(self.timer);
        self.timer = nil;
    }
    
    if (autoScroll && self.timeInterval >0) {
        [self p_configureTimer];
    }

}








@end
