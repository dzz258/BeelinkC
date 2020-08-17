//
//  DKLoginViewModel.m
//  ldsapp
//
//  Created by Gavin on 2020/3/21.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKLoginViewModel.h"

@implementation DKLoginViewModel

+(void)api_user_agreementSuccess:(RequestSuccess)success failure:(RequestFailed)failure{
    [DZNetwork get_ph:api_get_user_agreement np:nil class:nil success:^(id data) {
        success(data);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)api_sms:(NSString *)phoneStr success:(RequestSuccess)success failure:(RequestFailed)failure{
    if (phoneStr.length == 0) {
        [DZNetwork hint_middle:@"请输入手机号"];
        
        return failure([NSError new]);
    }
    
    if (phoneStr.length != 11) {
        [DZNetwork hint_middle:@"手机号格式错误"];
        return failure([NSError new]);
    }
    //@"L"
    [DZNetwork post_ph:api_post_login_code np:@{@"mobile_number":[NSString null_str:phoneStr]} class:nil success:^(id model) {
        [DZNetwork hint_success:@"发送成功，请注意查收"];
        success(model);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
-(void)api_login:(NSString *)phoneStr code:(NSString *)code success:(RequestSuccess)success failure:(RequestFailed)failure{
    if (phoneStr.length == 0) {
        [DZNetwork hint_middle:@"请输入手机号"];
        return failure([NSError new]);
    }
    
    if (phoneStr.length != 11) {
        [DZNetwork hint_middle:@"手机号格式错误"];
        return failure([NSError new]);
    }
    if (code.length == 0) {
        [DZNetwork hint_middle:@"验证码不能为空"];
        return failure([NSError new]);
    }
    [DZNetwork post_ph:api_post_login np:@{@"mobile_number":[NSString null_str:phoneStr],@"secur_code":[NSString null_str:code]} class:nil success:^(id model) {
        [DZNetwork hint_success:@"登录成功"];
        [[DKUserInfo share]saveInfo:model];
        success(model);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
@end
