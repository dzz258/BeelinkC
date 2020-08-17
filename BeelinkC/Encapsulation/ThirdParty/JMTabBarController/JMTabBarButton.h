//
//  JMTabBarButton.h
//  JMTabBarController
//
//  Created by JM on 2017/12/28.
//  Copyright © 2017年 JM. All rights reserved.
//
/*
 .----------------. .----------------.
 | .--------------. | .--------------. |
 | |     _____    | | | ____    ____ | |
 | |    |_   _|   | | ||_   \  /   _|| |
 | |      | |     | | |  |   \/   |  | |
 | |   _  | |     | | |  | |\  /| |  | |
 | |  | |_' |     | | | _| |_\/_| |_ | |
 | |  `.___.'     | | ||_____||_____|| |
 | |              | | |              | |
 | '--------------' | '--------------' |
 '----------------' '----------------'
 github: https://github.com/JunAILiang
 blog: https://www.ljmvip.cn
 */

#import <UIKit/UIKit.h>
#import "JMConfig.h"
#import "JMBadgeValue.h"

@interface JMTabBarButton : UIView

/** UIImageView */
@property (nonatomic, strong) UIImageView *imageView;
/** Title */
@property (nonatomic, strong) UILabel *title;
/** badgeValue */
@property (nonatomic, strong) JMBadgeValue *badgeValue;
/** type */
@property (nonatomic, assign) JMConfigTypeLayout typeLayout;
//指定第几个没有文字
//@property (nonatomic,assign)NSInteger indexTag;
//是否有只显示图片的按钮
@property (nonatomic,assign)BOOL isIndex;
@property (nonatomic, strong) UIView *bg_V,*shield_Bg_V;

@end
