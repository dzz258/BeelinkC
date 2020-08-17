//
//  DKBaseViewController.h
//  dingdonghuigou
//
//  Created by Gavin on 2018/12/7.
//  Copyright © 2018 bei jing you ji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+BarButton.h"
#import <MJRefresh/MJRefresh.h>
//#import "UITableView+DKNoneData.h"

//NS_ASSUME_NONNULL_BEGIN

@interface DKBaseViewController : UIViewController

typedef void (^DKParentBlock)(BOOL loading,NSDictionary *dic);
@property(nonatomic,assign)NSInteger error;
@property (nonatomic, strong) UITableView *superTableV;
@property (nonatomic, assign) BOOL isHideNav;
//@property (nonatomic, assign) BOOL isNetworkHint;
@property (nonatomic, assign) BOOL isBanGesteBack;
@property (nonatomic, assign) NSInteger nav_style;//默认 0 蓝色 1 白色

/**
 扩展 供子类使用
 不同子类中可代表不同含义
 */
@property (nonatomic, assign) NSInteger fromType;
/**
 返回上一级 push有效
 */
-(void)goBack;
/**
 网络监听
 */
//@property(nonatomic, strong) DKNotNetWorkHintView *dkNetWorkHintV;
/**
 是否允许 hederView
 */
+ (UITableViewStyle)rootTableStyle;//default plain
-(void)headerRereshing;
-(void)footerRereshing;
#pragma mark -- just for overwrite
/** 绑定 */
- (void)_bindViewModel;
/** 添加控件 */
- (void)_addSubviews;
/** 设置导航栏 */
//- (void)_setupNavigation;
/** 加载数据 */
//- (void)_loadNewData;

/**
 等待加载动画
 父类为self.view
 不允许父类交互
 loading 添加/隐藏（YES 添加； NO 隐藏）
 */
@property (nonatomic,assign)BOOL loading;
/**
 等待加载动画
 父类为self.view
 
 @param loading 添加/隐藏（YES 添加； NO 隐藏）
 @param isTouch 是否允许父类交互 （YES 允许； NO 不允许）
 */
-(void)loading:(BOOL)loading isTouch:(BOOL)isTouch;
/// 等待加载动画
/// 父类为self.view
/// @param loading 添加/隐藏（YES 添加； NO 隐藏）
/// @param hintText 提示文字
-(void)loading:(BOOL)loading hint:(NSString *)hintText;
/**
 等待加载动画
 不允许父类交互
 
 @param loading 添加/隐藏（YES 添加； NO 隐藏）
 @param superV 父类视图
 */
-(void)loading:(BOOL)loading superV:(UIView *)superV;
/**
 等待加载动画
 
 @param loading 添加/隐藏（YES 添加； NO 隐藏）
 @param superV 父类视图
 @param isTouch 是否允许父类交互 （YES 允许； NO 不允许）
 */
-(void)loading:(BOOL)loading superV:(UIView *)superV isTouch:(BOOL)isTouch;
/// 等待加载动画
/// @param loading 添加/隐藏（YES 添加； NO 隐藏）
/// @param hintText 提示文字
/// @param superV 父类视图
/// @param isTouch 是否允许父类交互 （YES 允许； NO 不允许）
-(void)loading:(BOOL)loading hint:(NSString *)hintText superV:(UIView *)superV isTouch:(BOOL)isTouch;
/// 加载失败页面提示
/// @param count 数量
/// @param f_heigth 高度
/// @param dkBlock 点击后执行操作
-(void)showErr:(NSInteger)count heigth:(CGFloat)f_heigth block:(DKParentBlock)dkBlock;
/// 加载成功页面提示
/// @param count 数量
/// @param hinText 提示文字内容
/// @param f_heigth 高度
/// @param dkBlock 点击后执行操作
-(void)showSuccess:(NSInteger)count hintText:(NSString *)hinText heigth:(CGFloat)f_heigth block:(DKParentBlock)dkBlock;
/// 页面提示二次封装
/// @param success 成功
/// @param count 数量
/// @param hinText 提示文字内容
/// @param f_heigth 高度
/// @param dkBlock 点击后执行操作
-(void)showHint:(BOOL)success count:(NSInteger)count hintText:(NSString *)hinText heigth:(CGFloat)f_heigth block:(DKParentBlock)dkBlock;
/// 页面提示
/// @param success 接口是否请求成功
/// @param count 数据量
/// @param hinText 提示文字
/// @param parent 父控件 默认 self.view
/// @param frame 位置  默认 self.view.frame
/// @param dkBlock 点击后执行操作
-(void)showHint:(BOOL)success count:(NSInteger)count hintText:(NSString *)hinText parent:(UIView *)parent frame:(CGRect)frame block:(DKParentBlock)dkBlock;
@end

//NS_ASSUME_NONNULL_END
