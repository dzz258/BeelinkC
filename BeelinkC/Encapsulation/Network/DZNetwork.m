//
//  DZNetwork.m
//  onebyone
//
//  Created by Gavin on 2018/1/24.
//  Copyright © 2018年 ShenZhen GaoShengTong Computer software development Co., LTD. All rights reserved.
//

#import "DZNetwork.h"
#import <AFNetworking/AFNetworking.h>

@implementation DZNetwork

//+(void)post_original_ph:(NSString *)ph np:(id)np class:(__unsafe_unretained Class)mc success:(RequestSuccess)success failure:(RequestFailed)failure{
//    
//    if (![ph hasPrefix:@"http://"]&&![ph hasPrefix:@"https://"]) {
//        ph = [NSString stringWithFormat:@"%@/%@",API_MAIN_URL,[NSString null_str:ph]];
//    }
//    __weak typeof(self) weakself = self;
//    NSMutableDictionary *param = [[NSMutableDictionary alloc] initWithDictionary:np];
//    if ([[DKUserInfo share] isLogin]) {
//        [param setObject:[[DKUserInfo share] getToken] forKey:@"token"];
//    }
//    [DZNetworkHelper POST:ph parameters:param success:^(id responseObject) {
//        kLog(@"post == %@",[self jsonToString:responseObject]);
//        if (mc!=nil) {
//            id class = [mc mj_objectWithKeyValues:responseObject];
//            success(class);
//        }else{
//            success(responseObject);
//        }
//        if ([responseObject[@"error_code"] integerValue] == -1){
//            kLog(@"token 失效，移除会员信息");
//            //移除数据
//            [[DKUserInfo share] clearUserInfo];
//            [weakself hint_middle:[NSString null_str:responseObject[@"error_msg"]]];
//            failure([NSError errorWithDomain:[NSString null_str:responseObject[@"error_msg"]] code:2 userInfo:nil]);
//        }
//    } failure:^(NSError *error) {
//        failure(error);
//        [weakself hint_middle:error.localizedDescription];
//    }];
//}
//
//+(void)get_original_ph:(NSString *)ph np:(id)np class:(__unsafe_unretained Class)mc success:(RequestSuccess)success failure:(RequestFailed)failure{
//
//    if (![ph hasPrefix:@"http://"]&&![ph hasPrefix:@"https://"]) {
//        ph = [NSString stringWithFormat:@"%@/%@",API_MAIN_URL,[NSString null_str:ph]];
//    }
//    [DZNetworkHelper GET:ph parameters:np success:^(id responseObject) {
//        kLog(@"get == %@",[self jsonToString:responseObject]);
//        if (mc!=nil) {
//            id class = [mc mj_objectWithKeyValues:responseObject];
//            success(class);
//        }else{
//            success(responseObject);
//        }
//    } failure:^(NSError *error) {
//        failure(error);
//    }];
//}
//+(void)external_post_ph:(NSString *)ph np:(id)np class:(__unsafe_unretained Class)mc success:(RequestSuccess)success failure:(RequestFailed)failure{
//    if (![DZNetworkHelper isNetwork]) {
//        [DZNetwork hint_middle:@"网络连接失败"];
//        failure(nil);
//        return;
//    }
//    if (![ph hasPrefix:@"http://"]&&![ph hasPrefix:@"https://"]) {
//        ph = [NSString stringWithFormat:@"%@/%@",API_MAIN_URL,[NSString null_str:ph]];
//    }
//    
//    NSMutableDictionary *param = [[NSMutableDictionary alloc] initWithDictionary:np];
//    if ([[DKUserInfo share] isLogin]) {
//        [param setObject:[[DKUserInfo share] getToken] forKey:@"token"];
//    }
//    
//    [DZNetworkHelper POST:ph parameters:param success:^(id responseObject) {
//        kLog(@"post == %@",[self jsonToString:responseObject]);
//        if (mc!=nil) {
//            id class = [mc mj_objectWithKeyValues:responseObject];
//            success(class);
//        }else{
//            success(responseObject);
//        }
//    } failure:^(NSError *error) {
//        failure(error);
//    }];
//}

+(void)post_ph:(NSString *)ph np:(id)np class:(__unsafe_unretained Class)mc success:(RequestSuccess)success failure:(RequestFailed)failure{
    if (![DZNetworkHelper isNetwork]) {
        [DZNetwork hint_middle:@"网络连接失败"];
        failure(nil);
        return;
    }
    __weak typeof(self) weakself = self;
    if (![ph hasPrefix:@"http://"]&&![ph hasPrefix:@"https://"]) {
        ph = [NSString stringWithFormat:@"%@/%@",API_MAIN_URL,[NSString null_str:ph]];
    }
    NSMutableDictionary *param = [[NSMutableDictionary alloc] initWithDictionary:np];
    if ([[DKUserInfo share] isLogin]) {
        [param setObject:[[DKUserInfo share] getToken] forKey:@"token"];
    }

    [DZNetworkHelper POST:ph parameters:param success:^(id responseObject) {
        kLog(@"post == %@",[self jsonToString:responseObject]);
        if ([responseObject[@"error_code"] integerValue] == 0) {
            if (mc!=nil) {
                id class = [mc mj_objectWithKeyValues:responseObject];
                success(class);
            }else{
                success(responseObject[@"data"]);
            }
        }else if ([responseObject[@"error_code"] integerValue] == -1){
            kLog(@"token 失效，移除会员信息");
            //移除数据
            [[DKUserInfo share] clearUserInfo];
            [weakself hint_middle:[NSString null_str:responseObject[@"error_msg"]]];
            failure([NSError errorWithDomain:[NSString null_str:responseObject[@"error_msg"]] code:-1 userInfo:nil]);
        }else{
            [weakself hint_middle:[NSString null_str:responseObject[@"error_msg"]]];
            failure([NSError errorWithDomain:[NSString null_str:responseObject[@"error_msg"]] code:[responseObject[@"error_code"] integerValue] userInfo:nil]);
        }
    } failure:^(NSError *error) {
        failure(error);
        [weakself hint_middle:error.localizedDescription];
    }];
    
}
+(void)get_ph:(NSString *)ph np:(id)np class:(__unsafe_unretained Class)mc success:(RequestSuccess)success failure:(RequestFailed)failure{
//    if (![DZNetworkHelper isNetwork]) {
//        [DZNetwork hint_middle:@"网络连接失败"];
//        failure(nil);
//        return;
//    }
    __weak typeof(self) weakself = self;
    if (![ph hasPrefix:@"http://"]&&![ph hasPrefix:@"https://"]) {
        ph = [NSString stringWithFormat:@"%@/%@",API_MAIN_URL,[NSString null_str:ph]];
    }
    
    NSMutableDictionary *param = [[NSMutableDictionary alloc] initWithDictionary:np];
    if ([[DKUserInfo share] isLogin]) {
        [param setObject:[[DKUserInfo share] getToken] forKey:@"token"];
    }

    [DZNetworkHelper GET:ph parameters:param success:^(id responseObject) {
        kLog(@"get == %@",[self jsonToString:responseObject]);
        
        if ([responseObject[@"error_code"] integerValue] == 0) {
            if (mc!=nil) {
                id class = [mc mj_objectWithKeyValues:responseObject];
                success(class);
            }else{
                success(responseObject[@"data"]);
            }
        }else if ([responseObject[@"error_code"] integerValue] == -1){
            kLog(@"token 失效，移除会员信息");
            //移除数据
            [[DKUserInfo share] clearUserInfo];
            [weakself hint_middle:[NSString null_str:responseObject[@"error_msg"]]];
            failure([NSError errorWithDomain:[NSString null_str:responseObject[@"error_msg"]] code:-1 userInfo:nil]);
        }else{
            [weakself hint_middle:[NSString null_str:responseObject[@"error_msg"]]];
            failure([NSError errorWithDomain:[NSString null_str:responseObject[@"error_msg"]] code:[responseObject[@"error_code"] integerValue] userInfo:nil]);
        }
    } failure:^(NSError *error) {
        failure(error);
        [weakself hint_middle:error.localizedDescription];
    }];
}

+(NSString *)getImageName{
    return [NSString stringWithFormat:@"%@.png",[NSString getRandomStringWithNum:8]];
}
+(NSString *)getImagekey:(NSString *)key prefix:(NSString *)prefix suffix:(NSString *)suffix{
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"yyyyMMddHHmmss"];
    NSString *str = [NSString stringWithFormat:@"%@_%@_%@%@.%@",prefix,key, [format stringFromDate:[NSDate date]],[NSString getRandomStringWithNum:4],suffix];
    return str;
}
+(NSString *)picBase64:(UIImage *)image{
    NSString *encodedImageStr = [[self pictureWithImage:image] base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    //转base64后去除空格换行（若后台已处理则无需处理）
//    encodedImageStr = [self removeSpaceAndNewline:encodedImageStr];
    if (encodedImageStr.length == 0) {
        return @"";
    }
    return encodedImageStr;
}
+(NSString *)removeSpaceAndNewline:(NSString *)str{
    NSString *temp = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return temp;
}
#pragma mark - 图片处理
+(NSData *)pictureWithImage:(UIImage *)tempImage newSize:(CGSize)newSize{
    UIGraphicsBeginImageContext(newSize);
    [tempImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return UIImageJPEGRepresentation(newImage, 0.1);
}
+(NSData *)pictureWithImage:(UIImage *)tempImage{
    NSData* imageData = [self pictureWithImage:tempImage newSize:tempImage.size];
    return imageData;
}

+ (NSString *)jsonToString:(id)data {
    if(data == nil) { return nil; }
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
+(void)hint_bottom:(NSString *)hintText{
    if (hintText.length == 0) {
        return;
    }
    [EasyTextView showText:[NSString null_str:hintText] config:^EasyTextConfig *{
        EasyTextConfig *config = [EasyTextConfig shared];
        config.bgColor = [UIColor lightGrayColor] ;
        config.shadowColor = [UIColor clearColor] ;
        config.animationType = TextAnimationTypeFade;
        config.statusType = TextStatusTypeBottom ;
        return config ;
    }];
}
+(void) hint_middle:(NSString *)hintText{
    if (hintText.length == 0) {
        return;
    }
    [EasyTextView showText:[NSString null_str:hintText] config:^EasyTextConfig *{
        EasyTextConfig *config = [EasyTextConfig shared];
        config.bgColor = [UIColor lightGrayColor] ;
        config.shadowColor = [UIColor clearColor] ;
        config.animationType = TextAnimationTypeFade;
        config.statusType = TextStatusTypeMidden ;
        return config ;
    }];
}
+(void)hint_top:(NSString *)hintText{
    if (hintText.length == 0) {
        return;
    }
    [EasyTextView showText:[NSString null_str:hintText] config:^EasyTextConfig *{
        EasyTextConfig *config = [EasyTextConfig shared];
        config.bgColor = [UIColor lightGrayColor] ;
        config.shadowColor = [UIColor clearColor] ;
        config.animationType = TextAnimationTypeFade;
        config.statusType = TextStatusTypeTop;
        return config ;
    }];
}
+(void)hint_statuBar:(NSString *)hintText{
    if (hintText.length == 0) {
        return;
    }
    [EasyTextView showText:[NSString null_str:hintText] config:^EasyTextConfig *{
        EasyTextConfig *config = [EasyTextConfig shared];
        config.bgColor = [UIColor lightGrayColor] ;
        config.shadowColor = [UIColor clearColor] ;
        config.animationType = TextAnimationTypeFade;
        config.statusType = TextStatusTypeStatusBar;
        return config ;
    }];
}
+(void)hint_navigation:(NSString *)hintText{
    if (hintText.length == 0) {
        return;
    }
    [EasyTextView showText:[NSString null_str:hintText] config:^EasyTextConfig *{
        EasyTextConfig *config = [EasyTextConfig shared];
        config.bgColor = [UIColor lightGrayColor] ;
        config.shadowColor = [UIColor clearColor] ;
        config.animationType = TextAnimationTypeFade;
        config.statusType = TextStatusTypeNavigation;
        return config ;
    }];
}
+(void)hint_success:(NSString *)hintText{
    if (hintText.length == 0) {
        return;
    }
    [EasyTextView showSuccessText:hintText];
}
+(void)hint_error:(NSString *)hintText{
    if (hintText.length == 0) {
        return;
    }
    [EasyTextView showErrorText:hintText];
}
/// 获取网络图片
/// @param fileURL <#fileURL description#>
+(UIImage *) getImageFromURL:(NSString *)fileURL
{
    UIImage * result;
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    result = [UIImage imageWithData:data];
    return result;
}
#pragma mark - 压缩图片
+ (UIImage *)compressImage:(UIImage *)image toByte:(NSUInteger)maxLength {
    // Compress by quality
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(image, compression);
    if (data.length < maxLength) return image;

    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(image, compression);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    UIImage *resultImage = [UIImage imageWithData:data];
    if (data.length < maxLength) return resultImage;

    // Compress by size
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)maxLength / data.length;
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
        UIGraphicsBeginImageContext(size);
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(resultImage, compression);
    }

    return resultImage;
}
#pragma mark - 压缩图片到指定大小(单位KB)
+(NSData *)resetSizeOfImageData:(UIImage *)sourceImage maxSize:(NSInteger)maxSize {
    //先判断当前质量是否满足要求，不满足再进行压缩
    __block NSData *finallImageData = UIImageJPEGRepresentation(sourceImage,1.0);
    NSUInteger sizeOrigin   = finallImageData.length;
    NSUInteger sizeOriginKB = sizeOrigin / 1000;
    
    if (sizeOriginKB <= maxSize) {
        return finallImageData;
    }
    
    //获取原图片宽高比
    CGFloat sourceImageAspectRatio = sourceImage.size.width/sourceImage.size.height;
    //先调整分辨率
    CGSize defaultSize = CGSizeMake(1024, 1024/sourceImageAspectRatio);
    UIImage *newImage = [self newSizeImage:defaultSize image:sourceImage];
    
    finallImageData = UIImageJPEGRepresentation(newImage,1.0);
    
    //保存压缩系数
    NSMutableArray *compressionQualityArr = [NSMutableArray array];
    CGFloat avg   = 1.0/250;
    CGFloat value = avg;
    for (int i = 250; i >= 1; i--) {
        value = i*avg;
        [compressionQualityArr addObject:@(value)];
    }
    
    /*
     调整大小
     说明：压缩系数数组compressionQualityArr是从大到小存储。
     */
    //思路：使用二分法搜索
    __block NSData *canCompressMinData = [NSData data];//当无法压缩到指定大小时，用于存储当前能够压缩到的最小值数据。
    [self halfFuntion:compressionQualityArr image:newImage sourceData:finallImageData maxSize:maxSize resultBlock:^(NSData *finallData, NSData *tempData) {
        finallImageData = finallData;
        canCompressMinData = tempData;
    }];
    //如果还是未能压缩到指定大小，则进行降分辨率
    while (finallImageData.length == 0) {
        //每次降100分辨率
        CGFloat reduceWidth = 100.0;
        CGFloat reduceHeight = 100.0/sourceImageAspectRatio;
        if (defaultSize.width-reduceWidth <= 0 || defaultSize.height-reduceHeight <= 0) {
            break;
        }
        defaultSize = CGSizeMake(defaultSize.width-reduceWidth, defaultSize.height-reduceHeight);
        UIImage *image = [self newSizeImage:defaultSize
                                      image:[UIImage imageWithData:UIImageJPEGRepresentation(newImage,[[compressionQualityArr lastObject] floatValue])]];
        [self halfFuntion:compressionQualityArr image:image sourceData:UIImageJPEGRepresentation(image,1.0) maxSize:maxSize resultBlock:^(NSData *finallData, NSData *tempData) {
            finallImageData = finallData;
            canCompressMinData = tempData;
        }];
    }
    //如果分辨率已经无法再降低，则直接使用能够压缩的那个最小值即可
    if (finallImageData.length==0) {
        finallImageData = canCompressMinData;
    }
    return finallImageData;
}
#pragma mark 调整图片分辨率/尺寸（等比例缩放）
///调整图片分辨率/尺寸（等比例缩放）
+(UIImage *)newSizeImage:(CGSize)size image:(UIImage *)sourceImage {
    CGSize newSize = CGSizeMake(sourceImage.size.width, sourceImage.size.height);
    
    CGFloat tempHeight = newSize.height / size.height;
    CGFloat tempWidth = newSize.width / size.width;
    
    if (tempWidth > 1.0 && tempWidth > tempHeight) {
        newSize = CGSizeMake(sourceImage.size.width / tempWidth, sourceImage.size.height / tempWidth);
    } else if (tempHeight > 1.0 && tempWidth < tempHeight) {
        newSize = CGSizeMake(sourceImage.size.width / tempHeight, sourceImage.size.height / tempHeight);
    }
    
    //    UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 1);
    [sourceImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
#pragma mark 二分法
///二分法，block回调中finallData长度不为零表示最终压缩到了指定的大小，如果为零则表示压缩不到指定大小。tempData表示当前能够压缩到的最小值。
+(void)halfFuntion:(NSArray *)arr image:(UIImage *)image sourceData:(NSData *)finallImageData maxSize:(NSInteger)maxSize resultBlock:(void(^)(NSData *finallData, NSData *tempData))block {
    NSData *tempData = [NSData data];
    NSUInteger start = 0;
    NSUInteger end = arr.count - 1;
    NSUInteger index = 0;
    
    NSUInteger difference = NSIntegerMax;
    while(start <= end) {
        index = start + (end - start)/2;
        
        finallImageData = UIImageJPEGRepresentation(image,[arr[index] floatValue]);
        
        NSUInteger sizeOrigin = finallImageData.length;
        NSUInteger sizeOriginKB = sizeOrigin / 1000;
        NSLog(@"当前降到的质量：%ld", (unsigned long)sizeOriginKB);
        //        NSLog(@"\nstart：%zd\nend：%zd\nindex：%zd\n压缩系数：%lf", start, end, (unsigned long)index, [arr[index] floatValue]);
        
        if (sizeOriginKB > maxSize) {
            start = index + 1;
        } else if (sizeOriginKB < maxSize) {
            if (maxSize-sizeOriginKB < difference) {
                difference = maxSize-sizeOriginKB;
                tempData = finallImageData;
            }
            if (index<=0) {
                break;
            }
            end = index - 1;
        } else {
            break;
        }
    }
    NSData *d = [NSData data];
    if (tempData.length==0) {
        d = finallImageData;
    }
    if (block) {
        block(tempData, d);
    }
    //    return tempData;
}
@end
