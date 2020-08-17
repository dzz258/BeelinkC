//
//  DKBaseViewModel.h
//  dingdonghuigou
//
//  Created by Gavin on 2018/12/19.
//  Copyright © 2018 bei jing you ji. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/** 请求成功的Block */
typedef void(^RequestSuccess)(id data);

/** 请求失败的Block */
typedef void(^RequestFailed)(NSError *error);

/** 原则:VM不允许引用UIKit库，避免与View代码耦合，并且私有Model(其他VM)
 用法:数据的下载，刷新，分发，转化,触发事件
 */

@interface DKBaseViewModel : NSObject

/// 分页
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) NSMutableArray *listArray;

/** 工厂方法  */
+ (instancetype)viewModel;

/**
 YES 刷新 NO 加载
 */
@property (nonatomic, assign) BOOL requestState;

@end

NS_ASSUME_NONNULL_END
