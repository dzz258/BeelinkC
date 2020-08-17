//
//  NSObject+DKWKWebViewModel.m
//  BiYongBao
//
//  Created by Gavin on 2018/8/5.
//  Copyright © 2018年 Ai. All rights reserved.
//

#import "NSObject+DKWKWebViewModel.h"

@implementation NSObject (DKWKWebViewModel)
/**
 发送请求前是否跳转
 
 @param url 当前URL
 @return 执行状态
 */
//+(WKNavigationActionPolicy)currentUrl:(NSURL *)url controller:(UIViewController *)controller{
    // 打开appstore
//    if ([url.absoluteString hasPrefix:@"downinfo:"]) {
//        NSString *str = [url.absoluteString substringFromIndex:9];//截取掉下标3之后的字符串
//        APPDetailViewController *appDetailVC = [[APPDetailViewController alloc] init];
//        appDetailVC.isNavStyle = 1;
//        appDetailVC.appID = [NSString getNullStr:str];
//        appDetailVC.hidesBottomBarWhenPushed = YES;
//        [controller.navigationController pushViewController:appDetailVC animated:YES];
//        return WKNavigationActionPolicyCancel;
//    }
//    if ([url.absoluteString containsString:@"https://itunes.apple.com/cn/app/"]||[url.absoluteString hasPrefix:@"itms-services://"]){
//        if ([[UIApplication sharedApplication] canOpenURL:url]){
//            [[UIApplication sharedApplication] openURL:url];
//            return WKNavigationActionPolicyCancel;
//        }
//    }
//    return WKNavigationActionPolicyAllow;
//}


/**
 跳转APP下载应用详情（或直接下载）
 
 @param controller 当前控制器
 @param dict 参数值
 */
+(void)appDetails:(UIViewController *)controller dict:(NSDictionary *)dict{
//    HomeHotRecommendAppList * model = [HomeHotRecommendAppList mj_objectWithKeyValues:dict];
//    if (model.type==1) {
//        [[BaiduMobStat defaultStat] logEvent:@"OpenAppByH5" eventLabel:@"打开详情" attributes:@{@"appId": [NSString baiduStatIndex:model.ID]}];
//        AppDetailsViewController *appDetails=[[AppDetailsViewController alloc] init];
//        appDetails.appId=model.ID;
//        appDetails.hidesBottomBarWhenPushed=YES;
//        [controller.navigationController pushViewController:appDetails animated:YES];
//    }else{
//        [[BaiduMobStat defaultStat] logEvent:@"OpenAppByH5" eventLabel:@"下载" attributes:@{@"appId": [NSString baiduStatIndex:model.ID]}];
//        [NSString appDownloadGoNo:controller url:model.ios_url appId:model.ID];
//    }
}
@end
