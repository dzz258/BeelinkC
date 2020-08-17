//
//  NSString+DKFormat.h
//  dingdonghuigou
//
//  Created by Gavin on 2018/12/20.
//  Copyright © 2018 bei jing you ji. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (DKFormat)

-(NSString *)getMd5;
-(NSString *)mobileNumber;
-(void)bankCardTextF:(UITextField *)textF;

-(void)mobileNumberTextF:(UITextField *)textF;
/**
 手机隐藏中间四位
 */
-(NSString *)telHide;
/**
 获取手机型号
 */
-(NSString*)deviceVersion;
@end

NS_ASSUME_NONNULL_END
