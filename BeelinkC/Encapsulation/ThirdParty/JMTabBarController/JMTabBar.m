//
//  JMTabBar.m
//  JMTabBarController
//
//  Created by JM on 2017/12/27.
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

#import "JMTabBar.h"
#import "JMTabBarButton.h"
#import "UIView+JM.h"
#import "CAAnimation+JMAnimation.h"

@interface JMTabBar()

/** 存放JMTabBarButton数组 */
@property (nonatomic, strong) NSMutableArray *saveTabBarArrM;
/** norImage */
@property (nonatomic, strong) NSMutableArray *norImageArrM;
/** SelImage */
@property (nonatomic, strong) NSMutableArray *selImageArrM;
/** titleArr */
@property (nonatomic, strong) NSMutableArray *titleImageArrM;
/** 大按钮index */
@property (nonatomic, assign) NSInteger bigTag;

@property (nonatomic, strong) UIView *btnBgV;

@property (nonatomic, strong) UIImageView *btnBgImageV;

@end

@implementation JMTabBar

- (NSMutableArray *)norImageArrM {
    if (!_norImageArrM) {
        _norImageArrM = [NSMutableArray array];
    }
    return _norImageArrM;
}

- (NSMutableArray *)selImageArrM {
    if (!_selImageArrM) {
        _selImageArrM = [NSMutableArray array];
    }
    return _selImageArrM;
}

- (NSMutableArray *)titleImageArrM {
    if (!_titleImageArrM) {
        _titleImageArrM = [NSMutableArray array];
    }
    return _titleImageArrM;
}

- (NSMutableArray *)saveTabBarArrM {
    if (!_saveTabBarArrM) {
        _saveTabBarArrM = [NSMutableArray array];
    }
    return _saveTabBarArrM;
}
-(UIView *)btnBgV{
    if (!_btnBgV) {
           _btnBgV = [[UIView alloc] init];
        _btnBgV.backgroundColor = color_white10;
        KRadius(_btnBgV, 22.5);
//        kRedius_Space(_btnBgV, 22.5, CGSizeMake(0.1, 0.1), 0.2, color_cyan9);
           _btnBgV.frame = CGRectMake(0,0, 45, 45);
        [_btnBgV addSubview:self.btnBgImageV];
        }
        return _btnBgV;
}
-(UIImageView *)btnBgImageV{
    if (!_btnBgImageV) {
       _btnBgImageV = [[UIImageView alloc] init];
//        _btnBgImageV.backgroundColor = [UIColor redColor];
        _btnBgImageV.frame = CGRectMake(2.5,4, 40, 37);
    }
    return _btnBgImageV;
}
- (instancetype)initWithFrame:(CGRect)frame norImageArr:(NSArray *)norImageArr SelImageArr:(NSArray *)selImageArr TitleArr:(NSArray *)titleArr Config:(JMConfig *)config andTag:(NSInteger)tag{
    if (self = [super initWithFrame:frame]) {
        self.bigTag = tag;
        
        for (int i = 0; i < titleArr.count; i++) {
            JMTabBarButton *tbBtn = [[JMTabBarButton alloc] init];
            tbBtn.imageView.image = [UIImage imageNamed:norImageArr[i]];
            tbBtn.title.text = titleArr[i];
            tbBtn.title.textColor = [[JMConfig config] norTitleColor];
            if (i==tag) {
                tbBtn.isIndex=YES;
                if ([titleArr[i] length]==0) {
                    tbBtn.typeLayout = JMConfigTypeLayoutImage;
                }else{
                    tbBtn.typeLayout = config.typeLayout;
                }
            }else{
                tbBtn.isIndex=NO;
                tbBtn.typeLayout = config.typeLayout;
            }
            tbBtn.tag = i;
            [self addSubview:tbBtn];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
            [tbBtn addGestureRecognizer:tap];
            
            [self.saveTabBarArrM addObject:tbBtn];
            self.titleImageArrM = [NSMutableArray arrayWithArray:titleArr];
            self.norImageArrM = [NSMutableArray arrayWithArray:norImageArr];
            self.selImageArrM = [NSMutableArray arrayWithArray:selImageArr];
            
        }
        
        //背景颜色处理
        self.backgroundColor = [[JMConfig config] tabBarBackground];
        
        //顶部线条处理
        if (config.isClearTabBarTopLine) {
            [self topLineIsClearColor:YES];
        } else {
            [self topLineIsClearColor:NO];
        }
        JMLog(@"%f",self.height);
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame norImageArr:(NSArray *)norImageArr SelImageArr:(NSArray *)selImageArr TitleArr:(NSArray *)titleArr Config:(JMConfig *)config{
    if (self = [super initWithFrame:frame]) {
        self.bigTag = -1;
        
         [self addSubview:self.btnBgV];
        
        kRedius_Space(self, 0, CGSizeMake(1, 1), 0.2, kColor_hex(@"#9C99A8"));
//        NSArray *imageSelectedArr = @[@"tabbar_icon_1_select",@"tabbar_icon_2_select",@"tabbar_icon_3_select",@"tabbar_icon_4_select"];
//
//        self.btnBgImageV.image = KImage(imageSelectedArr[1]);
////        self.tabBar_title.text = titleArr[1];
//        self.btnBgImageV.centerX = 1*kScreenWidth/4+kScreenWidth/4/2;
        
        for (int i = 0; i < titleArr.count; i++) {
            JMTabBarButton *tbBtn = [[JMTabBarButton alloc] init];
            tbBtn.imageView.image = [UIImage imageNamed:norImageArr[i]];
            tbBtn.title.text = titleArr[i];
            tbBtn.title.textColor = [[JMConfig config] norTitleColor];
            tbBtn.typeLayout = config.typeLayout;
            tbBtn.tag = i;
            tbBtn.isIndex=NO;
            [self addSubview:tbBtn];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
            [tbBtn addGestureRecognizer:tap];
            
            [self.saveTabBarArrM addObject:tbBtn];
            self.titleImageArrM = [NSMutableArray arrayWithArray:titleArr];
            self.norImageArrM = [NSMutableArray arrayWithArray:norImageArr];
            self.selImageArrM = [NSMutableArray arrayWithArray:selImageArr];
        }
        
        //背景颜色处理
        self.backgroundColor = [[JMConfig config] tabBarBackground];
        
        //顶部线条处理
        if (config.isClearTabBarTopLine) {
            [self topLineIsClearColor:YES];
        } else {
            [self topLineIsClearColor:NO];
        }
        
        JMLog(@"%f",self.height);
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    NSMutableArray *tempArr = [NSMutableArray array];
    for (UIView *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButton removeFromSuperview];
        }
        if ([tabBarButton isKindOfClass:[JMTabBarButton class]] || [tabBarButton isKindOfClass:[UIButton class]]) {
            [tempArr addObject:tabBarButton];
        }
    }
    
    //进行排序
    for (int i = 0; i < tempArr.count; i++) {
        UIView *view = tempArr[i];
        if ([view isKindOfClass:[UIButton class]]) {
            [tempArr insertObject:view atIndex:view.tag];
            [tempArr removeLastObject];
            break;
        }
    }

    CGFloat viewW = self.width / tempArr.count;
    CGFloat viewH = 49;
    CGFloat viewY = 0;
    for (int i = 0; i < tempArr.count; i++) {
        CGFloat viewX = i * viewW;
        UIView *view = tempArr[i];
        view.frame = CGRectMake(viewX, viewY, viewW, viewH);
    }
}

- (void)tapClick:(UITapGestureRecognizer *)tap {
    [self setUpSelectedIndex:tap.view.tag];
    
    if ([self.myDelegate respondsToSelector:@selector(tabBar:didSelectIndex:)]) {
        [self.myDelegate tabBar:self didSelectIndex:tap.view.tag];
    }
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    
//    NSArray *imageSelectedArr = @[@"tabbar_icon_3_select",@"tabbar_icon_2_select",@"tabbar_icon_1_select",@"tabbar_icon_4_select"];
    
    self.btnBgImageV.image = KImage(@"tabar_select");
    self.btnBgV.centerX = selectedIndex*KScreen_Width/5+KScreen_Width/5*0.5;
    self.btnBgV.centerY = 7;

    [self setUpSelectedIndex:selectedIndex];
}

#pragma mark - 设置选中的index进行操作
- (void)setUpSelectedIndex:(NSInteger)selectedIndex {
    for (int i = 0; i < self.saveTabBarArrM.count; i++) {
        JMTabBarButton *tbBtn = self.saveTabBarArrM[i];
        if (i == selectedIndex) {
            tbBtn.title.textColor = [[JMConfig config] selTitleColor];
            tbBtn.imageView.image = [UIImage imageNamed:self.selImageArrM[i]];
            
            JMConfigTabBarAnimType type = [[JMConfig config] tabBarAnimType];
            if (type == JMConfigTabBarAnimTypeRotationY) {
                 [tbBtn.imageView.layer addAnimation:[CAAnimation JM_TabBarRotationY] forKey:@"rotateAnimation"];
            } else if (type == JMConfigTabBarAnimTypeScale) {
                
                CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
                CGPoint point = tbBtn.imageView.frame.origin;
                point.y -= 15;
                anim.toValue = [NSNumber numberWithFloat:point.y];
                
                CABasicAnimation *anim1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
                anim1.toValue = [NSNumber numberWithFloat:1.3f];
                
                CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
                groupAnimation.fillMode = kCAFillModeForwards;
                groupAnimation.removedOnCompletion = NO;
                groupAnimation.animations = [NSArray arrayWithObjects:anim,anim1, nil];
                
                [tbBtn.imageView.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
            } else if (type == JMConfigTabBarAnimTypeBoundsMin) {
                [tbBtn.imageView.layer addAnimation:[CAAnimation JM_TabBarBoundsMin] forKey:@"min"];
            } else if (type == JMConfigTabBarAnimTypeBoundsMax) {
                if (selectedIndex == self.bigTag) {
                    [tbBtn.imageView.layer addAnimation:[CAAnimation JM_TabBarBoundsMax_big] forKey:@"max"];
                }else{
                    [tbBtn.imageView.layer addAnimation:[CAAnimation JM_TabBarBoundsMax] forKey:@"max"];
                }
            }
        } else {
            tbBtn.title.textColor = [[JMConfig config] norTitleColor];
            tbBtn.imageView.image = [UIImage imageNamed:self.norImageArrM[i]];
            [tbBtn.imageView.layer removeAllAnimations];
        }
    }
}

#pragma mark - 顶部线条处理(清除颜色)
- (void)topLineIsClearColor:(BOOL)isClearColor {
    UIColor *color = [UIColor clearColor];
    if (!isClearColor) {
        color = [[JMConfig config] tabBarTopLineColor];
    }
    
    CGRect rect = CGRectMake(0, 0, self.width, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self setBackgroundImage:[UIImage new]];
    [self setShadowImage:img];
}

@end
