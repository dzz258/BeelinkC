//
//  DKCustom.h
//  dingdonghuigou
//
//  Created by Gavin on 2018/12/6.
//  Copyright © 2018 bei jing you ji. All rights reserved.
//

#ifndef DKCustom_h
#define DKCustom_h

//#define DebugEnvironment 0  // 1、调试 部分按钮跳过  0 正式使用，去除跳过部分
static int DebugEnvironment = 0;  // 1、调试 部分按钮跳过  0 正式使用，去除跳过部分 暂时不用

#define WX_ID @"wx2031852dc35b823a"
#define WX_UNIVERSAL_LINK @"https://www.hengxizaixian.com/"//universal_link

/**
 说明：相同的颜色值，后面数字越大颜色越深
 1~10
 */
/**
 主要颜色
 */
#define color_black8 kColor(@"#111111", @"#ffffff")
#define color_black10 kColor(@"#000000", @"#ffffff")
//#define color_white9 kColor(@"#dbdbdb",@"#000000")
#define color_white10 kColor(@"#ffffff",@"#000000")
#define color_cyan9 kColor(@"#0dbba4", @"")

#define color_gray6 kColor(@"#666666",@"#ffffff")
#define color_gray7 kColor(@"#eeeeee", @"")
#define color_gray8 kColor(@"#999999",@"#ffffff")

//橘色
#define color_orange3 kColor(@"#fcf1ed",@"#fcf1ed")
#define color_orange8 kColor(@"#ed7145",@"#ed7145")


////红色
//#define color_main_red kColor_hex(@"#b73527")
////橘色
//#define color_main_orange kColor_hex(@"#ed552b")
//
//#define color_main_gray kColor_hex(@"#c0c6d0")
//#define color_main_gray4 kColor_hex(@"#8aa0a6")
//#define color_main_white kColor_hex(@"#ffffff")
//#define color_main_title_black kColor_hex(@"#040708")
//#define color_main_title_black3 kColor_hex(@"#1e2629")
//#define color_main_title_gray kColor_hex(@"#666666")
//#define color_main_line_gray kColor_hex(@"#bfbfbf")
//#define color_pic_bg kColor_hex(@"#c8c8c8")
//
//#define color_hint_title kColor_hex(@"#c0c8d3")
//
//#define color_main_red7 kColor_hex(@"#a2160a")
///**
// 导航栏 颜色
// 背景色
// */
//#define color_nav_bg kColor_hex(@"#ffffff")
//#define color_nav_title kColor_hex(@"#1e2629")
//#define color_nav_line kColor_hex(@"#f5f7f7")
//
///**
// tabbar 字体颜色
// */
//#define color_tabbar_text_ kColor_hex(@"#1e2629")
//#define color_tabbar_text_select kColor_hex(@"#b83527")
//
///**
// view 背景色
// */
//#define color_view_bg kColor_hex(@"#ffffff")
////青灰色
//#define color_view_bg_lividity kColor_hex(@"#f3f6f6")
////青灰色 深
//#define color_view_bg_lividity3 kColor_hex(@"#f5f7f7")
////红色 淡
//#define color_view_bg_red7 kColor_hex(@"#f1b5ad")
//#define color_view_bg_red9 kColor_hex(@"#f8e3e2")
//
///**
// 搜索 背景色 字体默认色  字体色
// */
//#define color_search_bg kColor_hex(@"#ffffff")
//#define color_search_text_ kColor_hex(@"#c0c6d0")
//#define color_search_text_select kColor_hex(@"#000000")
//
///**
// 按钮 背景色 字体默认色  字体色
// */
//#define color_btn_bg color_main_red
////白色
//#define color_btn_title_white kColor_hex(@"#ffffff")
////灰色
//#define color_btn_title_gray kColor_hex(@"#c0c6d0")
////黑色
//#define color_btn_title_black8 kColor_hex(@"#040706")
////边框
//#define color_btn_border kColor_hex(@"#971508")
//
///**
// textField 背景色 字体默认色  字体色
// */
////#define color_text_bg color_main_red
////黑色
//#define color_textF_title kColor_hex(@"#040708")
//
////灰色
////#define color_btn_title_gray kColor_hex(@"#c0c6d0")
//
//
///**
// tableview group
// */
////黑色
//#define color_table_group_title kColor_hex(@"#040000")
////红色
//#define color_table_group_title_red kColor_hex(@"#b73527")
////淡红 橘
//#define color_table_group_title_red4 kColor_hex(@"#b0765a")
////红色 淡
//#define color_table_group_title_blush kColor_hex(@"#e9b6b0")
////灰色字体
//#define color_table_group_subTitle kColor_hex(@"#c0c7d1")
////分割线
//#define color_table_group_line kColor_hex(@"#c8c8c8")
////cell 标题
//#define color_table_cell_title kColor_hex(@"#040000")
////cell 副标题
//#define color_table_cell_subTitle kColor_hex(@"#999999")
////价格
//#define color_table_cell_price kColor_hex(@"#b73527")
////原价
//#define color_table_cell_subPrice kColor_hex(@"#c8c8c8")
////橘红
//#define color_table_cell_title_red3 kColor_hex(@"#ed552b")
////灰蓝
//#define color_table_cell_title_gray kColor_hex(@"#4f646a")
////黑色
//#define color_table_cell_title_black kColor_hex(@"#040706")

#endif /* DKCustom_h */
