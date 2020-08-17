//
//  UITableView+DKNoneData.h
//  CopyrightService
//
//  Created by Gavin on 2019/10/31.
//  Copyright © 2019 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DKNoneDataView;
typedef enum : NSUInteger {
    DKNoneDataStyleNone, // 关闭此机制
    DKNoneDataStyleDefault, // 使用DK默认的视图 (默认视图)
    DKNoneDataStyleDIY, // 自定义DIY视图, 如果DIY视图为nil 使用DK默认视图
} DKNoneDataStyle;

// 这是默认的style, 默认是使用 DK默认视图 的
extern DKNoneDataStyle DK_DefaultStyle;

@interface UITableView (DKNoneData)

@property (nonatomic, assign) DKNoneDataStyle dk_noneDataStyle;

/*
 * 只在 DKNoneDataStyleDIY 下生效
 * frame 或者 布局, 需要自己给定
 */
@property (nonatomic, strong) UIView *dk_diyView;

/*
 * 描述: 是否显示 无数据视图
 * 只在 非DKNoneDataStyleNone并且dk_isManualShow==YES  时生效
 */
@property (nonatomic, assign) BOOL dk_showNoneDataView;
/*
 * 描述: 是否手动显示 无数据视图; 默认为NO
 */
@property (nonatomic, assign) BOOL dk_isManualShow;

// 默认视图, readonly
@property (nonatomic, strong, readonly) DKNoneDataView *dk_defaultView;

@end

@interface UIScrollView (DK)

- (void)dk_setContentSize:(CGSize)contentSize;

@end
