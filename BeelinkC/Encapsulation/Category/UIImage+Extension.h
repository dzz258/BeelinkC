//
//  UIImage+Extension.h
//  JYJ微博
//
//  Created by JYJ on 15/3/11.
//  Copyright (c) 2015年 JYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GradientType) {
    
    GradientTypeTopToBottom = 0,//从上到小
    
    GradientTypeLeftToRight = 1,//从左到右
    
    GradientTypeUpleftToLowright = 2,//左上到右下
    
    GradientTypeUprightToLowleft = 3,//右上到左下
    
};

@interface UIImage (Extension)

/**
 *  用颜色返回一张图片
 */
+ (UIImage *)createImageWithColor:(UIColor*) color;

+ (UIImage *)startColor:(UIColor *)startColor endColor:(UIColor *)endColor;

+ (UIImage *)imageColors:(NSArray*)colors type:(GradientType)gradientType imgSize:(CGSize)imgSize;

/**
 字符串生成二维码

 @param string 需要生成的字符串
 @return 生成后的图片
 */
+(UIImage *)createQRCodeImageWithString:(NSString *)string;
+ (UIImage*)createQRWithString:(NSString*)text QRSize:(CGSize)size;
@end
