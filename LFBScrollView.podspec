
Pod::Spec.new do |s|

  s.name         = "LFBScrollView"  #名字
  s.version      = "1.0.0" #版本号
  s.summary      = "这是用于滚动视图播放的框架" #简介
  s.description = <<-DESC
  A framework about the rolling of the page.
 DESC


  s.homepage     = "https://github.com/LiuFuBo1991"
  #这里要填写可以访问的地址，不然验证通不过
  s.license      = "MIT" #开源协议
  #作者信息
  s.author             = { "liufubo" => "18380438251@163.com" } 
  s.social_media_url   = "http://www.jianshu.com/u/7d935e492eec"
  #多媒体介绍地址
  s.platform     = :ios, "8.0" #支持平台及版本
  s.source       = { :git => "https://github.com/LiuFuBo1991/LFBScrollView.git", :tag =>"1.0.0"}
  #项目地址，这里不支持ssh的地址，验证不通过，只支持HTTP和HTTPS，最好使用HTTPS
  s.source_files  = "LFBScrollView/**/*" #代码源文件地址，**/*表示Classes目录及其子目录下所有文件，如果有多个目录下文件则用逗号分开，如果需要在项目中分组显示，这里也要做相应的设置
  #公开头文件
  s.public_header_files = 'LFBScrollView/**/*.h'   
  s.requires_arc = true #项目中是否使用 ARC
  #依赖第三方
  s.dependency "Masonry", "~> 1.0.2" 
  s.dependency "SDWebImage", "~> 4.0.0-beta2"

end
