//
//  NMWebViewController.h
//  CollectionView实现滚动视图
//
//  Created by 刘富波 on 17/2/15.
//  Copyright © 2017年 mac1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NMWebViewController : UIViewController<UIWebViewDelegate>

@property (nonatomic,copy) NSString *urlString;

@end
