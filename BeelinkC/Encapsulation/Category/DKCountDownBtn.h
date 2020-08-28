//
//  DKCountDownBtn.h
//  BeelinkC
//
//  Created by Gavin on 2020/8/28.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DKCountDownBtn : UIButton

//设置开始倒计时的时间 默认是60s
@property(nonatomic,assign)NSInteger count;
//点击按钮
@property(nonatomic,copy)void(^clickBlock)(DKCountDownBtn *btn);
//倒计时完成后的回调
@property(nonatomic,copy)void(^completeBlock)(DKCountDownBtn *btn);
/// 刷新
-(void)refresh;
/// 开始
-(void)start;
/// 停止
-(void)stop;
@end

NS_ASSUME_NONNULL_END
