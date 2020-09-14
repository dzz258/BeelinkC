//
//  DKShareModel.h
//  BeelinkC
//
//  Created by Gavin on 2020/9/14.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class DKTitleModel;

typedef NS_ENUM(NSUInteger , DXShareType) {
    DXShareTypeWechatSession    = 1,               //微信好友
    DXShareTypeWechatTimeline   = 2,               //微信朋友圈
    DXShareTypeQQ               = 3,               //QQ好友
    DXShareTypeQzone            = 4,               //QQ空间
    DXShareTypeUrl              = 5,              //链接
};

typedef NS_ENUM(NSUInteger , DXShareContentType) {
    DXShareContentTypeText    = 1,               //文本分享
    DXShareContentTypeImage   = 2,               //图片分享
    DXShareContentTypeLink    = 3,               //链接分享
    //...其它自行扩展
};

@interface DKShareModel : NSObject

//分享标题 只分享文本是也用这个字段
@property (nonatomic,copy) NSString *title;
//描述内容
@property (nonatomic,copy) NSString *descr;
//缩略图
@property (nonatomic,strong) id thumbImage;
//链接
@property (nonatomic,copy) NSString *url;
//分享类型
@property (nonatomic, assign) DXShareType shareType;
//分享内容类型
@property (nonatomic, assign) DXShareContentType shareContentType;

//表头
@property (nonatomic,strong) DKTitleModel * titleModel;
/// 自定义表头
@property (nonatomic,strong) UIView * headerV;

@end

@interface DKTitleModel : NSObject
@property(nonatomic,copy) NSString *headerUrl;//头像
@property(nonatomic,copy) NSString *teacher;//教师
@property(nonatomic,copy) NSString *national;//国旗
@property(nonatomic,copy) NSString *language;//授课语言
@property(nonatomic,assign) BOOL isAttention;//是否关注

@end
NS_ASSUME_NONNULL_END
