//
//  ViewController.m
//  CollectionView实现滚动视图
//
//  Created by 刘富波 on 17/2/14.
//  Copyright © 2017年 mac1. All rights reserved.
//

#import "ViewController.h"
#import "NMHeaderView.h"
#import "NMWebViewController.h"
#import "NMHeaderModel.h"
#import "Masonry.h"

@interface ViewController ()
@property (nonatomic, strong) NMHeaderView *scrollHeaderView;
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
    [_scrollHeaderView p_clickScrollViewImageWithBlock:^(NSString *clickUrl) {
        if (clickUrl) {
            NMWebViewController *webVc = [NMWebViewController new];
            webVc.urlString = clickUrl;
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
        make.edges.insets(UIEdgeInsetsZero);
    }];
}

-(void)initData{

    NSMutableArray<NMHeaderModel *> *dataSource = [NSMutableArray array];
    
    {
        NMHeaderModel *model = [NMHeaderModel new];
        model.imageUrl = @"http://car0.autoimg.cn/upload/spec/9579/u_20120110174805627264.jpg";
        model.clickUrl = @"http://www.baidu.com";
        model.image = [UIImage imageNamed:@"first.png"];
        [dataSource addObject:model];
    }
    
    {

        NMHeaderModel *model = [NMHeaderModel new];
        model.imageUrl = @"http://hiphotos.baidu.com/lvpics/pic/item/3a86813d1fa41768bba16746.jpg";
        model.clickUrl = @"http://www.baidu.com";
        model.image = [UIImage imageNamed:@"mid.png"];
        [dataSource addObject:model];
    }

    {
        
        NMHeaderModel *model = [NMHeaderModel new];
        model.imageUrl = @"http://hiphotos.baidu.com/lvpics/pic/item/3a86813d1fa41768bba16746.jpg";
        model.clickUrl = @"http://www.baidu.com";
        model.image = [UIImage imageNamed:@"last.png"];
        [dataSource addObject:model];
    }
    _scrollHeaderView.dataSource = dataSource.mutableCopy;
}

-(NMHeaderView *)scrollHeaderView{

    if (!_scrollHeaderView) {
        _scrollHeaderView = [NMHeaderView new];
    }
    return _scrollHeaderView;
}


@end
