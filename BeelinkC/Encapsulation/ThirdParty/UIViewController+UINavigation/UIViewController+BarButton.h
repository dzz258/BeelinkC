//
//  ZTNavigationViewController.h
//  ZTNavigationItem
//
//  Created by ZT on 2017/10/31.
//  Copyright © 2017年 ZT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (BarButton)
- (void)addLeftImage:(UIImage *)image action:(SEL)action;
- (void)addLeftBarButtonWithImage:(UIImage *)image action:(SEL)action;

- (void)addRightBarButtonWithFirstImage:(UIImage *)firstImage action:(SEL)action;
- (void)addRightBarButtonItemWithTitle:(NSString *)itemTitle action:(SEL)action;
- (void)addLeftBarButtonItemWithTitle:(NSString *)itemTitle action:(SEL)action;
- (void)addLeftBarButtonItemWithWebFirstAction:(SEL)firstAction secondAction:(SEL)secondAction;
- (void)addLeftBarButtonItemWithTitle:(NSString *)firstTitle secondTitle:(NSString *)secondTitle firstAction:(SEL)firstAction secondAction:(SEL)secondAction;
- (void)addLeftBarButtonWithFirstImage:(UIImage *)firstImage firstAction:(SEL)firstAction secondImage:(UIImage *)secondImage secondAction:(SEL)secondAction;
- (void)addRightTwoBarButtonsWithFirstImage:(UIImage *)firstImage firstAction:(SEL)firstAction secondImage:(UIImage *)secondImage secondAction:(SEL)secondAction;
- (void)addRightThreeBarButtonsWithFirstImage:(UIImage *)firstImage firstAction:(SEL)firstAction secondImage:(UIImage *)secondImage secondAction:(SEL)secondAction thirdImage:(UIImage *)thirdImage thirdAction:(SEL)thirdAction;
- (void)addRightFourBarButtonsWithFirstImage:(UIImage *)firstImage firstAction:(SEL)firstAction secondImage:(UIImage *)secondImage secondAction:(SEL)secondAction thirdImage:(UIImage *)thirdImage thirdAction:(SEL)thirdAction fourthImage:(UIImage *)fourthImage fourthAction:(SEL)fourthAction;

@end
