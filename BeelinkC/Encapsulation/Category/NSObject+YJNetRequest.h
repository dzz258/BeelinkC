//
//  NSObject+YJNetRequest.h
//  YJBrush
//
//  Created by Gavin on 2019/7/31.
//  Copyright © 2019 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DKBaseViewController.h"
//#import <WXApi.h>

/** 请求成功的Block */
typedef void(^RequestSuccess)(id _Nullable data);

/** 请求失败的Block */
typedef void(^RequestFailed)(NSError * _Nullable error);

typedef void(^ResultBlock)(NSInteger code,NSInteger tb,NSInteger qb,id _Nullable model);
//NS_ASSUME_NONNULL_BEGIN

@interface NSObject (YJNetRequest)

/// 微信分享 链接分享
/// @param scene 分享类型
/// {
///   WXSceneSession          = 0,   /**< 聊天界面    */
///   WXSceneTimeline         = 1,   /**< 朋友圈     */
///   WXSceneFavorite         = 2,   /**< 收藏       */
///   WXSceneSpecifiedSession = 3,   /**< 指定联系人  */
/// }
/// @param title 标题
/// @param description 内容
/// @param url url地址
/// @param image 缩略图
-(void)wx_shareType:(int)scene title:(NSString *_Nullable)title desc:(NSString *_Nullable)description url:(NSString *_Nullable)url img:(NSString *_Nullable)image;
///**
// 
// @param selfVC 当前控制器
// @param type 0、查询认证淘宝跟钱包结果（不涉及逻辑）-1、查询淘宝认证结果（不涉及逻辑） 1、查询淘宝认证结果（包含逻辑） -2、查询钱包认证结果（不涉及逻辑） 2 查询钱包认证结果（包含逻辑）
// @param block 认证结果
// */
//-(void)attestationState:(DKBaseViewController *_Nullable)selfVC type:(NSInteger)type block:(ResultBlock _Nullable )block;
///**
// 获取用户认证情况
// 
// @param dataBlock block 成功数据
// */
////-(void)certificationStatus:(DataBlcok)dataBlock;
///**
// 进入钱包
//
// @param selfVC 当前控制器
// @param type 类型 1、 开户 2、管理
// */
//-(void)wallet_getInto:(DKBaseViewController *_Nullable)selfVC type:(NSInteger)type;
//
///**
// 新手是否答题
// */
//-(void)test_isAnswer:(RequestSuccess _Nullable )success failed:(RequestFailed _Nullable )failed;
//
///**
// 新手完成答题
// */
//-(void)test_finish:(RequestSuccess _Nullable )success failed:(RequestFailed _Nullable )failed;
///**
// 检查是否有新版本
// */
//-(void)checkForUpdates;
//-(void)show_a_or_b;
@end

//NS_ASSUME_NONNULL_END
