//
//  DKBaseNavigationViewController.m
//  dingdonghuigou
//
//  Created by Gavin on 2018/12/7.
//  Copyright © 2018 bei jing you ji. All rights reserved.
//

#import "DKBaseNavigationViewController.h"
#import "UIImage+Extension.h"

@interface DKBaseNavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation DKBaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UINavigationBar *navBar = [UINavigationBar appearance];
//    [navBar setTintColor:kMainWhiteColor];
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName :kColor_hex(@"#1e2629"), NSFontAttributeName :KF_BH_F(16)}];
    [navBar setShadowImage:[UIImage new]];//去掉阴影线
//    [navBar setBackgroundImage:[UIImage createImageWithColor:DCColor_nav_blue] forBarMetrics:UIBarMetricsDefault];
//    [navBar setShadowImage:[UIImage createImageWithColor:kColor_hex(@"#f5f7f7")]];//设置阴影线
    [navBar setBackgroundImage:[UIImage createImageWithColor:color_white10] forBarMetrics:UIBarMetricsDefault];

    
//    [navBar setBackgroundImage:[UIImage imageColors:@[DDColorGradient_orange_start,DDColorGradient_orange_end] type:GradientTypeTopToBottom imgSize:CGSizeMake(KScreen_Width, kTopHeight)] forBarMetrics:UIBarMetricsDefault];
    
//    [navBar setTintColor:[UIColor whiteColor]];
//    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName :[UIColor whiteColor]}];
//    [navBar setBackgroundImage:[UIImage imageColors:@[DDColorGradient_orange_start,DDColorGradient_orange_end] type:GradientTypeTopToBottom imgSize:(CGSize)CGSizeMake(KScreen_Width, kTopHeight)] forBarMetrics:UIBarMetricsDefault];
//    [navBar setBackgroundImage:[UIImage createImageWithColor:DDColorMain_orange5] forBarMetrics:UIBarMetricsDefault];

    /*开启系统返回按钮 START*/
    __weak typeof (self) weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }
    /*开启系统返回按钮 END*/
}
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        if (self.viewControllers.count < 2) {
            return NO;
        }
    }
    return YES;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
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
