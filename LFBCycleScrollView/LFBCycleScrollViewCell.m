//
//  NMCycleScrollViewCell.m
//  CollectionView实现滚动视图
//
//  Created by 刘富波 on 17/2/14.
//  Copyright © 2017年 mac1. All rights reserved.
//

#import "LFBCycleScrollViewCell.h"
#import "Masonry.h"


@implementation LFBCycleScrollViewCell

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

- (void)setAutoFullScreen:(BOOL)autoFullScreen{
    _autoFullScreen = autoFullScreen;
    if (autoFullScreen) {
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsZero);
        }];
    }else{
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftMargin);
            make.bottom.mas_equalTo(-self.bottomMargin);
            make.top.mas_equalTo(self.topMargin);
            make.right.mas_equalTo(-self.rightMargin);
        }];
    }
}


-(void)layoutSubviews{
    [super layoutSubviews];
}

- (UIImageView *)imageView{
    return _imageView?:({
        _imageView = [[UIImageView alloc]init];
        _imageView;
    });
}


@end
