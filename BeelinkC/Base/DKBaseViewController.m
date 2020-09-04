//
//  DKBaseViewController.m
//  dingdonghuigou
//
//  Created by Gavin on 2018/12/7.
//  Copyright © 2018 bei jing you ji. All rights reserved.
//

#import "DKBaseViewController.h"
//#import "DKNotNetWorkHintViewController.h"
#import "EasyLodingView.h"
#import "DKErrorHintV.h"
//#import "AFNetworkReachabilityManager.h"
#import "UIImage+Extension.h"
#import "WBLoadingIndicatorView.h"

@interface DKBaseViewController ()
@property(nonatomic,strong)DKErrorHintV *hintV;
@end

@implementation DKBaseViewController

#pragma mark -- SYSTEM
- (void)dealloc {
    kLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
//-(UIStatusBarStyle)preferredStatusBarStyle{
//    if (@available(iOS 13.0, *)) {
//        return UIStatusBarStyleDarkContent;
//    } else {
//        return UIStatusBarStyleLightContent;
//    }
//}
#pragma mark -- 初始化
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    DKBaseViewController *viewController = [super allocWithZone:zone];
    @weakify(viewController)
    [[viewController rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
        @strongify(viewController)
        [viewController _addSubviews];
        [viewController _bindViewModel];
    }];
    
//    [[viewController rac_signalForSelector:@selector(viewWillAppear:)] subscribeNext:^(id x) {
//        @strongify(viewController)
//        [viewController _setupNavigation];
//        [viewController _loadNewData];
//    }];
    return viewController;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:self.isHideNav animated:YES];
//    if (self.nav_style == 1) {
//        [self.navigationController.navigationBar setShadowImage:[UIImage createImageWithColor:kColor_hex(@"#F5F8FA")]];//设置阴影线
//        [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:DCColor_main_white] forBarMetrics:UIBarMetricsDefault];
//    }else{
//        [self.navigationController.navigationBar setShadowImage:[UIImage new]];//去掉阴影线
//        [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:DCColor_nav_blue] forBarMetrics:UIBarMetricsDefault];
//    }
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    // 开启返回手势
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (self.isBanGesteBack) {
        // 禁用返回手势
        if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        }
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /** 协助布局  */
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    if (self.navigationController.viewControllers.count > 1) {
        [self addLeftBarButtonWithImage:KImage(@"nav_back_black") action:@selector(goBack)];
    }
    self.view.backgroundColor = color_white10;//[UIColor whiteColor];
//    [self observeNetworkStart];
}
-(void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 设置tableView
/**
 *  懒加载UITableView
 *
 *  @return UITableView
 */
- (UITableView *)superTableV{
    if (_superTableV == nil) {
        // 需要UITableViewStyleGrouped时在子类中重写 不要改变 否则 cell有35的上提
        _superTableV = [[UITableView alloc] initWithFrame:CGRectMake(0,kTopHeight, KScreen_Width, KScreen_Height - kTopHeight) style:[self.class rootTableStyle]];
        _superTableV.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _superTableV.estimatedRowHeight = 0;
        _superTableV.estimatedSectionHeaderHeight = 0;
        _superTableV.estimatedSectionFooterHeight = 0;
        _superTableV.showsVerticalScrollIndicator = NO;
        _superTableV.separatorStyle = UITableViewCellSelectionStyleNone;
        
//        _superTableV.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//            [self headerRereshing];
//        }];
        _superTableV.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
        //底部刷新
        _superTableV.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
        _superTableV.backgroundColor = color_white10;
        _superTableV.scrollsToTop = YES;
        UIView *footerV = [[UIView alloc]init];
        footerV.frame = CGRectMake(0, 0, KScreen_Width, 15);
        footerV.backgroundColor = color_white10;
        _superTableV.tableFooterView = footerV;
        
        _superTableV.mj_footer.hidden = YES;
        _superTableV.mj_header.hidden = YES;
    }
    return _superTableV;
}
+ (UITableViewStyle)rootTableStyle {
    return UITableViewStylePlain;
}
/** 子类中实现 */
-(void)headerRereshing{}
/** 子类中实现 */
-(void)footerRereshing{}

#pragma mark -- just for overwrite
/** 绑定 */
- (void)_bindViewModel{}
/** 添加控件 */
- (void)_addSubviews{}
/** 设置导航栏 */
//- (void)_setupNavigation{}
/** 加载数据 */
//- (void)_loadNewData{}

#pragma mark -- 等待加载动画
-(void)setLoading:(BOOL)loading{
    [self loading:loading isTouch:NO];
}
-(void)loading:(BOOL)loading hint:(NSString *)hintText{
    [self loading:loading hint:hintText superV:self.view isTouch:NO];
}
-(void)loading:(BOOL)loading isTouch:(BOOL)isTouch{
    [self loading:loading superV:self.view isTouch:isTouch];
}
-(void)loading:(BOOL)loading superV:(UIView *)superV{
    [self loading:loading superV:superV isTouch:NO];
}
-(void)loading:(BOOL)loading superV:(UIView *)superV isTouch:(BOOL)isTouch{
    [self loading:loading hint:@"   加载中..." superV:superV isTouch:isTouch];
}
-(void)loading:(BOOL)loading hint:(NSString *)hintText superV:(UIView *)superV isTouch:(BOOL)isTouch{
    _loading = loading;
    if (loading) {
        WBLoadingIndicatorView *indicatorView1 = [WBLoadingIndicatorView wb_indicatorForView:superV];
        [indicatorView1 wb_hideLoadingView:YES];
        
        WBLoadingIndicatorView *indicatorView = [WBLoadingIndicatorView wb_showIndicatorAddTo:superV];
        indicatorView.square = YES;
        indicatorView.label.text = hintText;
        indicatorView.indicatorSize = CGSizeMake(35, 35);
        indicatorView.type = WBLoadingAnimationBallPulse;
        indicatorView.backgroundView.backgroundColor = [UIColor clearColor];
        indicatorView.contentColor = [UIColor orangeColor];
        indicatorView.bezelView.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.7f];
        
        if (isTouch) {
            indicatorView.userInteractionEnabled = NO;
            indicatorView.backgroundView.userInteractionEnabled = NO;
        }
    }else{
        WBLoadingIndicatorView *indicatorView1 = [WBLoadingIndicatorView wb_indicatorForView:superV];
        [indicatorView1 wb_hideLoadingView:YES];
    }
}
//#pragma mark - 监听网络状态
//- (void)observeNetworkStart {
//    //1.创建网络监听管理者
////    kWeakSelf(self);
//    [self.view addSubview:self.dkNetWorkHintV];
//    //显示，隐藏网络提示窗口
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notNetwork) name:@"notNetwork" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(haveNetwork) name:@"haveNetwork" object:nil];
//
//    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
//    //2.监听网络状态的改变
//    /*
//     AFNetworkReachabilityStatusUnknown          = 未知
//     AFNetworkReachabilityStatusNotReachable     = 没有网络
//     AFNetworkReachabilityStatusReachableViaWWAN = 3G
//     AFNetworkReachabilityStatusReachableViaWiFi = WIFI
//     */
//    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        switch (status) {
//            case AFNetworkReachabilityStatusNotReachable:
//                kLog(@"没有网络");
//                [[NSNotificationCenter defaultCenter] postNotificationName:@"notNetwork" object:nil];
//                break;
//            default:{
//                kLog(@"有网络=================== ");
//                [[NSNotificationCenter defaultCenter] postNotificationName:@"haveNetwork" object:nil];
//            }
//                break;
//        }
//    }];
//    //3.开始监听
//    [manager startMonitoring];
//}
//-(void)notNetwork{
//    if (!self.isNetworkHint) {
//        [self.view bringSubviewToFront:self.dkNetWorkHintV];
//        self.dkNetWorkHintV.hidden = NO;
//    }
//}
//-(void)haveNetwork{
//    self.dkNetWorkHintV.hidden = YES;
//}
//-(DKNotNetWorkHintView *)dkNetWorkHintV{
//    if (!_dkNetWorkHintV) {
//        _dkNetWorkHintV=[[DKNotNetWorkHintView alloc] initWithFrame:CGRectMake(0, kTopHeight, self.view.width, 32)];
//        _dkNetWorkHintV.hidden = YES;
//        kWeakSelf(self);
//        _dkNetWorkHintV.dkNotNewWorkBlock = ^{
//            DKNotNetWorkHintViewController *not_netWork_VC=[[DKNotNetWorkHintViewController alloc] init];
//            not_netWork_VC.hidesBottomBarWhenPushed=YES;
//            NSArray *viewcontrollers=weakself.navigationController.viewControllers;
//            if (viewcontrollers.count > 1){
//                if ([viewcontrollers objectAtIndex:viewcontrollers.count - 1] == self){
//                    //push方式
//                    [weakself.navigationController pushViewController:not_netWork_VC animated:YES];
//                }
//            }else{
//                //present方式
//                UINavigationController *nav_vc = [[UINavigationController alloc] initWithRootViewController:not_netWork_VC];
//                [weakself presentViewController:nav_vc animated:YES completion:^{
//                }];
//            }
//        };
//    }
//    return _dkNetWorkHintV;
//}
-(void)showErr:(NSInteger)count heigth:(CGFloat)f_heigth block:(DKParentBlock)dkBlock{
    [self showHint:NO count:count hintText:nil heigth:f_heigth block:^(BOOL loading, NSDictionary *dic) {
        dkBlock(loading,dic);
    }];
}
-(void)showSuccess:(NSInteger)count hintText:(NSString *)hinText heigth:(CGFloat)f_heigth block:(DKParentBlock)dkBlock{
    [self showHint:YES count:count hintText:hinText heigth:f_heigth block:^(BOOL loading, NSDictionary *dic) {
        dkBlock(loading,dic);
    }];
}
-(void)showHint:(BOOL)success count:(NSInteger)count hintText:(NSString *)hinText heigth:(CGFloat)f_heigth block:(DKParentBlock)dkBlock{
    [self showHint:success count:count hintText:hinText parent:self.superTableV frame:CGRectMake(0, 0, KScreen_Width, f_heigth) block:^(BOOL loading, NSDictionary *dic) {
        dkBlock(loading,dic);
    }];
}
-(void)showHint:(BOOL)success count:(NSInteger)count hintText:(NSString *)hinText parent:(UIView *)parent frame:(CGRect)frame block:(DKParentBlock)dkBlock{
    [self.hintV deleteView];
//    self.loading=NO;
    if (count==0) {
        if (parent==nil) {
            parent=self.view;
        }
        if (frame.size.height==0 && frame.size.width==0) {
            frame=CGRectMake(0, 0, parent.width, parent.height);
        }
        if ([DZNetworkHelper isNetwork]) {
            if (success) {
                //没有数据
                self.hintV = [[DKErrorHintV alloc] initShowHintWithFrame:frame showType:dkNoData hintText:hinText];
            }else{
                self.hintV = [[DKErrorHintV alloc] initShowHintWithFrame:frame];
            }
        }else{
            //没有网络
            self.hintV = [[DKErrorHintV alloc] initShowHintWithFrame:frame showType:dkNoInternet hintText:@""];
        }
        self.hintV.dkNoDataViewBlock = ^{
            dkBlock(YES,nil);
        };
        [parent addSubview:self.hintV];
    }
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
