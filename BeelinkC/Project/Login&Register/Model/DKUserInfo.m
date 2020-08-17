//
//  DKUserInfo.m
//  ldsapp
//
//  Created by Gavin on 2020/3/22.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKUserInfo.h"
#import "DKAppDelegate.h"

#define KMember @"meber"
#define KisLogin @"login"

#define encodeRuntime(A) \
\
unsigned int count = 0;\
Ivar *ivars = class_copyIvarList([A class], &count);\
for (int i = 0; i<count; i++) {\
Ivar ivar = ivars[i];\
const char *name = ivar_getName(ivar);\
NSString *key = [NSString stringWithUTF8String:name];\
id value = [self valueForKey:key];\
[encoder encodeObject:value forKey:key];\
}\
free(ivars);\

#define initCoderRuntime(A) \
\
if (self = [super init]) {\
unsigned int count = 0;\
Ivar *ivars = class_copyIvarList([A class], &count);\
for (int i = 0; i<count; i++) {\
Ivar ivar = ivars[i];\
const char *name = ivar_getName(ivar);\
NSString *key = [NSString stringWithUTF8String:name];\
id value = [decoder decodeObjectForKey:key];\
[self setValue:value forKey:key];\
}\
free(ivars);\
}\
return self;\
\

//* 用户信息管理类
static DKUserInfo *userInfo = nil;

@implementation DKUserInfo

+ (instancetype)share {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userInfo = [[super allocWithZone:nil] init];
    });
    return userInfo;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userInfo = [DKUserInfo share];
    });
    return userInfo;
}

- (instancetype)copyWithZone:(NSZone *)zone {
    return [DKUserInfo share];
}
- (instancetype)mutableCopyWithZone:(NSZone *)zone {
    return [DKUserInfo share];
}
-(void)saveInfo:(NSDictionary *)info{
    kLog(@"meber==>%@",info);
    BasicInfo *basicInfo=[BasicInfo mj_objectWithKeyValues:info];
    NSData *myMemberInfoObject = [NSKeyedArchiver archivedDataWithRootObject:basicInfo];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:myMemberInfoObject forKey:KMember];
    [defaults setBool:YES forKey:KisLogin];
    [defaults synchronize];
//    DKAppDelegate *appDelegae = (DKAppDelegate *)[UIApplication sharedApplication].delegate;
//    [appDelegae goHome];
}

// 退出登录
- (void)clearUserInfo{
    kLog(@"退出");
    // 清空沙盒数据
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user removeObjectForKey:KMember];
    [user setBool:NO forKey:KisLogin];
    [user synchronize];
//    DKAppDelegate *appDelegae = (DKAppDelegate *)[UIApplication sharedApplication].delegate;
//    [appDelegae goLogin];
}
-(BasicInfo *)info{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *myMemberInfoObject = [defaults objectForKey:KMember];
    BasicInfo *basicInfo = (BasicInfo *)[NSKeyedUnarchiver unarchiveObjectWithData:myMemberInfoObject];
    return basicInfo;
}

-(BOOL)isLogin{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:KisLogin];//0  NO
}
-(NSString *)getToken{
    BasicInfo *model=[self info];
    return [NSString null_str:model.token];
}
@end

@implementation BasicInfo

//+ (NSDictionary *)replacedKeyFromPropertyName {
//    return @{@"Id":@"f_user_id",@"telphone":@"phone"};
//}
//- (NSDictionary *)model_handlerReplaceProperty {
//    return @{@"Id":@"f_user_id",@"telphone":@"phone"};
//}
-(void)encodeWithCoder:(NSCoder *)encoder{
    encodeRuntime(BasicInfo)
}
-(id)initWithCoder:(NSCoder *)decoder{
    initCoderRuntime(BasicInfo)
}
@end
