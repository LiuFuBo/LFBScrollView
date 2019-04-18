LFBScrollView
=============
[![License MIT](https://img.shields.io/github/license/mashape/apistatus.svg?maxAge=2592000)](https://github.com/LiuFuBo1991/LFBSocialSDK)&nbsp;
![Cocoapods](https://img.shields.io/badge/pod-v2.0.0-greenLFBModleFile.svg)&nbsp;
![Cocoapods](https://img.shields.io/badge/platform-osx%20%7C%20ios-LFBModelFile.svg)&nbsp;

LFBScrollView一款简单易容的Banner滚动框架

## LFBScrollView 提供了哪些功能？


- [x] 支持本地图片和网络图片滚动两种数据填充模式
- [x] 支持设置图片圆角功能
- [x] 支持设置图片填充模式功能
- [x] 支持设置滚动视图上下左右间隙距离，默认是全屏，如需要设置间隙可设置autoFullScreen为NO,再设置间隙
- [x] 支持配置指示器颜色
- [x] 支持配置自动滚动功能


## 安装 

### Cocoapods

1、直接通过Podfile文件中加入下面一行代码来使用LFBScrollView

pod 'LFBScrollView'

### 手动导入

1、下载LFBScrollView DEMO内LFBCycleScrollView文件夹内文件，拷贝或者拖入你的工程中


### 基本使用


1、导入头文件
<pre><code>
#import "LFBCycleScrollView.h"
#import "LFBCycleScrollViewModel.h"
</code></pre>

2、初始化LFBCycleScrollView对象
<pre><code>

@property (nonatomic, strong) LFBCycleScrollView *cycleScrollView;


- (LFBCycleScrollView *)cycleScrollView{
   return _cycleScrollView?:({
        _cycleScrollView = [[LFBCycleScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 240)];
        _cycleScrollView.delegate = self;
        _cycleScrollView;
    });
}

</code></pre>


3、设置 NMCycleScrollViewDelegate代理


4、配置滚动图片资源

<pre><code>

- (void)viewDidLoad {
  [super viewDidLoad];

  [self.view addSubview:self.cycleScrollView];
  NSMutableArray<LFBCycleScrollViewModel *> *dataSource = [NSMutableArray array];
  {
      LFBCycleScrollViewModel *model = [LFBCycleScrollViewModel new];
        model.urlString = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1555560633714&di=0c5f9b0985aea877fc6df6f8f5354a9b&imgtype=0&src=http%3A%2F%2Fpic.qiantucdn.com%2F58pic%2F25%2F56%2F29%2F58396c9c1a3a4_1024.jpg";
        model.image = [UIImage imageNamed:@"first.png"];
        [dataSource addObject:model];
  }
    
    {
        
        LFBCycleScrollViewModel *model = [LFBCycleScrollViewModel new];
        model.urlString = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1555560685661&di=97c79deb059d4573342902f3a3bbca98&imgtype=0&src=http%3A%2F%2Fimg15.3lian.com%2F2015%2Fa1%2F13%2Fd%2F6.jpg";
        model.image = [UIImage imageNamed:@"mid.png"];
        [dataSource addObject:model];
    }
    
    {
        
        LFBCycleScrollViewModel *model = [LFBCycleScrollViewModel new];
        model.urlString = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1555560705802&di=c642e2c84b6b04e5d7d178e4858b7a85&imgtype=0&src=http%3A%2F%2Fwww.hubei.gov.cn%2Fmlhb%2Flyms%2Fxyjq%2F201205%2FW020120531559128275377.jpg";
        model.image = [UIImage imageNamed:@"last.png"];
        [dataSource addObject:model];
    }
    self.cycleScrollView.dataSources = dataSource;

 }

</code></pre>


5、实现代理方法

<pre><code>

//视图被点击的时候回调
- (void)cycleScrollView:(LFBCycleScrollView *)cycleScrollView selectedAtIndex:(NSUInteger)currentIndex;

// 视图当前滚动的回调
-(void)cycleScrollView:(LFBCycleScrollView *)cycleScrollView cellAtIndex:(NSUInteger)currentIndex;

// 视图滚动结束之后的回调
-(void)cycleScrollView:(LFBCycleScrollView *)cycleScrollView endScrollAtCurrentIndex:(NSUInteger)currentIndex isAuto:(BOOL)isAuto;

</code></pre>

下载DEMO可更快上手

注:目前推荐用户在该框架基础上做二次封装来满足项目需要，目前框架传入数据model，仅包含图片链接地址，默认本地图片，以及扩展图片id，大多数时候用户点击滚动Banner，需要的是跳转指定页面并且传参，而这个参数是根据请求返回的，您可以在仿照该框架DEMO，再次封装，内部进行model对接，方便使用。当然，你也可以通过LFBScrollView的代理方法点击事件根据index下标来处理相关业务。


