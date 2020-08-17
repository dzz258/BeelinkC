//
//  DKWKWebViewBsseViewController.m
//  BiYongBao
//
//  Created by Gavin on 2018/8/5.
//  Copyright © 2018年 Ai. All rights reserved.
//

#import "DKWKWebViewBsseViewController.h"

@interface DKWKWebViewBsseViewController ()

@end

@implementation DKWKWebViewBsseViewController

#pragma mark 移除观察者
- (void)dealloc{
    if (!self.isHideWeb) {
    [self.wkWebView removeObserver:self forKeyPath:@"estimatedProgress"];
    [self.wkWebView removeObserver:self forKeyPath:@"loading"];
//    [self.wkWebView removeObserver:self forKeyPath:@"canGoBack"];
    [self.wkWebView removeObserver:self forKeyPath:@"title"];
    self.wkWebView.UIDelegate = nil;
    self.wkWebView.navigationDelegate = nil;
    self.wkWebView.scrollView.delegate = nil;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = [NSString null_str:self.assignTitle];
    
    if (!self.isHideWeb) {
        if (!self.isHideClose) {
            [self addLeftBarButtonItemWithWebFirstAction:@selector(wk_back) secondAction:@selector(wk_close)];
//            [self addLeftBarButtonItemWithTitle:@"关闭" secondTitle:@"返回" firstAction:@selector(wk_back) secondAction:@selector(wk_close)];
        }else{
            [self addLeftBarButtonWithImage:KImage(@"nav_back") action:@selector(wk_close)];
//            [self addLeftBarButtonItemWithTitle:@"返回" action:@selector(wk_close)];
        }
        [self.view addSubview:self.wkWebView];
        
        self.urlPath = [self.urlPath stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        
        if (self.urlPath.length!=0) {
            NSURL *url = [NSURL URLWithString:self.urlPath];
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                                   cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                               timeoutInterval:15.0];
            
            //        NSURLRequest *request = [NSURLRequest requestWithURL:url];
            [self.wkWebView loadRequest:request];
        }else if (self.localFile.length !=0){
            if (self.localFileType.length == 0) {
                self.localFileType = @"html";
            }
            
            NSString *path = [[NSBundle mainBundle] pathForResource:self.localFile ofType:self.localFileType];
            if (path) {
                NSURL *request = [NSURL fileURLWithPath:path];
                [self.wkWebView loadFileURL:request allowingReadAccessToURL:[NSBundle mainBundle].resourceURL];
            }
        }else if (self.richText.length != 0){
            //        [DZNetwork hint_error:@"网址发生错误"];
            
//            NSString *headerString = @"<header><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'></header>";
//            NSString *headerString = @"<meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'>";
            NSString *headerString = @"<header><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'></header><head><style>img{width:320px !important;}</style></head>";
            [self.wkWebView loadHTMLString:[headerString stringByAppendingString:self.richText] baseURL:nil];
            
//            NSString *headerString = @"<header><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'></header><head><style>img{width:320px !important;}</style></head>";
//            [self.wkWebView loadHTMLString:[headerString stringByAppendingString:self.richText] baseURL:nil];

//            [self.wkWebView loadHTMLString:self.richText baseURL:nil];
        }else{
            [DZNetwork hint_error:@"网址错误"];
        }
        kLog(@"%@",self.urlPath);
    }
}
-(void)wk_close{
    WKUserContentController *controller = self.wkConfig.userContentController;
    [controller removeScriptMessageHandlerForName:@"iOSApp"];
    
    NSArray *viewcontrollers=self.navigationController.viewControllers;
    if (viewcontrollers.count > 1){
        if ([viewcontrollers objectAtIndex:viewcontrollers.count - 1] == self){
            //push方式
            [self.navigationController popViewControllerAnimated:YES];
        }
    }else{
        //present方式
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
-(void)wk_back{
    if ([self.wkWebView canGoBack]) {
        [self.wkWebView goBack];
    }else{
        WKUserContentController *controller = self.wkConfig.userContentController;
        [controller removeScriptMessageHandlerForName:@"iOSApp"];
        
        NSArray *viewcontrollers=self.navigationController.viewControllers;
        if (viewcontrollers.count > 1){
            if ([viewcontrollers objectAtIndex:viewcontrollers.count - 1] == self){
                //push方式
                [self.navigationController popViewControllerAnimated:YES];
            }
        }else{
            //present方式
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}
-(UIProgressView *)progressView{
    if (!_progressView) {        // 懒加载添加进入条
        _progressView = [[UIProgressView alloc] init];
        _progressView.frame = CGRectMake(0,kTopHeight, KScreen_Width, 1);
        _progressView.backgroundColor = [UIColor redColor];
    }
    return _progressView;
}
-(WKWebViewConfiguration *)wkConfig{
    if (!_wkConfig) {
        _wkConfig = [[WKWebViewConfiguration alloc] init];
        _wkConfig.userContentController = [WKUserContentController new];
        [_wkConfig.userContentController addScriptMessageHandler:self name:@"iOSApp"];
    }
    return _wkConfig;
}
-(WKWebView *)wkWebView{
    if (!_wkWebView) {//懒加载WKWebView
        [self.view addSubview:self.progressView];
        _wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0,kTopHeight+1, KScreen_Width, KScreen_Height-kTopHeight-1) configuration:self.wkConfig];
        _wkWebView.backgroundColor = [UIColor clearColor];
        _wkWebView.navigationDelegate = self;
        _wkWebView.UIDelegate=self;
        _wkWebView.scrollView.delegate = self;
        _wkWebView.opaque = NO;
        if (_wkWebView.scrollView.subviews.count>0) {
            if ([_wkWebView.scrollView.subviews[0] isKindOfClass:[UIView class]]) {
                _wkWebView.scrollView.subviews[0].backgroundColor = [UIColor whiteColor];
            }
        }
        _wkWebView.allowsBackForwardNavigationGestures = YES;/**这一步是，开启侧滑返回上一历史界面**/
        // 添加KVO监听
        [_wkWebView addObserver:self forKeyPath:@"loading" options:NSKeyValueObservingOptionNew context:nil];
        [_wkWebView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
        [_wkWebView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    }
    return _wkWebView;
}
#pragma mark - KVO
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"loading"]) {
        self.progressView.alpha = 1;
        if (self.assignTitle.length == 0 ) {
            self.title=@"加载中...";
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    } else if ([keyPath isEqualToString:@"title"]) {
        if (self.assignTitle.length == 0 ) {
            self.title = self.wkWebView.title;
        }
    } else if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progressView.progress = self.wkWebView.estimatedProgress;
    }
    // 加载完成
    if (!self.wkWebView.loading) {
        [UIView animateWithDuration:0.5 animations:^{
            self.progressView.alpha = 0;
            if (self.assignTitle.length == 0 ) {
                self.title = self.wkWebView.title;
            }
            [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        }];
    }
}
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    kLog(@"%@", message.body);
    if ([message.name isEqualToString:@"iOSApp"]) {//直接下载
//        [NSObject appDetails:self dict:message.body];
        [self jsByValResponse:message.body];
    }
}
#pragma mark - < WKNavigationDelegate >
// 发送请求前是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    
//    decisionHandler([NSObject currentUrl:navigationAction.request.URL]);
    decisionHandler(WKNavigationActionPolicyAllow);
}
// 收到相应后是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    decisionHandler(WKNavigationResponsePolicyAllow);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    if (self.assignTitle.length == 0 ) {
        self.title = self.wkWebView.title;
    }
}

- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
    if (self.assignTitle.length == 0 ) {
        self.title = self.wkWebView.title;
    }
}
#pragma mark WKUIDelegate
/*以下三个代理方法全都是与界面弹出提示框相关的（H5自带的这三张弹出框早iOS中不能使用，需要通过以下三种方法来实现），针对于web界面的三种提示框（警告框、确认框、输入框）分别对应三种代理方法*/
-(void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    //js里面的alert实现，如果不实现，网页的alert函数无效
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:message message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }]];
    [self presentViewController:alertController animated:YES completion:^{}];
}
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler {
    //  js 里面的alert实现，如果不实现，网页的alert函数无效  ,
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:message message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }]];
    [self presentViewController:alertController animated:YES completion:^{}];
    
}
-(void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler{
    //js里的输入框实现，如果不实现，网页的输入框无效
    completionHandler(@"Client Not handler");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)jsByValResponse:(NSDictionary *)dict{
    
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

@implementation WeakScriptMessageDelegate

- (instancetype)initWithDelegate:(id<WKScriptMessageHandler>)scriptDelegate {
    self = [super init];
    if (self) {
        _scriptDelegate = scriptDelegate;
    }
    return self;
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    [self.scriptDelegate userContentController:userContentController didReceiveScriptMessage:message];
}

@end
