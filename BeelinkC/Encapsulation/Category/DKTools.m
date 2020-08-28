//
//  DKTools.m
//  BeelinkC
//
//  Created by Gavin on 2020/8/26.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKTools.h"

@implementation DKTools

//+(CGFloat)getStatusBarHight{
//    float statusBarHeight = 0;
//    if (@available(iOS 13.0, *)) {
//        UIStatusBarManager *statusBarManager = [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager;
//        return statusBarHeight = statusBarManager.statusBarFrame.size.height;
//    } else {
//        return statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
//    }
//}
+(CGFloat)dk_statusBarHight{
    CGFloat statusBarHeight = 0;
    if (@available(iOS 13.0, *)) {
        UIStatusBarManager *statusBarManager = [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager;
        return statusBarHeight = statusBarManager.statusBarFrame.size.height;
    }else {
        return statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    }
}
@end
