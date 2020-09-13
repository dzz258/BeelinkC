//
//  ZFJRollView.m
//  ScrollViewZFJ
//
//  Created by ZFJ on 2017/4/26.
//  Copyright © 2017年 ZFJ. All rights reserved.
//

#import "ZFJRollView.h"
#define DEGREES_TO_RADIANS(degrees) ((3.14159265359 * degrees) / 180)

@interface ZFJRollView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) NSArray *rollDataArr;//数据源

@property (nonatomic, assign) float halfGap;//图片间距的一半

@end

@implementation ZFJRollView

- (instancetype)initWithFrame:(CGRect)frame withDistanceForScroll:(float)distance withGap:(float)gap{
    self = [super initWithFrame:frame];
    if (self) {
        self.halfGap = gap / 2;
        /** 设置 UIScrollView */
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(distance, 0, self.frame.size.width - 2 * distance, self.frame.size.height)];
        [self addSubview:self.scrollView];
        self.scrollView.pagingEnabled = YES;
        self.scrollView.delegate = self;
        self.scrollView.clipsToBounds = NO;
        
        /** 添加手势 */
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        [self.scrollView addGestureRecognizer:tap];
        self.scrollView.showsHorizontalScrollIndicator = NO;
        
        /** 数据初始化 */
        self.rollDataArr = [NSArray array];
    }
    return self;
}

#pragma mark - 视图数据
- (void)rollView:(NSArray *)dataArr{
    if (self.rollDataArr.count != 0) {
        return;
    }
    self.rollDataArr = dataArr;
    //循环创建添加轮播图片, 前后各添加一张
    for (int i = 0; i < self.rollDataArr.count + 2; i++) {
        for (UIView *underView in self.scrollView.subviews) {
            if (underView.tag == 400 + i) {
                [underView removeFromSuperview];
            }
        }
        
        /**  说明
        *   1. 设置完 ScrollView的width, 那么分页的宽也为 width.
        *   2. 图片宽为a 间距为 gap, 那么 图片应该在ScrollView上居中, 距离ScrollView左右间距为halfGap.
        *   与 ScrollView的width关系为 width = halfGap + a + halfGap.
        *   3. distance : Scroll距离 底层视图View两侧距离.
        *   假设 要露出上下页内容大小为 m ,   distance = m + halfGap
        *
        *  图片位置对应关系 :
        *  0 ->  2 * halfGap ;
        *  1 ->  3 * halfGap + a ;
        *  2 ->  5 * halfGap + 2 * a ;
        .
        .
        *  i   -> (2 * i +1) *  halfGap + 2 *(width - 2 * halfGap )
        */
        
        UIView *bgView = [[UIView alloc] init];
//        KRadius(bgView, kWidth_fact(23));
        kRedius_Space(bgView, kWidth_fact(23), CGSizeMake(0.2, 0.2), 0.2, color_black8);
//        bgView.clipsToBounds = YES;
        bgView.frame = CGRectMake((2 * i + 1) * self.halfGap + i * (self.scrollView.frame.size.width - 2 * self.halfGap), 0, (self.scrollView.frame.size.width - 2 * self.halfGap), self.frame.size.height);
        bgView.backgroundColor = color_white10;
        [self.scrollView addSubview:bgView];
        
        UIImageView *picImageView = [[UIImageView alloc] init];
        picImageView.userInteractionEnabled = YES;
        picImageView.tag = 400 + i ;
        picImageView.frame = CGRectMake(0, 0, bgView.width, kWidth_fact(178));
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:picImageView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(kWidth_fact(23), kWidth_fact(23))];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = picImageView.bounds;
        maskLayer.path = maskPath.CGPath;
        picImageView.layer.mask = maskLayer;
        //设置图片
        if (i == 0) {
            picImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", self.rollDataArr[self.rollDataArr.count - 1]]];
        }else if (i == self.rollDataArr.count+1) {
            picImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", self.rollDataArr[0]]];
        }else {
            picImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", self.rollDataArr[i - 1]]];
        }
        [bgView addSubview:picImageView];
        
        UIView *titleBgV = [[UIView alloc] init];
        titleBgV.backgroundColor = color_alpha_black5;//kColor_hex_alpha(@"#000000", 0.5);
        [picImageView addSubview:titleBgV];
        [titleBgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.offset(0);
            make.height.offset(kWidth_fact(25));
        }];
        
        UILabel *titleL = [self addLabelText:@"西班牙语基础课程—2020年首批" font:KF_BH_F(15) textC:color_white10];
        [titleBgV addSubview:titleL];
        
        
        UIView *statusV = [[UIView alloc] init];
        statusV.backgroundColor = [UIColor yellowColor];
        statusV.frame = CGRectMake(0, 0, kWidth_fact(85), kWidth_fact(25));
        [titleBgV addSubview:statusV];

        UIBezierPath *statusMaskPath = [UIBezierPath bezierPath];
        [statusMaskPath moveToPoint:CGPointMake(0, 0)];
        [statusMaskPath addLineToPoint:CGPointMake(kWidth_fact(62), 0)];
        [statusMaskPath addArcWithCenter:CGPointMake(kWidth_fact(62), kWidth_fact(23)) radius:kWidth_fact(23) startAngle:DEGREES_TO_RADIANS(278) endAngle:DEGREES_TO_RADIANS(0) clockwise:YES];
        [statusMaskPath addLineToPoint:CGPointMake(kWidth_fact(85), kWidth_fact(25))];
        [statusMaskPath addLineToPoint:CGPointMake(kWidth_fact(23), kWidth_fact(25))];
        [statusMaskPath addArcWithCenter:CGPointMake(kWidth_fact(23), kWidth_fact(2)) radius:kWidth_fact(23) startAngle:DEGREES_TO_RADIANS(90) endAngle:DEGREES_TO_RADIANS(180) clockwise:YES];
        CAShapeLayer *statusMaskLayer = [[CAShapeLayer alloc] init];
        statusMaskLayer.frame = statusV.bounds;
        statusMaskLayer.path = statusMaskPath.CGPath;
        statusV.layer.mask = statusMaskLayer;
        [statusV.layer addSublayer:[UIColor color_shade:CGSizeMake(kWidth_fact(85), kWidth_fact(25)) colors:@[@"#00dac2",@"#fffa18"]]];
        
        [titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(kWidth_fact(16));
            make.centerY.equalTo(titleBgV.mas_centerY);
            make.right.lessThanOrEqualTo(statusV.mas_left).offset(kWidth_fact(-10));
        }];
        
        [statusV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(0);
            make.centerY.equalTo(titleBgV.mas_centerY);
            make.width.offset(kWidth_fact(85));
            make.height.offset(kWidth_fact(25));
        }];
        
        UILabel *statusL = [self addLabelText:@"1 ON 1" font:KF_BH_F(15) textC:color_white10];
        statusL.textAlignment = NSTextAlignmentCenter;
        [statusV addSubview:statusL];
        [statusL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.bottom.offset(0);
        }];
        
        UIButton *playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [playBtn setImage:KImage(@"home_play") forState:UIControlStateNormal];
        [picImageView addSubview:playBtn];
        [playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(kWidth_fact(84));
            make.centerX.equalTo(picImageView.mas_centerX);
        }];
        
        UIButton *headerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        headerBtn.backgroundColor = [UIColor redColor];
        kRadius_WC(headerBtn, kWidth_fact(25), kWidth_fact(2), color_white10);
        [bgView addSubview:headerBtn];
        [headerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(kWidth_fact(10));
            make.centerY.equalTo(picImageView.mas_bottom);
            make.width.height.offset(kWidth_fact(50));
        }];
        
        UIButton *appointmentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        appointmentBtn.frame = CGRectMake(0, 0, kWidth_fact(80), kWidth_fact(27));
        appointmentBtn.backgroundColor = color_cyan9;
        appointmentBtn.titleLabel.font = KF_H_F(11);
        [appointmentBtn setTitleColor:color_white10 forState:UIControlStateNormal];
        [appointmentBtn setTitle:@"＋立即预约" forState:UIControlStateNormal];
        [picImageView addSubview:appointmentBtn];
        
        UIBezierPath *appointmentMaskPath = [UIBezierPath bezierPathWithRoundedRect:appointmentBtn.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(kWidth_fact(23), kWidth_fact(23))];
        CAShapeLayer *appointmentMaskLayer = [[CAShapeLayer alloc] init];
        appointmentMaskLayer.frame = appointmentBtn.bounds;
        appointmentMaskLayer.path = appointmentMaskPath.CGPath;
        appointmentBtn.layer.mask = appointmentMaskLayer;
        
        [appointmentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(picImageView.mas_bottom);
            make.right.equalTo(picImageView.mas_right);
            make.width.offset(kWidth_fact(80));
            make.height.offset(kWidth_fact(27));
        }];
        
        UILabel *scoreL = [self addLabelText:@"4.6分" font:KF_BH_F(11) textC:color_orange8];
        scoreL.backgroundColor = color_orange3;
        KRadius(scoreL, kWidth_fact(2));
        scoreL.textAlignment = NSTextAlignmentCenter;
        [bgView addSubview:scoreL];
        [scoreL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(kWidth_fact(13));
            make.top.equalTo(headerBtn.mas_bottom).offset(kWidth_fact(8));
            make.width.offset(kWidth_fact(45));
            make.height.offset(kWidth_fact(16));
        }];
        
        UILabel *teacherL = [self addLabelText:@"Herman老师Herman老师Herman老师Herman老师Herman老师Herman老师" font:KF_BH_F(15) textC:color_black10];
        [bgView addSubview:teacherL];
        [teacherL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(headerBtn.mas_right).offset(kWidth_fact(9));
            make.top.equalTo(picImageView.mas_bottom).offset(kWidth_fact(10));
            make.width.lessThanOrEqualTo(@kWidth_fact(112));
            make.height.offset(kWidth_fact(15));
        }];
        
        UILabel *sourceL = [self addLabelText:@"来自:" font:KF_H_F(11) textC:color_gray6];
        [bgView addSubview:sourceL];
        [sourceL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(teacherL.mas_right).offset(kWidth_fact(5));
            make.centerY.equalTo(teacherL.mas_centerY);
        }];
        
        UIImageView *countryImageV = [[UIImageView alloc] init];
        countryImageV.backgroundColor = [UIColor redColor];
        countryImageV.contentMode = UIViewContentModeScaleAspectFit;
        [bgView addSubview:countryImageV];
        [countryImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(sourceL.mas_right).offset(kWidth_fact(2));
            make.centerY.equalTo(sourceL.mas_centerY);
            make.width.height.offset(kWidth_fact(12));
        }];
        
        UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [shareBtn setImage:KImage(@"home_share_") forState:UIControlStateNormal];
        [bgView addSubview:shareBtn];
        [shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(picImageView.mas_bottom).offset(11);
            make.right.offset(kWidth_fact(-20));
            make.width.height.offset(kWidth_fact(13));
        }];
        
        UIButton *takeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [takeBtn setImage:KImage(@"home_take_") forState:UIControlStateNormal];
        [bgView addSubview:takeBtn];
        [takeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(shareBtn.mas_centerY);
            make.right.equalTo(shareBtn.mas_left).offset(kWidth_fact(-20));
            make.width.height.offset(kWidth_fact(16));
        }];
        
        UILabel *languageL = [self addLabelText:@"授课语言：西班牙" font:KF_H_F(11) textC:color_gray6];
        [bgView addSubview:languageL];
        [languageL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(teacherL.mas_left);
            make.centerY.equalTo(scoreL.mas_centerY);
            make.width.lessThanOrEqualTo(@kWidth_fact(100));
        }];
        
        UILabel *timeL = [self addLabelText:@"开播：08月01日 20:00" font:KF_H_F(11) textC:color_gray6];
        [bgView addSubview:timeL];
        [timeL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(shareBtn.mas_right);
            make.centerY.equalTo(languageL.mas_centerY);
            make.width.lessThanOrEqualTo(@kWidth_fact(120));
        }];
    }
    //设置轮播图当前的显示区域
    self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * (self.rollDataArr.count + 2), 0);
    
}
-(UILabel *)addLabelText:(NSString *)text font:(UIFont *)f textC:(UIColor *)textC{
    UILabel *label = [[UILabel alloc] init];
    label.font = f;
    label.text = text;
    label.textColor = textC;
    return label;
}
#pragma mark - UIScrollViewDelegate 方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger curIndex = scrollView.contentOffset.x  / self.scrollView.frame.size.width;
    if (curIndex == self.rollDataArr.count + 1) {
        scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);
    }else if (curIndex == 0){
        scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width * self.rollDataArr.count, 0);
    }
}

#pragma mark - 轻拍手势的方法
- (void)tapAction:(UITapGestureRecognizer *)tap{
    if ([self.delegate respondsToSelector:@selector(didSelectPicWithIndexPath:)]) {
        if ([self.rollDataArr isKindOfClass:[NSArray class]] && (self.rollDataArr.count > 0)) {
            [_delegate didSelectPicWithIndexPath:(self.scrollView.contentOffset.x / self.scrollView.frame.size.width)];
        }else{
            [_delegate didSelectPicWithIndexPath:-1];
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
