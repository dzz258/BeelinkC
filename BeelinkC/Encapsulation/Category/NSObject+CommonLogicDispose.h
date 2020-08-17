//
//  NSObject+CommonLogicDispose.h
//  ZZH
//
//  Created by Gavin on 2018/11/26.
//  Copyright © 2018 zhoutong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CommonLogicDispose)
/** 字符串空处理 返回 空 */
+(NSString *)null_str:(NSString *)str;
/** 字符串空处理 返回 0 */
+(NSString *)null_int:(NSInteger)index;
/** 判断类是否为空 */
+(BOOL)bool_type:(id)classT;
/** 拨打客服电话 tel 为空 默认拨打 客服电话 */
+(void)callTel:(NSString *)tel;
/**
 获取UUID
 */
+(NSString *)getUUID;
/**
 图片拼接地址
 @param path 图片路径
 */
+(NSURL *)picUrl:(NSString *)path;
/**
 H5 地址

 @param path H5 路径
 */
+(NSString *)http_pathStr:(NSString *)path;
/**
 随机生成 字母+数字的随机数
 
 @param num 随机数位数
 @return 生成的随机数
 */
+(NSString *)getRandomStringWithNum:(NSInteger)num;
/**
 随机生成 大小写字母+数字的随机数

 @param num 随机数位数
 @return 生成的随机数
 */
+(NSString *)returnRandomStringtWithNum:(NSInteger)num;
/**
 联系电话格式去除

 @param str 原字符串
 @return 处理后的字符串
 */
+(NSString *)dislodgeSpecialDispose:(NSString *)str;
/**
 转 md5

 @param string 明文
 @return md5后的密文
 */
+(NSString *)md5String:(NSString *)string;
@end

NS_ASSUME_NONNULL_END
