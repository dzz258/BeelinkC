//
//  DKLoginViewModel.h
//  ldsapp
//
//  Created by Gavin on 2020/3/21.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKBaseViewModel.h"

@interface DKLoginViewModel : DKBaseViewModel
/*
 发送短信验证码

 @param phoneStr 手机号
 @param success 成功回调
 @param failure 失败回调
 */
-(void)api_sms:(NSString *)phoneStr success:(RequestSuccess)success failure:(RequestFailed)failure;

/*
 登录
 @param phoneStr 手机号
 @param code 验证码
 @param success 成功回调
 @param failure 失败回调
 */
-(void)api_login:(NSString *)phoneStr code:(NSString *)code success:(RequestSuccess)success failure:(RequestFailed)failure;

/// 用户协议
/// @param success 成功回调
/// @param failure 失败回调
+(void)api_user_agreementSuccess:(RequestSuccess)success failure:(RequestFailed)failure;

@end
