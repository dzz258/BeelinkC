//
//  NSObject+ToolClass.h
//  dingdonghuigou
//
//  Created by Gavin on 2018/12/20.
//  Copyright © 2018 bei jing you ji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIViewController+PopoutProcess.h"
#import "DKBaseViewController.h"
#import "SPAlertController.h"
#import "DDHintView.h"

//NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,DKBoxType) {
    DKBoxType_cancel = 0,//
    DKBoxType_confirm,
};

typedef void(^BtnBlock)(DKBoxType typeI);


@interface NSObject (ToolClass)
/**
 弹框 二次封装

 @param VC 当前控制器
 @param type 弹框类型 （ 0 默认 取消、确定按钮、无hintL内容；2、确定按钮、无hintL内容）
 @param content 提示内容
 @param block 点击确定按钮回调
 */
+(void)popBox:(DKBaseViewController *)VC type:(NSInteger)type content:(NSString *)content block:(BtnBlock)block;
/**
 弹框 二次封装

 @param VC 当前控制器
 @param isDelete 点击确定按钮后是否删除弹框
 @param type 弹框类型 （ 0 默认 取消、确定按钮、无hintL内容；2、确定按钮、无hintL内容）
 @param content 提示内容
 @param block 点击确定按钮回调
 */
+(void)popBox:(DKBaseViewController *)VC isDelete:(BOOL)isDelete type:(NSInteger)type content:(NSString *)content block:(BtnBlock)block;
/**
 弹框

 @param VC 当前控制器
 @param isDelete 点击确定按钮后是否删除弹框
 @param dict 数据源 {
                       title : 标题 （默认 温馨提示）
                       content: 描述内容  必填
                       hint : 除描述内容外的提示内容 默认 无  type 为 1、3时，该参数必填
                       cancel : 取消按钮文字 默认 取消
                       confirm : 确定按钮 默认 确定
                       type  ：弹框类型 （ 0 默认 取消、确定按钮、无hintL内容；1 取消、确定按钮、带hintL内容；2、确定按钮、无hintL内容；3、确定按钮、带hintL内容）
                    }
示例： @{@"title":@"",@"content":@"",@"hint":@"",@"cancel":@"",@"confirm":@"",@"type":@()}
 @param block 点击确定按钮回调
 */
+(void)popBox:(DKBaseViewController *)VC isDelete:(BOOL)isDelete dict:(NSDictionary *)dict block:(BtnBlock)block;


@end

//NS_ASSUME_NONNULL_END
