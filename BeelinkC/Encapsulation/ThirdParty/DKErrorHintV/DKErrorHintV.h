//
//  DKErrorHintV.h
//  DouKui
//
//  Created by Gavin on 2017/11/13.
//  Copyright © 2017年 ShenZhen GaoShengTong Computer software development Co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>
//如果有什么不满足的可自行优化，添加
//注意：如果是dkNoDataView的默认图片，则无需继续图片配置，且为空
#pragma mark 默认信息配置
/**
 *  没有数据：默认图
 */
#define dkNoDataImage @"null_icon"
#define dkNoDataHint @"这里空空如也～"
/**
 *  没有网络：默认图
 */
#define dkNoInternetImage @"network"
#define dkNoInternetHint @"网络连接失败，请稍后尝试"
/**
 *  服务器请求失败：默认图
 */
#define dkNoServerImage @"requestFailed"
#define dkNoServerHint @"加载失败，点击重试"
/**
 *  其他状态
 */
#define dkOtherStatusImageName @"nodata"

#pragma mark  配置结束

typedef enum
{
    dkNoInternet = 0, // default
    dkNoServer,
    dkNoData,
} dkNoDataType;

@interface DKErrorHintV : UIView

/**
 加载显示空数据处理 二次封装
描述：无网络时使用
@param frame frame
*/
- (instancetype)initNotNetHintWithFrame:(CGRect)frame;
/**
 加载显示空数据处理 二次封装
描述：加载失败时使用
@param frame frame
*/
- (instancetype)initShowHintWithFrame:(CGRect)frame;
/**
  加载显示空数据处理 二次封装
 @param frame frame
 @param type 显示类型
 */
- (instancetype)initShowHintWithFrame:(CGRect)frame showType:(dkNoDataType)type;
/**
 加载显示空数据处理 二次封装
 @param frame frame
 @param type 显示类型
 */
- (instancetype)initShowHintWithFrame:(CGRect)frame showType:(dkNoDataType)type hintText:(NSString *)hintText;
/**
加载显示空数据处理

@param frame frame
@param type 显示类型
@param imageName 显示图片名称
@param hint 提示内容
*/
- (instancetype)initShowFrame:(CGRect)frame showType:(dkNoDataType)type imageName:(NSString *)imageName hint:(NSString *)hint;
/**
 加载显示空数据处理

 @param frame frame
 @param type 显示类型
 @param imageName 显示图片名称
 @param hint 提示内容
 */
-(void)addSupFrame:(CGRect)frame showType:(dkNoDataType)type imageName:(NSString *)imageName hint:(NSString *)hint;

@property (nonatomic,copy)  void(^dkNoDataViewBlock)(void);
/**
 删除View
 */
-(void)deleteView;

@end
