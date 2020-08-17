//
//  DDHintView.h
//  dingdonghuigou
//
//  Created by Gavin on 2018/12/24.
//  Copyright © 2018 bei jing you ji. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DDHintView : UIView

/**
 dict 参数代表含义
 {
 title : 标题 （默认 温馨提示）
 content: 描述内容  必填
 hint : 除描述内容外的提示内容 默认 无  type 为 1、3时，该参数必填
 cancel : 取消按钮文字 默认 取消
 confirm : 确定按钮 默认 确定
 type  ：弹框类型 （ 0 默认 取消、确定按钮、无hintL内容；1 取消、确定按钮、带hintL内容；2、确定按钮、无hintL内容；3、确定按钮、带hintL内容）
 
 }
 */
/**
 样例代码 可复制直接使用
 @{
 @"title":@"",
 @"content":@"",
 @"hint":@"",
 @"cancel":@"",
 @"confirm":@"",
 @"type":@(),
 }
 */
-(instancetype)initDict:(NSDictionary *)dict;


/**
 关闭操作回调
 */
@property (nonatomic,copy) void(^deleteBlock)(void);
/**
 确定操作回调
 */
@property (nonatomic,copy) void(^confirmBlock)(void);

@end

NS_ASSUME_NONNULL_END
