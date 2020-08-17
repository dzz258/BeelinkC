//
//  UITableView+DKNoneData.m
//  CopyrightService
//
//  Created by Gavin on 2019/10/31.
//  Copyright © 2019 Gavin. All rights reserved.
//

#import "UITableView+DKNoneData.h"
#import "DKNoneDataView.h"
#import <objc/runtime.h>

// 这是默认的style, 默认是使用 DK默认视图 的
DKNoneDataStyle DK_DefaultStyle = DKNoneDataStyleDefault;

const NSString *Dk_Key_NoneDataStyle = @"Dk_Key_NoneDataStyle";
const NSString *Dk_Key_ShowNoneDataView = @"Dk_Key_ShowNoneDataView";
const NSString *Dk_Key_DefaultView = @"Dk_Key_DefaultView";
const NSString *Dk_Key_DiyView = @"Dk_Key_DiyView";
const NSString *Dk_Key_ManualShow = @"Dk_Key_ManualShow";
const NSString *Dk_Key_AutoShowing = @"Dk_Key_AutoShowing";

@interface UITableView ()

@property (nonatomic, assign) BOOL isAutoShowing; // 记录自动判断是否显示

@end

@implementation UITableView (DKNoneData)

+ (void)load
{
    Method layoutSubviews = class_getInstanceMethod(self, @selector(layoutSubviews));
    Method dk_layoutSubviews = class_getInstanceMethod(self, @selector(dk_layoutSubviews));
    method_exchangeImplementations(layoutSubviews, dk_layoutSubviews);
    
    Method initWithFrame_style = class_getInstanceMethod(self, @selector(initWithFrame:style:));
    Method dk_initWithFrame_style = class_getInstanceMethod(self, @selector(dk_initWithFrame:style:));
    method_exchangeImplementations(initWithFrame_style, dk_initWithFrame_style);
}
- (instancetype)dk_initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    UITableView *tableView = [self dk_initWithFrame:frame style:style];
    tableView.dk_noneDataStyle = DK_DefaultStyle;
    return tableView;
}
- (void)dk_setContentSize:(CGSize)contentSize
{
    [super dk_setContentSize:contentSize];
    BOOL isHavingData = NO; // tableView中是否有数据
    NSInteger numberOfSections = [self numberOfSections];
    for (NSInteger i = 0; i < numberOfSections; i++) {
        if ([self numberOfRowsInSection:i] > 0) {
            isHavingData = YES;
        }
    }
    self.isAutoShowing = !isHavingData;
    [self judgeNowStateWithShow:!isHavingData];
}

- (void)dk_layoutSubviews
{
    [self dk_layoutSubviews];
    [self bringSubviewToFront:self.dk_defaultView];
    self.dk_defaultView.frame = self.bounds;
    if (self.dk_diyView) {
        [self bringSubviewToFront:self.dk_diyView];
    }
}
- (void)judgeNowStateWithShow:(BOOL)show
{
    switch (self.dk_noneDataStyle) {
        case DKNoneDataStyleNone:
            self.dk_defaultView.hidden = YES;
            if (self.dk_diyView) {
                self.dk_diyView.hidden = YES;
            }
            break;
        case DKNoneDataStyleDefault:
            if (self.dk_diyView) {
                self.dk_diyView.hidden = YES;
            }
            self.dk_defaultView.hidden = self.dk_isManualShow ? !self.dk_showNoneDataView : !show;
            break;
        case DKNoneDataStyleDIY:
            if (self.dk_diyView) {
                self.dk_defaultView.hidden = NO;
                self.dk_diyView.hidden = self.dk_isManualShow ? !self.dk_showNoneDataView : !show;;
            } else {
                self.dk_defaultView.hidden = self.dk_isManualShow ? !self.dk_showNoneDataView : !show;
            }
            break;
        default:
            break;
    }
}
#pragma mark - setter + gatter
- (void)setDk_diyView:(UIView *)dk_diyView
{
    if (self.dk_diyView) {
        [self.dk_diyView removeFromSuperview];
    }
    [self addSubview:dk_diyView];
    objc_setAssociatedObject(self, (__bridge const void *)(Dk_Key_DiyView), dk_diyView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)dk_diyView
{
    return objc_getAssociatedObject(self, (__bridge const void *)(Dk_Key_DiyView));
}
- (void)setDk_defaultView:(DKNoneDataView *)dk_defaultView
{
    objc_setAssociatedObject(self, (__bridge const void *)(Dk_Key_DefaultView), dk_defaultView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (DKNoneDataView *)dk_defaultView
{
    DKNoneDataView *defaultView = objc_getAssociatedObject(self, (__bridge const void *)(Dk_Key_DefaultView));
    if (!defaultView) {
        defaultView = [[DKNoneDataView alloc] init];
        defaultView.hidden = YES;
        [self addSubview:defaultView];
        objc_setAssociatedObject(self, (__bridge const void *)(Dk_Key_DefaultView), defaultView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return defaultView;
}

- (void)setDk_showNoneDataView:(BOOL)dk_showNoneDataView
{
    objc_setAssociatedObject(self, (__bridge const void *)(Dk_Key_ShowNoneDataView), @(dk_showNoneDataView), OBJC_ASSOCIATION_ASSIGN);
    if (self.dk_isManualShow) {
        [self judgeNowStateWithShow:dk_showNoneDataView];
    }
}
- (BOOL)dk_showNoneDataView
{
    return [objc_getAssociatedObject(self, (__bridge const void *)(Dk_Key_ShowNoneDataView)) intValue];
}

- (void)setDk_noneDataStyle:(DKNoneDataStyle)dk_noneDataStyle
{
    objc_setAssociatedObject(self, (__bridge const void *)(Dk_Key_NoneDataStyle), @(dk_noneDataStyle), OBJC_ASSOCIATION_ASSIGN);
}
- (DKNoneDataStyle)dk_noneDataStyle
{
    return [objc_getAssociatedObject(self, (__bridge const void *)(Dk_Key_NoneDataStyle)) intValue];
}

- (void)setDk_isManualShow:(BOOL)dk_isManualShow
{
    objc_setAssociatedObject(self, (__bridge const void *)(Dk_Key_ManualShow), @(dk_isManualShow), OBJC_ASSOCIATION_ASSIGN);
    [self judgeNowStateWithShow:dk_isManualShow ? self.dk_showNoneDataView :self.isAutoShowing];
}
- (BOOL)dk_isManualShow
{
    return [objc_getAssociatedObject(self, (__bridge const void *)(Dk_Key_ManualShow)) boolValue];
}

- (void)setIsAutoShowing:(BOOL)isAutoShowing
{
    objc_setAssociatedObject(self, (__bridge const void *)(Dk_Key_AutoShowing), @(isAutoShowing), OBJC_ASSOCIATION_ASSIGN);
}
- (BOOL)isAutoShowing
{
    return [objc_getAssociatedObject(self, (__bridge const void *)(Dk_Key_AutoShowing)) boolValue];
}


@end
