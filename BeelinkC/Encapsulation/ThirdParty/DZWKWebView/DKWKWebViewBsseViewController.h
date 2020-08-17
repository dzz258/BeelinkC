//
//  DKWKWebViewBsseViewController.h
//  BiYongBao
//
//  Created by Gavin on 2018/8/5.
//  Copyright © 2018年 Ai. All rights reserved.
//

//#import <UIKit/UIKit.h>
#import "DKBaseViewController.h"
#import "UIViewController+BarButton.h"
#import <WebKit/WebKit.h>
#import "NSObject+DKWKWebViewModel.h"

@interface DKWKWebViewBsseViewController : DKBaseViewController <WKNavigationDelegate,WKScriptMessageHandler,WKUIDelegate,UIScrollViewDelegate>//UIViewController <WKNavigationDelegate,WKScriptMessageHandler,WKUIDelegate,UIScrollViewDelegate>
@property (nonatomic, strong) WKWebViewConfiguration *wkConfig;
@property (nonatomic, strong) WKWebView *wkWebView;
@property (nonatomic, strong) UIProgressView *progressView;//进度条

@property (nonatomic, assign) BOOL isHideWeb;//是否隐藏webV 默认不隐藏
@property(nonatomic, assign) BOOL isHideClose;//是否隐藏关闭按钮

@property(nonatomic, copy) NSString *assignTitle;//指定标题 此值赋值后 标题将不再自动获取H5title
@property(nonatomic, copy) NSString *urlPath;//页面请求地址 优先级 高
@property(nonatomic, copy) NSString *localFile;//加载本地文件 优先级 中
@property(nonatomic, copy) NSString *richText;//加载富文本 优先级 低
@property(nonatomic, copy) NSString *localFileType;//本地文件类型 与 localFile 同时使用 默认 html
@property(nonatomic, assign) NSInteger urlType;//暂时不用后期可做添加
@property(nonatomic, strong) NSDictionary *dict;//附加参数 暂不使用
@property(nonatomic, assign) NSInteger helperClassType;//辅助类类型 暂不使用

-(void)wk_close;
/**
 H5与原生JS 交互传值方法，建议在子类实现该方法

 @param dict H5传过来的值
 */
-(void)jsByValResponse:(NSDictionary *)dict;
@end

@interface WeakScriptMessageDelegate : NSObject<WKScriptMessageHandler>

@property (nonatomic, weak) id<WKScriptMessageHandler> scriptDelegate;

- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate;

@end
