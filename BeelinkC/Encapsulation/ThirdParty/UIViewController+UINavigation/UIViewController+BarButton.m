//
//  ZTNavigationViewController.h
//  ZTNavigationItem
//
//  Created by ZT on 2017/10/31.
//  Copyright © 2017年 ZT. All rights reserved.
//

#import "UIViewController+BarButton.h"

//#define kScreenWidth  ([UIScreen mainScreen].bounds.size.width)
//#define kScreenHeight  ([UIScreen mainScreen].bounds.size.height)
#define kBlackColor     [UIColor blackColor]

@implementation UIViewController (BarButton)

- (void)addLeftImage:(UIImage *)image action:(SEL)action{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    view.backgroundColor = [UIColor clearColor];
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    firstButton.frame = CGRectMake(0, 0, 44, 44);
    [firstButton setImage:image forState:UIControlStateNormal];
    [firstButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    firstButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [firstButton setImageEdgeInsets:UIEdgeInsetsMake(0, 5 * [UIScreen mainScreen].bounds.size.width / 375.0, 0, 0)];
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:firstButton];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

- (void)addLeftBarButtonWithImage:(UIImage *)image action:(SEL)action{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, -kWidth_fact(5), 44, 44)];
    view.backgroundColor = [UIColor clearColor];

    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    firstButton.frame = CGRectMake(-10, 0, 44, 44);
    [firstButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [firstButton setImage:image forState:UIControlStateNormal];
    [firstButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    firstButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [firstButton setImageEdgeInsets:UIEdgeInsetsMake(0, 5 * [UIScreen mainScreen].bounds.size.width / 375.0, 0, 0)];
    [view addSubview:firstButton];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    
//    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleDone target:self action:action];
//    self.navigationItem.leftBarButtonItem = barItem;
}
- (void)addRightBarButtonWithFirstImage:(UIImage *)firstImage action:(SEL)action{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    view.backgroundColor = [UIColor clearColor];
    
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    firstButton.frame = CGRectMake(0, 0, 44, 44);
    [firstButton setImage:firstImage forState:UIControlStateNormal];
    [firstButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    firstButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [firstButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5 * [UIScreen mainScreen].bounds.size.width / 375.0)];
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:firstButton];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

- (void)addLeftBarButtonItemWithTitle:(NSString *)itemTitle action:(SEL)action
{
    UIButton *leftbBarButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 88, 44)];
    [leftbBarButton setTitle:itemTitle forState:(UIControlStateNormal)];
//    [leftbBarButton setTitleColor:DCColor_main_white forState:(UIControlStateNormal)];
    leftbBarButton.titleLabel.font = KF_BH_F(18);
    [leftbBarButton addTarget:self action:action forControlEvents:(UIControlEventTouchUpInside)];
    leftbBarButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [leftbBarButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 5 * [UIScreen mainScreen].bounds.size.width/375.0, 0, 0)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftbBarButton];
}
- (void)addLeftBarButtonItemWithWebFirstAction:(SEL)firstAction secondAction:(SEL)secondAction{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, -kWidth_fact(5), 70+40, 44)];
    view.backgroundColor = [UIColor clearColor];

    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    firstButton.frame = CGRectMake(-10, 0, 60, 44);
    [firstButton setTitle:@" 返回" forState:UIControlStateNormal];
    [firstButton setTitleColor:kColor_hex(@"#1e2629") forState:UIControlStateNormal];
    [firstButton setImage:KImage(@"nav_back") forState:UIControlStateNormal];
    [firstButton addTarget:self action:firstAction forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:firstButton];
        
    UIButton *secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
    secondButton.frame =CGRectMake(50, 0, 40, 44);
    [secondButton setTitle:@"关闭" forState:(UIControlStateNormal)];
    [secondButton setTitleColor:kColor_hex(@"#1e2629") forState:(UIControlStateNormal)];
    [secondButton addTarget:self action:secondAction forControlEvents:(UIControlEventTouchUpInside)];
    [view addSubview:secondButton];
        
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}
- (void)addLeftBarButtonItemWithTitle:(NSString *)firstTitle secondTitle:(NSString *)secondTitle firstAction:(SEL)firstAction secondAction:(SEL)secondAction
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
    view.backgroundColor = [UIColor clearColor];
    
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    firstButton.frame =CGRectMake(40, 0, 40, 44);
    [firstButton setTitle:firstTitle forState:(UIControlStateNormal)];
    [firstButton setTitleColor:kBlackColor forState:(UIControlStateNormal)];
    firstButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [firstButton addTarget:self action:firstAction forControlEvents:(UIControlEventTouchUpInside)];
    firstButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [firstButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 5 * [UIScreen mainScreen].bounds.size.width/375.0, 0, 0)];
    [view addSubview:firstButton];
    
    UIButton *secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
    secondButton.frame =CGRectMake(0, 0, 40, 44);
    [secondButton setTitle:secondTitle forState:(UIControlStateNormal)];
    [secondButton setTitleColor:kBlackColor forState:(UIControlStateNormal)];
    secondButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [secondButton addTarget:self action:secondAction forControlEvents:(UIControlEventTouchUpInside)];
    secondButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [secondButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 5 * [UIScreen mainScreen].bounds.size.width/375.0, 0, 0)];
    [view addSubview:secondButton];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:view];
    
//    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    firstButton.frame = CGRectMake(40, 0, 40, 44);
//    [firstButton setImage:firstImage forState:UIControlStateNormal];
//    [firstButton addTarget:self action:firstAction forControlEvents:UIControlEventTouchUpInside];
//    firstButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
//    [firstButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, - 8 * FrameSCREEN_WIDTH/375.0)];
//    [view addSubview:firstButton];
    
//    UIButton *secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    secondButton.frame = CGRectMake(0, 0, 40, 44);
//    [secondButton setImage:secondImage forState:UIControlStateNormal];
//    [secondButton addTarget:self action:secondAction forControlEvents:UIControlEventTouchUpInside];
//    secondButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
//    [secondButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, - 15 * FrameSCREEN_WIDTH/375.0)];
//    [view addSubview:secondButton];
    
//    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
//    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

- (void)addRightBarButtonItemWithTitle:(NSString *)itemTitle action:(SEL)action
{
    UIButton *rightbBarButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 88, 44)];
    [rightbBarButton setTitle:itemTitle forState:(UIControlStateNormal)];
//    [rightbBarButton setTitleColor:DCColor_nav_blue forState:(UIControlStateNormal)];
//    rightbBarButton.titleLabel.font = KF_BH_F(18);
    [rightbBarButton addTarget:self action:action forControlEvents:(UIControlEventTouchUpInside)];
    rightbBarButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [rightbBarButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5 * [UIScreen mainScreen].bounds.size.width/375.0)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightbBarButton];
}

- (void)addLeftBarButtonWithFirstImage:(UIImage *)firstImage firstAction:(SEL)firstAction secondImage:(UIImage *)secondImage secondAction:(SEL)secondAction
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
    view.backgroundColor = [UIColor clearColor];
    
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    firstButton.frame = CGRectMake(0, 0, 36, 44);
    [firstButton setImage:firstImage forState:UIControlStateNormal];
    [firstButton addTarget:self action:firstAction forControlEvents:UIControlEventTouchUpInside];
    firstButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [firstButton setImageEdgeInsets:UIEdgeInsetsMake(0, 5 * [UIScreen mainScreen].bounds.size.width / 375.0, 0, 0)];
    
    [view addSubview:firstButton];
    
    UIButton *secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
    secondButton.frame = CGRectMake(36, 0, 44, 44);
    [secondButton setImage:secondImage forState:UIControlStateNormal];
    [secondButton addTarget:self action:secondAction forControlEvents:UIControlEventTouchUpInside];
    secondButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [secondButton setImageEdgeInsets:UIEdgeInsetsMake(0, 5 * [UIScreen mainScreen].bounds.size.width / 375.0, 0, 0)];
    [view addSubview:secondButton];
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

- (void)addRightTwoBarButtonsWithFirstImage:(UIImage *)firstImage firstAction:(SEL)firstAction secondImage:(UIImage *)secondImage secondAction:(SEL)secondAction
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
    view.backgroundColor = [UIColor clearColor];
    
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    firstButton.frame = CGRectMake(40, 0, 40, 44);
    [firstButton setImage:firstImage forState:UIControlStateNormal];
    [firstButton addTarget:self action:firstAction forControlEvents:UIControlEventTouchUpInside];
    firstButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [firstButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, - 8 * [UIScreen mainScreen].bounds.size.width/375.0)];
    [view addSubview:firstButton];
    
    UIButton *secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
    secondButton.frame = CGRectMake(0, 0, 40, 44);
    [secondButton setImage:secondImage forState:UIControlStateNormal];
    [secondButton addTarget:self action:secondAction forControlEvents:UIControlEventTouchUpInside];
    secondButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [secondButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, - 15 * [UIScreen mainScreen].bounds.size.width/375.0)];
    [view addSubview:secondButton];
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

- (void)addRightThreeBarButtonsWithFirstImage:(UIImage *)firstImage firstAction:(SEL)firstAction secondImage:(UIImage *)secondImage secondAction:(SEL)secondAction thirdImage:(UIImage *)thirdImage thirdAction:(SEL)thirdAction
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 44)];
    view.backgroundColor = [UIColor clearColor];
    
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    firstButton.frame = CGRectMake(80, 0, 40, 44);
    [firstButton setImage:firstImage forState:UIControlStateNormal];
    [firstButton addTarget:self action:firstAction forControlEvents:UIControlEventTouchUpInside];
    firstButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [firstButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, - 8 * [UIScreen mainScreen].bounds.size.width/375.0)];
    [view addSubview:firstButton];
    
    UIButton *secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
    secondButton.frame = CGRectMake(44, 0, 40, 44);
    [secondButton setImage:secondImage forState:UIControlStateNormal];
    [secondButton addTarget:self action:secondAction forControlEvents:UIControlEventTouchUpInside];
    secondButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [secondButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, - 5 * [UIScreen mainScreen].bounds.size.width/375.0)];
    [view addSubview:secondButton];
    
    UIButton *thirdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    thirdButton.frame = CGRectMake(0, 0, 40, 44);
    [thirdButton setImage:thirdImage forState:UIControlStateNormal];
    [thirdButton addTarget:self action:thirdAction forControlEvents:UIControlEventTouchUpInside];
    [thirdButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, - 5 * [UIScreen mainScreen].bounds.size.width/375.0)];
    [view addSubview:thirdButton];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
}

- (void)addRightFourBarButtonsWithFirstImage:(UIImage *)firstImage firstAction:(SEL)firstAction secondImage:(UIImage *)secondImage secondAction:(SEL)secondAction thirdImage:(UIImage *)thirdImage thirdAction:(SEL)thirdAction fourthImage:(UIImage *)fourthImage fourthAction:(SEL)fourthAction{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 145, 44)];
    view.backgroundColor = [UIColor clearColor];
    
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    firstButton.frame = CGRectMake(110, 6, 30, 30);
    [firstButton setImage:firstImage forState:UIControlStateNormal];
    [firstButton addTarget:self action:firstAction forControlEvents:UIControlEventTouchUpInside];
    firstButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [firstButton setImageEdgeInsets:UIEdgeInsetsMake(0, 8 * [UIScreen mainScreen].bounds.size.width/375.0, 0, 0)];
    [view addSubview:firstButton];
    
    UIButton *secondButton = [UIButton buttonWithType:UIButtonTypeCustom];
    secondButton.frame = CGRectMake(80, 6, 30, 30);
    [secondButton setImage:secondImage forState:UIControlStateNormal];
    [secondButton addTarget:self action:secondAction forControlEvents:UIControlEventTouchUpInside];
    secondButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [secondButton setImageEdgeInsets:UIEdgeInsetsMake(0, 8 * [UIScreen mainScreen].bounds.size.width/375.0, 0, 0)];
    [view addSubview:secondButton];
    
    UIButton *thirdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    thirdButton.frame = CGRectMake(50, 6, 30, 30);
    [thirdButton setImage:thirdImage forState:UIControlStateNormal];
    thirdButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [thirdButton setImageEdgeInsets:UIEdgeInsetsMake(0, 8 * [UIScreen mainScreen].bounds.size.width/375.0, 0, 0)];
    [thirdButton addTarget:self action:thirdAction forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:thirdButton];
    
    UIButton *fourthButton = [UIButton buttonWithType:UIButtonTypeCustom];
    fourthButton.frame = CGRectMake(15, 6, 30, 30);
    [fourthButton setImage:fourthImage forState:UIControlStateNormal];
    [fourthButton addTarget:self action:fourthAction forControlEvents:UIControlEventTouchUpInside];
    fourthButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [fourthButton setImageEdgeInsets:UIEdgeInsetsMake(0, 8 * [UIScreen mainScreen].bounds.size.width/375.0, 0, 0)];
    [view addSubview:fourthButton];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
}

@end
