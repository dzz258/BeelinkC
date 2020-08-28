//
//  UIColor+DKColor.m
//  BeelinkC
//
//  Created by Gavin on 2020/8/17.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "UIColor+DKColor.h"

@implementation UIColor (DKColor)

///十六进制字符串获取颜色
/// @param color 16进制色值  支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color{
    return [self colorWithHexString:color alpha:1.0f];
}

/// 十六进制字符串获取颜色
/// @param color 16进制色值  支持@“#123456”、 @“0X123456”、 @“123456”三种格式
/// @param alpha 透明度
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6){
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"]){
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]){
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6){
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}


/// 适配暗黑模式颜色   传入的UIColor对象
/// @param lightColor 普通模式颜色
/// @param darkColor 暗黑模式颜色
+ (UIColor *)colorWithLightColor:(UIColor *)lightColor DarkColor:(UIColor *)darkColor {
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull trainCollection) {
            if ([trainCollection userInterfaceStyle] == UIUserInterfaceStyleLight) {
                return lightColor;
            } else {
                return darkColor;
            }
        }];
    } else {
        return lightColor ? lightColor : (darkColor ? darkColor : [UIColor clearColor]);
    }
}

/// 适配暗黑模式颜色   颜色传入的是16进制字符串
/// @param lightColor 普通模式颜色
/// @param darkColor 暗黑模式颜色
+ (UIColor *)colorWithLightColorStr:(NSString *)lightColor DarkColor:(NSString *)darkColor{
    if (darkColor.length == 0) {
        darkColor = lightColor;
    }
    return [UIColor colorWithLightColor:[UIColor colorWithHexString:lightColor] DarkColor:[UIColor colorWithHexString:darkColor]];
}


/// 适配暗黑模式颜色   颜色传入的是16进制字符串 还有颜色的透明度
/// @param lightColor 普通模式颜色
/// @param lightAlpha 普通模式颜色透明度
/// @param darkColor 暗黑模式颜色透明度
/// @param darkAlpha 暗黑模式颜色
+ (UIColor *)colorWithLightColorStr:(NSString *)lightColor WithLightColorAlpha:(CGFloat)lightAlpha DarkColor:(NSString *)darkColor WithDarkColorAlpha:(CGFloat)darkAlpha{
    return [UIColor colorWithLightColor:[UIColor colorWithHexString:lightColor alpha:lightAlpha] DarkColor:[UIColor colorWithHexString:darkColor alpha:darkAlpha]];
}
//绘制渐变色颜色的方法 shade
+ (CAGradientLayer *)color_shade:(CGSize)size colors:(NSArray *)colors{//fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr{
    //    CAGradientLayer类对其绘制渐变背景颜色、填充层的形状(包括圆角)
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, size.width, size.height);

    NSMutableArray *mutColors = [[NSMutableArray alloc] init];
    for (int i= 0; i<colors.count; i++) {
        [mutColors addObject:(__bridge id)[UIColor colorWithHexString:colors[i]].CGColor];
    }
    //  创建渐变色数组，需要转换为CGColor颜色
    gradientLayer.colors = mutColors;
//    gradientLayer.colors = @[(__bridge id)[UIColor colorWithHexString:fromHexColorStr].CGColor,(__bridge id)[UIColor colorWithHexString:toHexColorStr].CGColor];
    
    //  设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    
    //  设置颜色变化点，取值范围 0.0~1.0
    gradientLayer.locations = @[@0,@1];
    
    return gradientLayer;
}
@end
