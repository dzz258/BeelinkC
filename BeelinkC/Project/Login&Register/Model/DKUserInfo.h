//
//  DKUserInfo.h
//  ldsapp
//
//  Created by Gavin on 2020/3/22.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDQFoundationModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BasicInfo : DDQFoundationModel

@property (nonatomic, copy) NSString *token;
//@property (nonatomic, copy) NSString *headImg;
//@property (nonatomic, copy) NSString *accountName;
//@property (nonatomic, assign) NSInteger accountType;//0、个人  1、 机构
//@property (nonatomic, copy) NSString * accountId;
//@property (nonatomic, copy) NSString * personId;
//@property (nonatomic, copy) NSString * companyId;

@end

@interface DKUserInfo : NSObject

+ (instancetype)share;
/**
 保存用户信息（NSUserDefaults）
 
 @param info 用户信息字典
 */
-(void)saveInfo:(NSDictionary *)info;
/**
 清楚用户信息
 */
- (void)clearUserInfo;
/**
 获取用信息
 
 @return BasicInfo 用户信息
 */
-(BasicInfo *)info;
/**
 获取token 信息
 */
- (NSString *)getToken;
/// 是否登录
-(BOOL)isLogin;

@end

NS_ASSUME_NONNULL_END
