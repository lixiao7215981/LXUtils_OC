Pod::Spec.new do |s|
  s.name         = "LXUtils_OC"
  s.version      = "1.0.0"
  s.summary      = "This is my(lixiao) LXUtils_OC"
  s.homepage     = "https://github.com/lixiao7215981"
  s.license      = "MIT"
  s.platform     = :ios,'8.0'
  s.requires_arc = true
  s.author       = { "SuperlX" => "1019661666@qq.com" }
  s.social_media_url   = "http://weibo.com/2106002880/profile?topnav=1&wvr=6"
  s.source       = { :git => "https://github.com/lixiao7215981/LXUtils_OC.git", :tag => s.version }

  s.source_files  = "LXUtils_OC/LXUtils_OC/Classes/**/*.{h,m}"
 #s.resources = "LXFrameWork_OC/LXFrameWork_OC/LXFrameWork/source/**/LXFrameWork.bundle"

  #s.subspec 'Other' do |other|
    #other.source_files = 'LXFrameWork_OC/LXFrameWork_OC/LXFrameWork/Class/Other/**/*.{h,m}'
    #other.exclude_files = '' 排除的文件
  #end

  #s.subspec 'Tool' do |tool|
    #tool.source_files = 'LXFrameWork_OC/LXFrameWork_OC/LXFrameWork/Class/Tool/**/*.{h,m}'
    #tool.exclude_files = '' 排除的文件
  #end

  #s.subspec 'Category' do |category|
    #category.source_files = 'LXFrameWork_OC/LXFrameWork_OC/LXFrameWork/Class/Category/*.{h,m}'
    #category.exclude_files = '' 排除的文件
  #end

  #s.subspec 'Model' do |model|
    #model.source_files = 'LXFrameWork_OC/LXFrameWork_OC/LXFrameWork/Class/Model/**/*.{h,m}'
    #model.exclude_files = '' 排除的文件
  #end

  #s.subspec 'View' do |view|
    #view.source_files = 'LXFrameWork_OC/LXFrameWork_OC/LXFrameWork/Class/View/**/*.{h,m}'
    #view.exclude_files = '' 排除的文件
  #end

  #s.subspec 'BaseController' do |bc|
    #bc.source_files = 'LXFrameWork_OC/LXFrameWork_OC/LXFrameWork/Class/BaseController/*.{h,m}'
    #bc.exclude_files = '' 排除的文件
  #end

  #s.subspec 'Controller' do |controller|
    #controller.source_files = 'LXFrameWork_OC/LXFrameWork_OC/LXFrameWork/Class/Controller/**/*.{h,m}'
    #controller.exclude_files = '' 排除的文件
  #end

  s.dependency 'AFNetworking'
  #s.ios.deployment_target = "6.0"
  #s.osx.deployment_target = "10.8"
end
