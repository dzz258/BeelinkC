//
//  DKApi.h
//  dingdonghuigou
//
//  Created by Gavin on 2018/12/6.
//  Copyright © 2018 bei jing you ji. All rights reserved.
//

#ifndef DKApi_h
#define DKApi_h

#define DevelopSever    1  // 开发服务器
#define TestSever       0 // 测试服务器
#define ProductSever    0  // 生产服务器

#if DevelopSever
#define API_MAIN_URL @"https://www.hengxizaixian.com/liangdashi/app_api"//接口域名
#define API_BACKSTAGE_URL @""//后台接口域名
#define API_PIC_URL @""//图片域名 暂时不用
#define API_H5_URL @""//H5地址域名

#elif TestSever
#define API_MAIN_URL @""//接口域名
#define API_Backstage_URL @""//后台接口域名
#define API_PIC_URL @""//图片域名 暂时不用
#define API_H5_URL @""//H5地址域名

#elif ProductSever
#define API_MAIN_URL @""//接口域名
#define API_Backstage_URL @""//后台接口域名
#define API_PIC_URL @""//图片域名 暂时不用
#define API_H5_URL @""//H5地址域名

#endif
#pragma mark - < H5页面地址 >
///**
// 注册协议
// */
//#define api_h5_register @"zc_agreement.html"
/////**
//// 常见问题
//// */
//#define api_h5_question @"problem.html"

#pragma mark - < 详细接口地址 >
/**
 命名规则
 类型（API）+方法（get/post）+类名（xxx）+方法名（xxx）
 */

/**
 获取验证码
 */
#define api_post_login_code @"get_secur_code"
/**
 登录
*/
#define api_post_login @"login"
/**
 首页接口
 */
#define api_get_index @"shop_index"
/**
 商品详情接口
 */
#define api_get_product_info @"get_product_info"
/**
 收藏接口
 */
#define api_post_collect_add @"add_collect"
/**
 取消收藏接口
*/
#define api_post_collect_cancel @"cancel_collect"
/**
 商品列表接口
*/
#define api_get_product_list @"product_list"
/**
 商品分类接口
*/
#define api_get_category @"get_category"
/**
 订单列表
 */
#define api_get_order @"get_order_list"
/**
 加入购物车
 */
#define api_post_cart_add @"add_cart"
/**
 移除购物车
 */
#define api_post_cart_cancel @"remove_cart"
/**
 购物车列表
*/
#define api_get_cart_list @"get_cart"
/**
 购物车更新
*/
#define api_post_cart_update @"update_cart"
/**
 确认订单
*/
#define api_post_order_add @"add_order"
/**
 订单详情
*/
#define api_get_order_info @"get_order_info"
/**
 订单详情
*/
#define api_post_order_cancel @"cancel_order"
/**
 获取产品资料
*/
#define api_post_product_datum @"get_product_datum"
/**
 获取收藏列表
*/
#define api_get_collect @"get_collect"
/**
 设计师管理
*/
#define api_get_designer @"get_designer"
/**
 关于我们
*/
#define api_get_about_us @"about_us"
/**
 客服帮助
*/
#define api_get_service @"service"
/**
 获取个人信息
*/
#define api_get_user_info @"get_user_info"
/**
 更新个人信息
*/
#define api_post_user_update @"update_user_info"

/**
 上传头像
*/
#define api_post_user_head @"update_headimage"

/**
 获取账户信息
*/
#define api_post_account_info @"get_balance_cash_money_headimage_name"
/**
 立即提现
*/
#define api_post_account_cash @"add_cash"
/**
 佣金明细
*/
#define api_get_account_commission_details @"get_commission_list"
/**
 提现明细
*/
#define api_get_account_cash_details @"get_cash_list"
/**
 推荐设计师
*/
#define api_get_designer_nominate @"get_nominate_url"
/**
 用户协议
*/
#define api_get_user_agreement @"get_agreement_url"
 /**
  邀请设计师
 */
 #define api_get_invite_url @"get_invite_url"

#endif /* DKApi_h */
