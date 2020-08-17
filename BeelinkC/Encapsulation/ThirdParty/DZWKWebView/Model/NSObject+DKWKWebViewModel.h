//
//  NSObject+DKWKWebViewModel.h
//  BiYongBao
//
//  Created by Gavin on 2018/8/5.
//  Copyright © 2018年 Ai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DKWKWebViewModel)

/**
 发送请求前是否跳转
 
 @param url 当前URL
 @param controller 当前控制器
 @return 执行状态
 */
//+(WKNavigationActionPolicy)currentUrl:(NSURL *)url controller:(UIViewController *)controller;
/**
 跳转APP下载应用详情（或直接下载）

 @param controller 当前控制器
 @param dict 参数值
 */
+(void)appDetails:(UIViewController *)controller dict:(NSDictionary *)dict;
@end
