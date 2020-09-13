//
//  DKMacro.h
//  dingdonghuigou
//
//  Created by Gavin on 2018/12/6.
//  Copyright © 2018 bei jing you ji. All rights reserved.
//

#ifndef DKMacro_h
#define DKMacro_h

/**********************常用 START****************************/

///获取版本号
#pragma mark ------------------版本信息x等---------------------
#define kApp_version [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#pragma mark ------------------屏幕高度、宽度---------------------

#define KScreen_Width ([[UIScreen mainScreen] bounds].size.width)
#define KScreen_Height ([[UIScreen mainScreen] bounds].size.height)

#pragma mark ------------------导航栏、tabBar 高度---------------------
#define kStatuHeight ([DKTools dk_statusBarHight])
#define kNavBarHeight 44.0
#define kTopHeight (kStatuHeight + kNavBarHeight)
#define kTabBarHeight (kStatuHeight>20?83:49)
#define kXoffsetHeight (kStatuHeight>20?20:0)
#define kXoffsetTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?40:0)

#define kWidth_fact(Size) (KScreen_Width*Size/375)
#define kHeight_fact(Size) (KScreen_Height*Size/667)

#pragma mark ------------------国际化转义---------------------
#define kLocal_text(text) NSLocalizedString(text, nil)

#pragma mark ------------------颜色宏定义---------------------
//自定义RGB颜色
#define kColor_rgb(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
//自定义十六进制颜色（使用需要有Color+HEX的扩展）
#define kColor_hex(HexColor) [UIColor colorWithHexString:HexColor]
//自定义十六进制颜色 带透明度（使用需要有Color+HEX的扩展）
#define kColor_hex_alpha(HexColor,Alpha) [UIColor colorWithHexString:HexColor alpha:Alpha]
///自定义十六进制颜色  适配暗黑模式   lightColor：白天模式颜色  darkColor：暗黑模式颜色（使用需要有Color+HEX的扩展）
#define kColor(lightColor,darkColor) [UIColor colorWithLightColorStr:lightColor DarkColor:darkColor]
// rgb颜色转换（16进制->10进制）
#define kColor_rgb16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//随机色
#define kColor_random [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

#pragma mark ------------------图片---------------------
//读取本地图片
#define kImage_local(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]
// UIImage对象
#define KImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]
// UIImage对象(本地)
#define KLImage(imageName) [UIImage imageNamed:kLocal_text(imageName)]
#pragma mark ------------------打印宏定义---------------------

//#ifdef DEBUG
#define kLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String])
//#else
//#define kLog(format, ...)
//#endif

#pragma mark ------------------字体设置---------------------
#define kF_H(size) [UIFont systemFontOfSize:size]
#define kF_BH(size) [UIFont boldSystemFontOfSize:size]
#define KF_H_F(size) KScreen_Width<321 ? [UIFont systemFontOfSize:size-1.5]:(KScreen_Width<376 ? [UIFont systemFontOfSize:size]:[UIFont systemFontOfSize:size+1.5])
#define KF_BH_F(size) KScreen_Width<321 ? [UIFont boldSystemFontOfSize:size-1.5]:(KScreen_Width<376 ? [UIFont boldSystemFontOfSize:size]:[UIFont boldSystemFontOfSize:size+1.5])

//#define KF_H_F(size) KScreen_Width<321 ? [UIFont systemFontOfSize:size-2.5]:(KScreen_Width<376 ? [UIFont systemFontOfSize:size-1.5]:[UIFont systemFontOfSize:size])
//#define KF_BH_F(size) KScreen_Width<321 ? [UIFont boldSystemFontOfSize:size-2.5]:(KScreen_Width<376 ? [UIFont boldSystemFontOfSize:size-1.5]:[UIFont boldSystemFontOfSize:size])

#pragma mark ------------------View圆角、View圆角和加边框和颜色---------------------
//设置圆角
#define KRadius(View,Radius) [View.layer setCornerRadius:(Radius)]; [View.layer setMasksToBounds:YES]
//设置圆角边框
#define kRadius_WC(View,Radius,Width,Color) [View.layer setCornerRadius:(Radius)]; [View.layer setMasksToBounds:YES]; [View.layer setBorderWidth:(Width)]; [View.layer setBorderColor:[Color CGColor]]
#define kRedius_Space(View,Radius,Size,Float,Color) [View.layer setCornerRadius:(Radius)]; [View.layer setShadowOffset:Size]; [View.layer setShadowOpacity:Float]; [View.layer setShadowColor:[Color CGColor]]
#pragma mark ------------------强引用、弱引用---------------------

#define kWeakSelf(type)  __weak typeof(type) weak##type = type
#define kStrongSelf(type)  __strong typeof(type) type = weak##type

#pragma mark --------------判断字符串、数组、字典 、对象 是否为空------------------
//字符串是否为空
#define kNull_str(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kNull_array(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define kNull_dict(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys.count == 0)
//对象是否为空
#define kNull_obj(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

#pragma mark ------------------沙盒相关---------------------
//获取temp
#define kPath_temp NSTemporaryDirectory()
//获取沙盒 Document
#define kPath_document [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPath_cache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

#pragma mark ------------------字符串相关---------------------

//#define kStr_Append(str1,str2) [NSString stringWithFormat:@"%@%@",str1,str2]
//#define S_ParaStr(str1,str2) [NSString stringWithFormat:@"%@=%@&",str1,str2]
//#define S_Int(i)            [NSString stringWithFormat:@"%d",i]
//#define S_Float(f)          [NSString stringWithFormat:@"%f",f]
//#define S_Integer(i)        [NSString stringWithFormat:@"%ld",(long)i]


//字符串高度
#define kStr_height(string,widthLimit,font) ([string boundingRectWithSize:CGSizeMake(widthLimit, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size.height)
//字符串宽度
#define kStr_width(string,widthLimit,font) ([string boundingRectWithSize:CGSizeMake(widthLimit, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size.width)

/**********************常用 END****************************/

#endif /* DKMacro_h */
