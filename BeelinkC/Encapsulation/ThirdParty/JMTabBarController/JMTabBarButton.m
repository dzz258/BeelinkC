//
//  JMTabBarButton.m
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

#import "JMTabBarButton.h"
#import "UIView+JM.h"

@interface JMTabBarButton()

@end

@implementation JMTabBarButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.bg_V=[[UIView alloc] init];
        self.bg_V.backgroundColor=[UIColor whiteColor];
        [self addSubview:self.bg_V];
        
        self.shield_Bg_V=[[UIView alloc] init];
        self.shield_Bg_V.backgroundColor=[UIColor whiteColor];
        [self addSubview:self.shield_Bg_V];
        
        self.imageView = [[UIImageView alloc] init];
        [self addSubview:self.imageView];

        self.backgroundColor=[UIColor clearColor];
        self.title = [[UILabel alloc] init];
        self.title.textAlignment = NSTextAlignmentCenter;
        self.title.font=[UIFont boldSystemFontOfSize:[[JMConfig config] titleFont]];
//        self.title.font = [UIFont systemFontOfSize:[[JMConfig config] titleFont]];
        [self addSubview:self.title];
        
        self.badgeValue = [[JMBadgeValue alloc] init];
        self.badgeValue.hidden = YES;
        [self addSubview:self.badgeValue];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGSize imageSize = [[JMConfig config] imageSize];
    CGFloat imageY = [[JMConfig config] imageOffset];
    CGFloat iamgeX = self.width * 0.5 - imageSize.width * 0.5;
    if (self.isIndex) {
        if (_typeLayout == JMConfigTypeLayoutImage) {
            self.imageView.frame = CGRectMake((self.width-self.height+4)*0.5, 2, self.height-4, self.height-4);
        }else{
            self.shield_Bg_V.frame=CGRectMake(iamgeX-12.5, imageY-2.5, imageSize.width+20+5, imageSize.height+5);
            self.bg_V.layer.borderWidth=1;
            self.bg_V.layer.cornerRadius=(imageSize.height+20)*0.5;
            self.bg_V.layer.borderColor=[UIColor colorWithRed:0.82 green:0.82 blue:0.82 alpha:1.00].CGColor;
            self.imageView.frame = CGRectMake(iamgeX-10, imageY-20, imageSize.width+20, imageSize.height+20);
            self.bg_V.frame=CGRectMake(self.imageView.x-1.5, self.imageView.y-2, self.imageView.width+3, self.imageView.height+3);
        }
    }else{
        if ([[JMConfig config] typeLayout] == JMConfigTypeLayoutImage) {
            imageY = self.height * 0.5 - imageSize.height * 0.5;
        }
        self.imageView.frame = CGRectMake(iamgeX, imageY, imageSize.width, imageSize.height);
    }
    CGFloat titleX = 4;
    CGFloat titleH = 14.f;
    CGFloat titleW = self.width - 8;
    CGFloat titleY = self.height - titleH - [[JMConfig config] titleOffset];
    self.title.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    CGFloat badgeX = CGRectGetMaxX(self.imageView.frame) - 6;
    CGFloat badgeY = CGRectGetMinY(self.imageView.frame) - 2;
    CGFloat badgeH = 16;
    CGFloat badgeW = 24;
    self.badgeValue.frame = CGRectMake(badgeX, badgeY, badgeW, badgeH);
}

- (void)setTypeLayout:(JMConfigTypeLayout)typeLayout {
    _typeLayout = typeLayout;
    
    if (typeLayout == JMConfigTypeLayoutImage) {
        self.title.hidden = YES;
        
        CGSize imageSize = [[JMConfig config] imageSize];
        
        CGFloat imageX = self.width * 0.5 - imageSize.width * 0.5;
        CGFloat imageY = self.height * 0.5 - imageSize.height * 0.5;
        self.imageView.frame = CGRectMake(imageX, imageY, imageSize.width, imageSize.height);
    }
}

@end





