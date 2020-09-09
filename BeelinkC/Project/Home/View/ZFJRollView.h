//
//  ZFJRollView.h
//  ScrollViewZFJ
//
//  Created by ZFJ on 2017/4/26.
//  Copyright © 2017年 ZFJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZFJRollViewDelegate <NSObject>

- (void)didSelectPicWithIndexPath:(NSInteger)index;

@end

@interface ZFJRollView : UIView

@property (nonatomic, assign) id<ZFJRollViewDelegate> delegate;

/**
 @param frame 设置View大小
 @param distance 设置Scroll距离View两侧距离
 @param gap 设置Scroll内部 图片间距
 @return 初始化返回值
 */
- (instancetype)initWithFrame:(CGRect)frame withDistanceForScroll:(float)distance withGap:(float)gap;

//设置数据源
- (void)rollView:(NSArray *)dataArr;

@end
