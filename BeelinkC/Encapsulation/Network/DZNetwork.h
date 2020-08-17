//
//  DZNetwork.h
//  onebyone
//
//  Created by Gavin on 2018/1/24.
//  Copyright © 2018年 ShenZhen GaoShengTong Computer software development Co., LTD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZNetworkHelper.h"
#import "MJExtension.h"

/** 请求成功的Block */
typedef void(^RequestSuccess)(id data);

/** 请求失败的Block */
typedef void(^RequestFailed)(NSError *error);

/** 文件上传进度Block */
typedef void(^UpProgress)(NSProgress *progress);

typedef void(^DataBlcok)(NSInteger code,NSInteger taobao,NSInteger auth);

@interface DZNetwork : NSObject

/**
 获取用户认证情况

 @param dataBlock block 成功数据
 */
//+(void)certificationStatus:(DataBlcok)dataBlock;
/**
 post通用请求
 
 @param ph 接口地址（ph==>path）
 @param np 不需要加密的参数（np==>normalParams）
 @param mc 数据模型（mc==>modelClass）
 @param success block 成功数据
 @param failure block 接口访问失败数据
 */
+(void)post_ph:(NSString *)ph np:(id)np class:(__unsafe_unretained Class)mc success:(RequestSuccess)success failure:(RequestFailed)failure;
/**
get通用请求

 @param ph 接口地址 （ph==>path）
 @param np 不需要加密的参数（np==>normalParams）
 @param mc 数据模型（mc==>modelClass）
 @param success block 成功数据
 @param failure 接口访问失败数据
 */
+(void)get_ph:(NSString *)ph np:(id)np class:(__unsafe_unretained Class)mc success:(RequestSuccess)success failure:(RequestFailed)failure;
/**
 图片压缩处理

 @param tempImage 需要处理的图片
 @return 处理后的data 数据
 */
+(NSData *)pictureWithImage:(UIImage *)tempImage;
+(NSString *)getImageName;
+(NSString *)picBase64:(UIImage *)image;
/// 获取网络图片
/// @param fileURL 图片地址
+(UIImage *) getImageFromURL:(NSString *)fileURL;
/**
  网络加载提示 下面弹出显示

 @param hintText hintText 提示内容
 */
+(void)hint_bottom:(NSString *)hintText;
/**
 网络加载提示 中间弹出显示
 
 @param hintText hintText 提示内容
 */
+(void)hint_middle:(NSString *)hintText;
/**
 网络加载提示 上面弹出显示
 
 @param hintText hintText 提示内容
 */
+(void)hint_top:(NSString *)hintText;
/**
 网络加载提示 状态栏上弹出显示
 
 @param hintText hintText 提示内容
 */
+(void)hint_statuBar:(NSString *)hintText;
/**
 网络加载提示 导航栏上弹出显示
 
 @param hintText hintText 提示内容
 */
+(void)hint_navigation:(NSString *)hintText;
/**
 网络加载成功提示

 @param hintText 提示内容
 */
+(void)hint_success:(NSString *)hintText;
/**
 网络加载失败提示

 @param hintText 提示内容
 */
+(void)hint_error:(NSString *)hintText;

/**
 图片压缩

 @param sourceImage 原始图片
 @param maxSize 指定压缩后的大小
 @return 压缩后的data数据
 */
+(NSData *)resetSizeOfImageData:(UIImage *)sourceImage maxSize:(NSInteger)maxSize;
/// 压缩指定大小图片
/// //缩略图要小于32KB，否则无法调起微信,32KB = 32*1024B=32678
/// UIImage *pressImage = [DZNetwork compressImage:picture toByte:32765];
/// @param image 图片
/// @param maxLength 大小
+ (UIImage *)compressImage:(UIImage *)image toByte:(NSUInteger)maxLength;
@end

