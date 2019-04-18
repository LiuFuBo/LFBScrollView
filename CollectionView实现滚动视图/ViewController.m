//
//  ViewController.m
//  CollectionView实现滚动视图
//
//  Created by 刘富波 on 17/2/14.
//  Copyright © 2017年 mac1. All rights reserved.
//

#import "ViewController.h"
#import "LFBHeaderView.h"
#import "NMWebViewController.h"
#import "LFBHeaderModel.h"
#import "Masonry.h"

@interface ViewController ()
@property (nonatomic, strong) LFBHeaderView *scrollHeaderView;
@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initilizeAppeareces];
}

-(void)initilizeAppeareces{

    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self initSubViews];
    [self initLayout];
    [self initData];
    [_scrollHeaderView p_clickScrollViewImageWithBlock:^(LFBHeaderModel *clickItem) {
        if (clickItem.clickUrl) {
            NMWebViewController *webVc = [NMWebViewController new];
            webVc.urlString = clickItem.clickUrl;
            webVc.title = @"网页";
            [self nm_pushViewController:webVc animation:YES];
        }
    }];
}

-(void)nm_pushViewController:(UIViewController *)vc animation:(BOOL)animation{
    [self.navigationController pushViewController:vc animated:animation];
}

-(void)initSubViews{
    [self.view addSubview:self.scrollHeaderView];
}

-(void)initLayout{
    [self.scrollHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.height.mas_equalTo(240);
    }];
}

-(void)initData{

    NSMutableArray<LFBHeaderModel *> *dataSource = [NSMutableArray array];
    {
        LFBHeaderModel *model = [LFBHeaderModel new];
        model.imageUrl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1555560633714&di=0c5f9b0985aea877fc6df6f8f5354a9b&imgtype=0&src=http%3A%2F%2Fpic.qiantucdn.com%2F58pic%2F25%2F56%2F29%2F58396c9c1a3a4_1024.jpg";
        model.clickUrl = @"http://www.baidu.com";
        model.image = [UIImage imageNamed:@"first.png"];
        [dataSource addObject:model];
    }
    
    {

        LFBHeaderModel *model = [LFBHeaderModel new];
        model.imageUrl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1555560685661&di=97c79deb059d4573342902f3a3bbca98&imgtype=0&src=http%3A%2F%2Fimg15.3lian.com%2F2015%2Fa1%2F13%2Fd%2F6.jpg";
        model.clickUrl = @"http://www.baidu.com";
        model.image = [UIImage imageNamed:@"mid.png"];
        [dataSource addObject:model];
    }

    {
        
        LFBHeaderModel *model = [LFBHeaderModel new];
        model.imageUrl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1555560705802&di=c642e2c84b6b04e5d7d178e4858b7a85&imgtype=0&src=http%3A%2F%2Fwww.hubei.gov.cn%2Fmlhb%2Flyms%2Fxyjq%2F201205%2FW020120531559128275377.jpg";
        model.clickUrl = @"http://www.baidu.com";
        model.image = [UIImage imageNamed:@"last.png"];
        [dataSource addObject:model];
    }
    _scrollHeaderView.dataSource = dataSource.mutableCopy;
}

-(LFBHeaderView *)scrollHeaderView{

    if (!_scrollHeaderView) {
        _scrollHeaderView = [LFBHeaderView new];
    }
    return _scrollHeaderView;
}


@end
