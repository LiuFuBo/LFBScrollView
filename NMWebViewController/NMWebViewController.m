//
//  NMWebViewController.m
//  CollectionView实现滚动视图
//
//  Created by 刘富波 on 17/2/15.
//  Copyright © 2017年 mac1. All rights reserved.
//

#import "NMWebViewController.h"
#import "Masonry.h"

@interface NMWebViewController ()

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UIView *progressView;


@end

@implementation NMWebViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [self.view addSubview:self.progressView];
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(64);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(3);
    }];

}

#pragma mark - webView delegate

-(void)webViewDidStartLoad:(UIWebView *)webView{

    self.progressView.hidden = NO;
    self.progressView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0, 1);
    [UIView animateWithDuration:1 animations:^{
        self.progressView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.8, 1);
    }];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{

    [UIView animateWithDuration:1 animations:^{
        self.progressView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
    } completion:^(BOOL finished) {
        self.progressView.hidden = YES;
    }];
}

#pragma mark getters and setters

- (void)setUrlString:(NSString *)urlString {
    _urlString = [urlString copy];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]]];
}

- (UIWebView *)webView {
    if (_webView == nil) {
        _webView          = [[UIWebView alloc] init];
        _webView.scalesPageToFit = YES;
        _webView.delegate = self;
    }
    return _webView;
}

- (UIView *)progressView {
    if (_progressView == nil) {
        _progressView                 = [UIView new];
        _progressView.hidden          = YES;
        _progressView.backgroundColor = [UIColor colorWithRed:35/255.0f green:172/255.0f blue:183/255.0f alpha:1];
    }
    return _progressView;
}
@end
