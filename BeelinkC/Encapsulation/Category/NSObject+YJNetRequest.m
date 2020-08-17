//
//  NSObject+YJNetRequest.m
//  YJBrush
//
//  Created by Gavin on 2019/7/31.
//  Copyright © 2019 Gavin. All rights reserved.
//

#import "NSObject+YJNetRequest.h"

@implementation NSObject (YJNetRequest)

//-(void)wx_shareType:(int)scene title:(NSString *)title desc:(NSString *)description url:(NSString *)url img:(NSString *)image{
//    UIImage *img;
//    if ([image hasPrefix:@"http"]) {
//        img = [DZNetwork compressImage:[DZNetwork getImageFromURL:image] toByte:65536];
//    }else{
//        img = KImage(image);
//    }
//    WXWebpageObject *webpageObject = [WXWebpageObject object];
//    webpageObject.webpageUrl = [NSString null_str:url];
//    WXMediaMessage *message = [WXMediaMessage message];
//    message.title = [NSString null_str:title];
//    message.description = [NSString null_str:description];
//    [message setThumbImage:img];
//    message.mediaObject = webpageObject;
//    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
//    req.bText = NO;
//    req.message = message;
//    req.scene = scene;//WXSceneSession;
//    [WXApi sendReq:req completion:^(BOOL success) {
//        if (!success) {
//            [DZNetwork hint_error:@"分享失败"];
//        }
//    }];
//}
//
////0、查询认证淘宝跟钱包结果（不涉及逻辑）-1、查询淘宝认证结果（不涉及逻辑） 1、查询淘宝认证结果（包含逻辑） -2、查询钱包认证结果（不涉及逻辑） 2 查询钱包认证结果（包含逻辑）
//-(void)attestationState:(DKBaseViewController *)selfVC type:(NSInteger)type block:(ResultBlock)block{
//    [DZNetwork post_original_ph:api_post_auth_status np:@{@"f_user_id":@([[DDUserInfo share] getUserID]),@"token":[[DDUserInfo share] getToken]} class:nil success:^(id model) {
//        /*
//         -1 未授权
//         -2 已失效
//         0 待后台人工审核
//         1 生效
//         -3 审核失败  不再允许授权
//         -4 没有收到回调 结果5分钟以上重新认证
//         4 五分钟以内没有收到结果回调等着
//         */
//        /*
//         -1 未开户
//         1 开户
//         */
//        if ([model[@"code"] integerValue] == 200) {
//            NSDictionary *dict = model[@"data"];
//            block(200,[dict[@"tb_accreditation"] integerValue],[dict[@"open_account"]integerValue],dict);
//            
//            NSInteger state = -1000;
//            if (type == 1) {
//                if ([dict[@"tb_accreditation"]integerValue] == -2){
//                    state = 1;
//                }else if ([dict[@"tb_accreditation"]integerValue] == -3){
//                    state = -1;
//                }else if ([dict[@"tb_accreditation"]integerValue] == 0){
//                    state = 0;
//                }else if ([dict[@"tb_accreditation"]integerValue] == -4){
//                    //后台没收到 重新认证
//                    state = -2;
//                }else if ([dict[@"tb_accreditation"]integerValue] == 4){
//                    //等待认证结果  等待校验结果  校验失败
//                    state = 2;
//                }else if ([dict[@"tb_accreditation"]integerValue] == -1){
//                    //未认证
//                    state = -10;
//                }
//                if (state != -1000) {
//                    [self tb_authentication:selfVC type:state text:[NSString null_str:dict[@"app_list"]]];
//                }
//            }else if (type == 2) {
//                if ([dict[@"open_account"]integerValue] == -1) {
//                    [self wallet_getInto:selfVC type:1];
//                }else{
//                    [self wallet_getInto:selfVC type:2];
//                }
//            }
//        }else{
//            //失败
//            block([model[@"code"] integerValue],-500,-500,model);
//        }
//    } failure:^(NSError *error) {
//        //失败
//        block(error.code,-500,-500,nil);
//    }];
//}
////-1、审核失败 0 审核中 1、认证失效 -2、校验失败 2、校验中 -10 未授权 未认证
//-(void)tb_authentication:(DKBaseViewController *)selfVC type:(NSInteger)type text:(NSString *)hintText{
//    if (type == -10) {
//        [self tb_unauthorized:selfVC text:hintText];
//    }else if (type == -2){
//        [self tb_check:selfVC text:hintText];
//    }else if (type == 2){
//        [self tb_checking:selfVC text:hintText];
//    }else if (type == -1) {
//        [self tb_failure:selfVC text:hintText];
//    }else if (type == 1){
//        [self tb_invalid:selfVC text:hintText];
//    }else{
//        [self tb_review:selfVC text:hintText];
//    }
//}
////未授权 未认证
//-(void)tb_unauthorized:(DKBaseViewController *)selfVC text:(NSString *)hintText{
//    if (hintText.length == 0) {
//        hintText = @"您尚未进行淘宝认证\n暂不能抢单";
//    }
//    [NSObject popBox:selfVC isDelete:YES dict:@{@"title":@"提 示",@"content":hintText,@"cancel":@"取消",@"confirm":@"去认证"} block:^(DKBoxType typeI) {
//        if (typeI == DKBoxType_confirm) {
//            YJAuthenticationCentreViewController *authenticationVC = [YJAuthenticationCentreViewController new];
//            [selfVC.navigationController pushViewController:authenticationVC animated:YES];
//        }
//    }];
//}
////校验中
//-(void)tb_checking:(DKBaseViewController *)selfVC text:(NSString *)hintText{
//    if (hintText.length == 0) {
//        hintText = @"您当前淘宝认证正在校验中...\n暂不能抢单";
//    }
//    
//    [NSObject popBox:selfVC isDelete:YES dict:@{@"title":@"提 示",@"content":hintText,@"cancel":@"取消",@"confirm":@"查看"} block:^(DKBoxType typeI) {
//        if (typeI == DKBoxType_confirm) {
//            YJAuthenticationCentreViewController *authenticationVC = [YJAuthenticationCentreViewController new];
//            [selfVC.navigationController pushViewController:authenticationVC animated:YES];
//        }
//    }];
//}
////校验失败，重新授权
//-(void)tb_check:(DKBaseViewController *)selfVC text:(NSString *)hintText{
//    if (hintText.length == 0) {
//        hintText = @"您当前淘宝认证校验失败！\n请重新进行认证";
//    }
//    [NSObject popBox:selfVC isDelete:YES dict:@{@"content":hintText,@"cancel":@"取消",@"confirm":@"去认证"} block:^(DKBoxType typeI) {
//        if (typeI == DKBoxType_confirm) {
//            YJAuthenticationCentreViewController *authenticationVC = [YJAuthenticationCentreViewController new];
//            [selfVC.navigationController pushViewController:authenticationVC animated:YES];
//        }
//    }];
//}
//
////审核中
//-(void)tb_review:(DKBaseViewController *)selfVC text:(NSString *)hintText{
//    if (hintText.length == 0) {
//        hintText = @"您当前淘宝认证正在审核中...\n暂不能抢单";
//    }
//    [NSObject popBox:selfVC isDelete:YES dict:@{@"title":@"提 示",@"content":hintText,@"cancel":@"取消",@"confirm":@"查看"} block:^(DKBoxType typeI) {
//        if (typeI == DKBoxType_confirm) {
//            YJAuthenticationCentreViewController *authenticationVC = [YJAuthenticationCentreViewController new];
//            [selfVC.navigationController pushViewController:authenticationVC animated:YES];
//        }
//    }];
//}
////审核失败，不再允许抢单
//-(void)tb_failure:(DKBaseViewController *)selfVC text:(NSString *)hintText{
//    if (hintText.length == 0) {
//        hintText = @"您当前淘宝认证审核失败！\n不能进行抢单";
//    }
//    [NSObject popBox:selfVC isDelete:YES dict:@{@"title":@"提 示",@"content":hintText,@"cancel":@"取消",@"confirm":@"查看"} block:^(DKBoxType typeI) {
//        if (typeI == DKBoxType_confirm) {
//            YJAuthenticationCentreViewController *authenticationVC = [YJAuthenticationCentreViewController new];
//            [selfVC.navigationController pushViewController:authenticationVC animated:YES];
//        }
//    }];
//}
////认证失效，重新认证
//-(void)tb_invalid:(DKBaseViewController *)selfVC text:(NSString *)hintText{
//    if (hintText.length == 0) {
//        hintText = @"您当前淘宝认证已失效！\n请重新进行认证";
//    }
//    [NSObject popBox:selfVC isDelete:YES dict:@{@"content":hintText,@"cancel":@"取消",@"confirm":@"去认证"} block:^(DKBoxType typeI) {
//        if (typeI == DKBoxType_confirm) {
//            YJAuthenticationCentreViewController *authenticationVC = [YJAuthenticationCentreViewController new];
//            [selfVC.navigationController pushViewController:authenticationVC animated:YES];
//        }
//    }];
//}
//
////@param dict 数据源 {
////    title : 标题 （默认 温馨提示）
////content: 描述内容  必填
////    hint : 除描述内容外的提示内容 默认 无  type 为 1、3时，该参数必填
////    cancel : 取消按钮文字 默认 取消
////    confirm : 确定按钮 默认 确定
////    type  ：弹框类型 （ 0 默认 取消、确定按钮、无hintL内容；1 取消、确定按钮、带hintL内容；2、确定按钮、无hintL内容；3、确定按钮、带hintL内容）
////}
////示例： @{@"title":@"",@"content":@"",@"hint":@"",@"cancel":@"",@"confirm":@"",@"type":@()}
//
//-(void)wallet_getInto:(DKBaseViewController *)selfVC type:(NSInteger)type{
//    if (type == 1) {
//        //开户
//        [self wallet_openAnAccoun:selfVC success:^(id data) {
//            
//        } failed:^(NSError *error) {
//            
//        }];
//    }else if (type == 2){
//        //管理
//        [self wallet_manage:selfVC success:^(id data) {
//            
//        } failed:^(NSError *error) {
//            
//        }];
//    }
//}
//-(void)wallet_openAnAccoun:(DKBaseViewController *)selfVC success:(RequestSuccess)success failed:(RequestFailed)failed{
//    selfVC.loading = YES;
//    [DZNetwork get_ph:api_get_wallet_sign_open np:nil class:nil success:^(id data) {
//        success(data);
//        selfVC.loading = NO;
//        [[LLRegisterSDK sharedSdk] presentRegisterSDKInViewController:selfVC
//        withPaymentInfo:data
//               complete:^(LLPayResult result, NSDictionary *dic) {
//            if (result != kLLPayResultSuccess) {
//                [DZNetwork hint_error:dic[@"ret_msg"]];
//            }else{
//                NSLog(@"==>%@",[self jsonToString:dic]);
//                [DZNetwork post_ph:api_post_wallet_open_success np:@{@"data":[NSString null_str:[self jsonToString:dic]]} class:nil success:^(id data) {
//                    
//                } failure:^(NSError *error) {
//                    
//                }];
//            }
//        }];
//    } failure:^(NSError *error) {
//        selfVC.loading = NO;
//        failed(error);
//    }];
//}
//
//-(NSString *)jsonToString:(id)data{
//    if(data == nil) { return nil; }
//    NSError *error;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:&error];
//    NSString *jsonString;
//    if (!jsonData) {
//        NSLog(@"%@",error);
//    }else{
//        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
//    }
//    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
//    NSRange range = {0,jsonString.length};
//    //去掉字符串中的空格
//    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
//    NSRange range2 = {0,mutStr.length};
//    //去掉字符串中的换行符
//    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
//    
//    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//}
//
//-(void)wallet_manage:(DKBaseViewController *)selfVC success:(RequestSuccess)success failed:(RequestFailed)failed{
//    selfVC.loading = YES;
//    [DZNetwork get_ph:api_get_wallet_sign_manage np:nil class:nil success:^(id data) {
//        success(data);
//        selfVC.loading = NO;
//        [[LLWalletManageSDK sharedSdk] presentWalletManageSDKInViewController:selfVC withPaymentInfo:data complete:^(LLPayResult result, NSDictionary *dic) {
//            NSLog(@"%@",dic);
//            if (result != kLLPayResultSuccess && result != kLLPayResultCancel) {
//                [DZNetwork hint_error:dic[@"ret_msg"]];
//            }
//        }];
//    } failure:^(NSError *error) {
//        selfVC.loading = NO;
//        failed(error);
//    }];
//}
//-(void)test_isAnswer:(RequestSuccess)success failed:(RequestFailed)failed{
//    [DZNetwork post_ph:api_post_answer_isTest np:nil class:nil success:^(id data) {
//        success(data);
//    } failure:^(NSError *error) {
//        failed(error);
//    }];
//}
//-(void)test_finish:(RequestSuccess)success failed:(RequestFailed)failed{
//    [DZNetwork post_ph:api_post_answer_finish np:nil class:nil success:^(id data) {
//        success(data);
//    } failure:^(NSError *error) {
//        failed(error);
//    }];
//}
//-(void)checkForUpdates{
//    if (!isStartAB) {
//        [DZNetwork post_original_ph:api_post_updates_check np:@{@"version":[NSString null_str:kApp_version],@"device_type":@"IOS"} class:nil success:^(id data) {
//            if ([data[@"data"] isKindOfClass:[NSDictionary class]]) {
//                NSDictionary *dict = data[@"data"];
//                if ([[NSString null_str:dict[@"updateType"]] integerValue] != 0 && 0 < [self serviceVersionNumber:[NSString null_str:dict[@"newestVerison"]]]) {
//                    //有更新
//                    if ([[NSString null_str:dict[@"updateType"]] integerValue] == 1) {
//                        //不强更
//                        [self updateHint:NO url:[NSString null_str:dict[@"appDownUrl"]]];
//                    }else{
//                        //强更
//                        [self updateHint:YES url:[NSString null_str:dict[@"appDownUrl"]]];
//                    }
//                }
//            }
//        } failure:^(NSError *error) {
//            
//        }];
//    }
//}
//-(void)updateHint:(BOOL)isForce url:(NSString *)urlPath{
//    if ([urlPath length] == 0) {
//        return;
//    }
//    NSDictionary *dict;
//    if (isForce) {//强更新
//        dict = @{@"title":@"更新提示",
//                 @"content":@"您当前版本过低，请更新后继续使用",
//                 @"type":@(2),
//                 @"confirm":@"更新",};
//    }else{//不强更新
//        dict = @{@"title":@"更新提示",
//                 @"content":@"当前有新版本是否更新",
//                 @"cancel":@"暂不更新",
//                 @"confirm":@"立即更新",};
//    }
//    
//    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
//    UIViewController *currentVC = [NSObject getCurrentVCFrom:rootViewController];
//    
//    DDHintView *hintV = [[DDHintView alloc] initDict:dict];
//    SPAlertController *alerController = [SPAlertController alertControllerWithCustomAlertView:hintV preferredStyle:SPAlertControllerStyleAlert animationType:SPAlertAnimationTypeDefault];
//    alerController.minDistanceToEdges = 50;
//    alerController.cornerRadiusForAlert = 10.f;
//    //关闭点击蒙版消失
//    alerController.tapBackgroundViewDismiss = NO;
//    alerController.needDialogBlur = NO;
//    [alerController setBackgroundViewAppearanceStyle:SPBackgroundViewAppearanceStyleTranslucent alpha:0.8];
//    
//    [currentVC presentViewController:alerController animated:YES completion:nil];
//    kWeakSelf(alerController);
//    hintV.deleteBlock = ^{
//        [weakalerController dismissViewControllerAnimated:YES completion:nil];
//    };
//    hintV.confirmBlock = ^{
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlPath]];
//        if (!isForce) {
//            [weakalerController dismissViewControllerAnimated:YES completion:nil];
//        }
//    };
//}
///**
// 比对iOS版本号字符串大小
// 
// @param serviceV 只能是三段以内,英文字符"."分隔的,每段必须是非负整数的版本字符串
// @return 从A到B,结果 -1 升序, 0 相等, 1降序
// */
//- (NSComparisonResult)serviceVersionNumber:(NSString *)serviceV{
//    NSArray *appVersionA = [[NSString null_str:kApp_version] componentsSeparatedByString:@"."];
//    NSArray *serverVersionA = [[NSString null_str:serviceV] componentsSeparatedByString:@"."];
//    NSComparisonResult result = NSOrderedSame;
//    
//    for (int i = 0; i < 3; i++) {
//        NSInteger appVersionS = 0;
//        NSInteger serverVersionS = 0;
//        if (i < appVersionA.count) {
//            appVersionS = [(NSString *)appVersionA[i] integerValue];
//        }
//        
//        if (i < serverVersionA.count) {
//            serverVersionS = [(NSString *)serverVersionA[i] integerValue];
//        }
//        
//        if (appVersionS > serverVersionS) {
//            result = NSOrderedAscending;//无更新
//            break;
//        }else if (appVersionS < serverVersionS){
//            result = NSOrderedDescending;//有
//            break;
//        }
//    }
//    return result;
//}
//-(void)show_a_or_b{
//    YJAppDelegate *appDelegae = (YJAppDelegate *)[UIApplication sharedApplication].delegate;
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    /***********企业签使用 statr********/
//    if (!isStartAB) {
//        [defaults setBool:YES forKey:@"a&b"];
//        [appDelegae add_a_or_b:YES];
//        return;
//    }
//    /***********企业签使用 end********/
//    
//    if ([[[DDUserInfo share] getTelPhone] isEqualToString:@"15678372447"]) {
//        [defaults setBool:NO forKey:@"a&b"];
//        [defaults synchronize];
//        
//        [appDelegae add_a_or_b:NO];
//        return;
//    }
//    if ([defaults boolForKey:@"a&b"]) {
//        [appDelegae add_a_or_b:YES];
//        return;
//    }
//    
//    [appDelegae add_a_or_b:NO];
//
//    [DZNetwork get_original_ph:api_get_app_aOrb np:nil class:nil success:^(id responseObject) {
//        if ([responseObject[@"code"] integerValue] == 200) {
//            responseObject = responseObject[@"data"];
//            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//            if ([responseObject[@"a_b"] integerValue] == 1) {
//                [appDelegae add_a_or_b:YES];
//                [defaults setBool:YES forKey:@"a&b"];
//            }else{
//                [appDelegae add_a_or_b:NO];
//                [defaults setBool:NO forKey:@"a&b"];
//            }
//            [defaults synchronize];
//        }
//    } failure:^(NSError *error) {
//        NSLog(@"%@",error);
//        [appDelegae add_a_or_b:NO];
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        [defaults setBool:NO forKey:@"a&b"];
//        [defaults synchronize];
//    }];
//}
@end
