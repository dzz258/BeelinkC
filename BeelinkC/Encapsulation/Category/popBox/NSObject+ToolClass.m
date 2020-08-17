//
//  NSObject+ToolClass.m
//  dingdonghuigou
//
//  Created by Gavin on 2018/12/20.
//  Copyright © 2018 bei jing you ji. All rights reserved.
//

#import "NSObject+ToolClass.h"
//#import "DDCaptchaView.h"
#import <IQKeyboardManager/IQKeyboardManager.h>
//#import <WXApi.h>
//#import "DDQRCodeView.h"

@implementation NSObject (ToolClass)

//+(void)popCodeBox:(DKBaseViewController *)VC mobile:(NSString *)mobileS block:(nonnull CodeBlock)block{
//    __block DDCaptchaView *captchaV = [[DDCaptchaView alloc] initMobile:mobileS];
//
////    SPAlertController *alerController = [SPAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:SPAlertControllerStyleAlert animationType:SPAlertAnimationTypeAlpha customView:captchaV];
//
//    SPAlertController *alerController = [SPAlertController alertControllerWithCustomAlertView:captchaV preferredStyle:SPAlertControllerStyleAlert animationType:SPAlertAnimationTypeDefault];
////    alerController.minDistanceToEdges = 30;
//    alerController.cornerRadiusForAlert = 10.f;
//    //关闭点击蒙版消失
//    alerController.tapBackgroundViewDismiss = NO;
//    alerController.needDialogBlur = NO;
//    [alerController setBackgroundViewAppearanceStyle:SPBackgroundViewAppearanceStyleTranslucent alpha:0.8];
//    [[[alerController rac_signalForSelector:@selector(viewWillAppear:)] takeUntil:alerController.rac_willDeallocSignal] subscribeNext:^(id x) {
//        [IQKeyboardManager sharedManager].enable = NO;
//    }];
//    [[[alerController rac_signalForSelector:@selector(viewWillDisappear:)] takeUntil:alerController.rac_willDeallocSignal] subscribeNext:^(id x) {
//        [IQKeyboardManager sharedManager].enable = YES;
//    }];
//
//    [VC presentViewController:alerController animated:YES completion:nil];
//
//    kWeakSelf(VC);
//    kWeakSelf(alerController);
//    captchaV.deleteBlock = ^{
//        block(DKCodeBoxType_delete);
//        [weakalerController dismissViewControllerAnimated:YES completion:nil];
//    };
//    __weak DDCaptchaView *weakCaptchaV = captchaV;
//    captchaV.replayCodeBlock = ^{
//        weakVC.loading = YES;
//        [weakVC replayCode:^(BOOL isSuccess,BOOL isDelete) {
//            weakVC.loading = NO;
//
//            if (isSuccess) {
//                block(DKCodeBoxType_replayCode);
//                [weakCaptchaV startCountdown];
//            }else{
////                [DZNetwork hint_middle:@"发送失败"];
//            }
//            if (isDelete) {
//                [weakalerController dismissViewControllerAnimated:YES completion:nil];
//            }
//        }];
//    };
//
//    captchaV.nextBlock = ^(NSString * _Nonnull codeS) {
//        weakVC.loading = YES;
//        [weakVC nextCode:codeS result:^(BOOL isSuccess,BOOL isDelete) {
//            weakVC.loading = NO;
//            if (isSuccess) {
//                block(DKCodeBoxType_next);
//            }else{
////                [DZNetwork hint_error:@"请求失败"];
//            }
//            if (isDelete) {
//                [weakalerController dismissViewControllerAnimated:YES completion:nil];
//            }
//        }];
//    };
//}
+(void)popBox:(DKBaseViewController *)VC type:(NSInteger)type content:(NSString *)content block:(BtnBlock)block{
    [self popBox:VC isDelete:YES dict:@{
                           @"content":[NSString null_str:content],
                           @"type":@(type),
                           } block:^(DKBoxType typeI) {
                               block(typeI);
                           }];
}

+(void)popBox:(DKBaseViewController *)VC isDelete:(BOOL)isDelete type:(NSInteger)type content:(NSString *)content block:(BtnBlock)block{
    [self popBox:VC isDelete:isDelete dict:@{
                                        @"content":[NSString null_str:content],
                                        @"type":@(type),
                                        } block:^(DKBoxType typeI) {
                                            block(typeI);
                                        }];
}

+(void)popBox:(DKBaseViewController *)VC isDelete:(BOOL)isDelete dict:(nonnull NSDictionary *)dict block:(nonnull BtnBlock)block{
    DDHintView *hintV = [[DDHintView alloc] initDict: dict];

//    SPAlertController *alerController = [SPAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:SPAlertControllerStyleAlert animationType:SPAlertAnimationTypeAlpha customView:hintV];
//    alerController.cornerRadiusForAlert = 10.f;
//    //关闭点击蒙版消失
//    alerController.tapBackgroundViewDismiss = NO;
    SPAlertController *alerController = [SPAlertController alertControllerWithCustomAlertView:hintV preferredStyle:SPAlertControllerStyleAlert animationType:SPAlertAnimationTypeDefault];
        alerController.minDistanceToEdges = 50;
    alerController.cornerRadiusForAlert = 10.f;
    //关闭点击蒙版消失
    alerController.tapBackgroundViewDismiss = NO;
    alerController.needDialogBlur = NO;
    [alerController setBackgroundViewAppearanceStyle:SPBackgroundViewAppearanceStyleTranslucent alpha:0.8];

    [VC presentViewController:alerController animated:YES completion:nil];
    kWeakSelf(alerController);
    hintV.deleteBlock = ^{
        block(DKBoxType_cancel);
        [weakalerController dismissViewControllerAnimated:YES completion:nil];
    };
    hintV.confirmBlock = ^{
        block(DKBoxType_confirm);
        if (isDelete) {
            [weakalerController dismissViewControllerAnimated:YES completion:nil];
        }
    };
}

@end

//@implementation ShareModel
//
//@end
