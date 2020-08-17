//
//  NSObject+CommonLogicDispose.m
//  ZZH
//
//  Created by Gavin on 2018/11/26.
//  Copyright © 2018 zhoutong. All rights reserved.
//

#import "NSObject+CommonLogicDispose.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSObject (CommonLogicDispose)

+(NSString *)null_str:(NSString *)str{
    NSString *strr=[NSString stringWithFormat:@"%@",str];
    if (strr.length==0||strr==nil||[strr isEqualToString:@"<null>"]||[strr isEqualToString:@"(null)"]){
        str=@"";
    }
    return [NSString stringWithFormat:@"%@",str];
}
+(NSString *)null_int:(NSInteger)index{
//    NSString *strr=[NSString stringWithFormat:@"%@",str];
//    if (strr.length==0||strr==nil||[strr isEqualToString:@"<null>"]||[strr isEqualToString:@"(null)"]){
//        str=@"0";
//    }
    return [NSString stringWithFormat:@"%ld",(long)index];
}
+(BOOL)bool_type:(id)classT{
    if (classT == nil || [classT isEqual:[NSNull null]]) {
        return YES;
    }
    return NO;
}
+(void)callTel:(NSString *)tel{
//     NSString *callPhone;
//    if (kNull_str(tel)) {
//        callPhone = [NSString stringWithFormat:@"telprompt://%@", [[DDUserInfo share] getCallTel]];
//    }else{
//        callPhone = [NSString stringWithFormat:@"telprompt://%@",tel];
//    }
//    if (@available(iOS 10.0, *)) {
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callPhone] options:@{} completionHandler:nil];
//    }else{
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callPhone]];
//    }
}

+(NSString *)http_pathStr:(NSString *)path{
    if ([path hasPrefix:@"https://"]||[path hasPrefix:@"http://"]) {
        return path;
    }
    return [[API_H5_URL stringByAppendingString:@"/"] stringByAppendingString:[NSString null_str:path]];
}

+(NSURL *)picUrl:(NSString *)path{
    if ([path hasPrefix:@"https://"]||[path hasPrefix:@"http://"]) {
        return [NSURL URLWithString:path];
    }
    return [NSURL URLWithString:[API_PIC_URL stringByAppendingString:[NSString null_str:path]]];
}

+(NSString *)getRandomStringWithNum:(NSInteger)num{
    NSString *string = [[NSString alloc]init];
    for (int i = 0; i < num; i++) {
        int number = arc4random() % 36;
        if (number < 10) {
            int figure = arc4random() % 10;
            NSString *tempString = [NSString stringWithFormat:@"%d", figure];
            string = [string stringByAppendingString:tempString];
        }else {
            int figure = (arc4random() % 26) + 97;
            char character = figure;
            NSString *tempString = [NSString stringWithFormat:@"%c", character];
            string = [string stringByAppendingString:tempString];
        }
    }
    return string;
}

//返回大小写字母和数字
+(NSString *)returnRandomStringtWithNum:(NSInteger)num{
    //定义一个包含数字，大小写字母的字符串
    NSString * strAll = @"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    //定义一个结果
    NSString * result = [[NSMutableString alloc]initWithCapacity:num];
    for (int i = 0; i < num; i++){
        //获取随机数
        NSInteger index = arc4random() % (strAll.length-1);
        char tempStr = [strAll characterAtIndex:index];
        result = (NSMutableString *)[result stringByAppendingString:[NSString stringWithFormat:@"%c",tempStr]];
    }
    return result;
}
+(NSString *)dislodgeSpecialDispose:(NSString *)str{
    str = [NSString null_str:str];
    if ([str hasPrefix:@"+86"]) {
        str = [str substringFromIndex:3];//substringToIndex
    }
    NSRange range = [str rangeOfString:@"#"];
    if (range.location != NSNotFound) {
        str = [str substringToIndex:range.location];
    }
    NSCharacterSet *setString = [NSCharacterSet characterSetWithCharactersInString:@"@／：；（）¥「」＂、[]{}#%-*+=_\\|~＜＞$?^?'@#$%^&*()_+'\""];
    str = [[str componentsSeparatedByCharactersInSet:setString] componentsJoinedByString:@""];
    return [NSString null_str:str];
}

+(NSString *)md5String:(NSString *)string{
    const char *value = [string UTF8String];
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    return outputString;
}

+(NSString *)getUUID{
    return [NSString null_str:[[[UIDevice currentDevice] identifierForVendor] UUIDString]];
}
@end
