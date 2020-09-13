//
//  DKSceneDelegate.m
//  BeelinkC
//
//  Created by Gavin on 2020/8/12.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKSceneDelegate.h"
#import "DKAccountViewController.h"
#import "DKBaseNavigationViewController.h"
#import <IQKeyboardManager/IQKeyboardManager.h>
#import "DKHomeViewController.h"
#import "DKLiveViewController.h"
#import "DKMineViewController.h"
#import "DKVideoViewController.h"
#import "DKSubscribeViewController.h"
#import "JMTabBarController.h"
#import "JMConfig.h"

@interface DKSceneDelegate ()

@end

@implementation DKSceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.enableAutoToolbar = NO;
    [self logout];
//    [self goLogin];
}

-(void)goLogin{
    //已登陆
    kLog(@"去登陆");
    DKAccountViewController *loginVC = [[DKAccountViewController alloc] init];
    loginVC.isHideNav = YES;
    self.window.rootViewController = [[DKBaseNavigationViewController alloc] initWithRootViewController:loginVC];
}
-(void)logout{
    
//    if ([[[DDUserInfo share] getUserName] length] == 0) {
//        [self setUserNickname];
//        return;
//    }
    
    //已登陆
    typedef void (^Animation)(void);
    UIWindow* window = self.window;
    Animation animation = ^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        
        //初始化标题数组, 未选择图片数组, 选择图片数组, 控制器数组
        /*********创建跟试图控制器*********/
        
        //初始化标题数组, 未选择图片数组, 选择图片数组, 控制器数组
        NSArray *titleArr = @[@"首页",@"直播",@"视频",@"订阅",@"我的"];
        NSArray *imageNormalArr = @[@"tabar_icon_home",@"tabar_icon_live",@"tabar_icon_video",@"tabar_icon_subscribe",@"tabar_icon_mine"];
        
        NSArray *imageSelectedArr = @[@"",@"",@"",@"",@""];
        

        //        NSArray *imageSelectedArr = @[@"tabbar_icon_1_select",@"tabbar_icon_2_select",@"tabbar_icon_3_select",@"tabbar_icon_4_select"];
        NSMutableArray *controllersArr =[NSMutableArray array];
        
        DKHomeViewController *leadReadVC = [[DKHomeViewController alloc] init];
        leadReadVC.navigationItem.title = @"大领读";
        leadReadVC.isHideNav = YES;
        
        DKLiveViewController *homeVC = [[DKLiveViewController alloc] init];
        homeVC.navigationItem.title = @"书城";
        homeVC.isHideNav = YES;
        
        DKVideoViewController * bookrackVC = [[DKVideoViewController alloc] init];
        bookrackVC.navigationItem.title = @"书架";
        bookrackVC.isHideNav = YES;
        
//        DKChatterBoxViewController *chatterBoxVC = [[DKChatterBoxViewController alloc] init];
//        chatterBoxVC.navigationItem.title = @"话匣子";
//        chatterBoxVC.isHideNav = YES;
        
        DKSubscribeViewController *subscribeVC = [[DKSubscribeViewController alloc] init];
        subscribeVC.navigationItem.title = @"我的";
        subscribeVC.isHideNav = YES;
        
        DKMineViewController *myVC = [[DKMineViewController alloc] init];
        myVC.navigationItem.title = @"我的";
        myVC.isHideNav = YES;
        
        NSArray *array=@[leadReadVC,homeVC,bookrackVC,subscribeVC,myVC];
        
        for (int i = 0; i < titleArr.count; i++) {
            [controllersArr addObject:[[DKBaseNavigationViewController alloc] initWithRootViewController:array[i]]];
        }
        //初始化配置信息
        JMConfig *config = [JMConfig config];
        config.tabBarAnimType=JMConfigTabBarAnimTypeBoundsMax;
        config.isClearTabBarTopLine=NO;
        config.tabBarBackground = color_white10;
        config.titleOffset = 5;
        config.imageOffset = 5;
        config.imageSize = CGSizeMake(16, 16);
        config.tabBarTopLineColor=[UIColor clearColor];
        config.norTitleColor = color_gray6;
        config.selTitleColor= color_cyan9;
        //        JMTabBarController *tabBarVc = [[JMTabBarController alloc] initWithTabBarControllers:controllersArr NorImageArr:imageNormalArr SelImageArr:imageSelectedArr TitleArr:titleArr Config:config andTag:1];
        JMTabBarController *tabBarVc = [[JMTabBarController alloc] initWithTabBarControllers:controllersArr NorImageArr:imageNormalArr SelImageArr:imageSelectedArr TitleArr:titleArr Config:config];
        tabBarVc.selectedIndex = 0;
        self.window.rootViewController = tabBarVc;
        
//        LZTabBarVC *tbc = [[LZTabBarVC alloc] init];
//        self.window.rootViewController = tbc;

        [UIView setAnimationsEnabled:oldState];
    };
    [UIView transitionWithView:window
                      duration:0.5f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:animation
                    completion:nil];
}
- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
