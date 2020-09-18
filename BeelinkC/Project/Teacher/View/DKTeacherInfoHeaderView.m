//
//  DKTeacherInfoHeaderView.m
//  BeelinkC
//
//  Created by Gavin on 2020/9/16.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKTeacherInfoHeaderView.h"

@interface DKTeacherInfoHeaderView ()<UIScrollViewDelegate>
@property (nonatomic, strong)UIImageView *picImageV;

@property (nonatomic, strong) UIButton *headerBtn;
@property (nonatomic, strong) UILabel *teacherL;
@property (nonatomic, strong) UILabel *sourceL;
@property (nonatomic, strong) UIImageView *countryImageV;
@property (nonatomic, strong) UIButton *shareBtn;
@property (nonatomic, strong) UIButton *takeBtn;

@property (nonatomic, strong) UIImageView *teachLangueImaegV;
@property (nonatomic, strong) UILabel *teachLangueL;
@property (nonatomic, strong) UILabel *teachLangueValL;

@property (nonatomic, strong) UIImageView *canLangueImaegV;
@property (nonatomic, strong) UILabel *canLangueL;
@property (nonatomic, strong) UIView *canLangueValV;

@property (nonatomic, strong) UIImageView *introImageV;
@property (nonatomic, strong) UILabel *introL;
@property (nonatomic, strong) UILabel *intro_contentL;

@end

@implementation DKTeacherInfoHeaderView

-(instancetype)init{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, KScreen_Width, kWidth_fact(211));
        [self addV];
    }
    return self;
}

-(void)addV{
    [self addSubview:self.picImageV];
    
    [self addSubview:self.headerBtn];
    
    [self addSubview:self.teacherL];
    [self.teacherL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerBtn.mas_right).offset(kWidth_fact(13));
        make.top.equalTo(self.headerBtn.mas_top).offset(kWidth_fact(13));
        make.width.lessThanOrEqualTo(@kWidth_fact(165));
        make.height.offset(kWidth_fact(15));
    }];
    
    [self addSubview:self.sourceL];
    [self.sourceL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.teacherL.mas_right).offset(kWidth_fact(5));
        make.centerY.equalTo(self.teacherL.mas_centerY);
    }];
    
    [self addSubview:self.countryImageV];
    [self.countryImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sourceL.mas_right).offset(kWidth_fact(2));
        make.centerY.equalTo(self.sourceL.mas_centerY);
        make.width.height.offset(kWidth_fact(12));
    }];
    
    
    
    [self addSubview:self.shareBtn];
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.teacherL.mas_centerY);
        make.right.offset(kWidth_fact(-15));
        make.width.height.offset(kWidth_fact(15));
    }];
    
    
    [self addSubview:self.takeBtn];
    [self.takeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.shareBtn.mas_centerY);
        make.right.equalTo(self.shareBtn.mas_left).offset(kWidth_fact(-20));
        make.width.height.offset(kWidth_fact(16));
    }];
    
    
    [self addSubview:self.teachLangueImaegV];

    [self addSubview:self.teachLangueL];
    [self.teachLangueL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.teachLangueImaegV.mas_right).offset(kWidth_fact(3));
        make.centerY.equalTo(self.teachLangueImaegV.mas_centerY);
    }];
    
    [self addSubview:self.teachLangueValL];
    [self.teachLangueValL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.teachLangueL.mas_right).offset(kWidth_fact(10));
        make.centerY.equalTo(self.teachLangueL.mas_centerY);
        make.width.lessThanOrEqualTo(@kWidth_fact(50));
    }];
    
    [self addSubview:self.canLangueL];
    [self.canLangueL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.teachLangueValL.mas_right).offset(kWidth_fact(15));
        make.centerY.equalTo(self.teachLangueValL.mas_centerY);
    }];
    
    [self addSubview:self.canLangueValV];
    [self.canLangueValV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.canLangueL.mas_right).offset(kWidth_fact(5));
        make.height.offset(kWidth_fact(20));
        make.centerY.equalTo(self.canLangueL.mas_centerY);
        make.right.offset(kWidth_fact(-15));
    }];
    
    [self addSubview:self.introImageV];

    [self addSubview:self.introL];
    [self.introL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.introImageV.mas_right).offset(kWidth_fact(3));
        make.centerY.equalTo(self.introImageV.mas_centerY);
    }];
    
    [self addSubview:self.intro_contentL];
//    [self.intro_contentL mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.introImageV.mas_left);
//        make.top.equalTo(self.introImageV.mas_bottom).offset(kWidth_fact(10));
//        make.right.equalTo(self.mas_right).offset(kWidth_fact(-15));
//    }];
    [self setHeight:CGRectGetMaxY(self.intro_contentL.frame)+kWidth_fact(20)];
//    [self mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.picImageV.mas_left);
//        make.top.equalTo(self.picImageV.mas_top);
//        make.right.equalTo(self.picImageV.mas_right);
//        make.bottom.equalTo(self.intro_contentL.mas_bottom).offset(kWidth_fact(20));
//    }];
    

}
-(UIImageView *)picImageV{
    if (!_picImageV) {
        _picImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, kWidth_fact(211))];
        _picImageV.backgroundColor = [UIColor redColor];
        UIButton *playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [playBtn setImage:KImage(@"home_play") forState:UIControlStateNormal];
        [_picImageV addSubview:playBtn];
        [playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(kWidth_fact(96));
            make.centerX.equalTo(self.picImageV.mas_centerX);
        }];
    }
    return _picImageV;
}

-(UIButton *)headerBtn{
    if (!_headerBtn) {
        _headerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _headerBtn.frame = CGRectMake(kWidth_fact(15), CGRectGetMaxY(self.picImageV.frame)+kWidth_fact(15), kWidth_fact(50), kWidth_fact(50));
        _headerBtn.backgroundColor = [UIColor redColor];
        KRadius(_headerBtn, kWidth_fact(25));
//        kRadius_WC(_headerBtn, kWidth_fact(25), kWidth_fact(2), color_white10);
    }
    return _headerBtn;
}
-(UILabel *)teacherL{
    if (!_teacherL) {
        _teacherL = [self addLabelText:@"Herman老师Herman老师Herman老师Herman老师Herman老师Herman老师" font:KF_BH_F(15) textC:color_black10];
    }
    return _teacherL;
}
-(UILabel *)sourceL{
    if (!_sourceL) {
        _sourceL = [self addLabelText:@"来自:" font:KF_H_F(11) textC:color_gray6];
    }
    return _sourceL;
}

-(UIImageView *)countryImageV{
    if (!_countryImageV) {
        _countryImageV = [[UIImageView alloc] init];
        _countryImageV.backgroundColor = [UIColor redColor];
        _countryImageV.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _countryImageV;
}
-(UIButton *)shareBtn{
    if (!_shareBtn) {
        _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareBtn setImage:KImage(@"home_share_") forState:UIControlStateNormal];
    }
    return _shareBtn;
}

-(UIButton *)takeBtn{
    if (!_takeBtn) {
        _takeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_takeBtn setImage:KImage(@"home_take_") forState:UIControlStateNormal];
    }
    return _takeBtn;
}

-(UIImageView *)teachLangueImaegV{
    if (!_teachLangueImaegV) {
        _teachLangueImaegV = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headerBtn.frame)+kWidth_fact(13), self.headerBtn.top+kWidth_fact(43), kWidth_fact(16), kWidth_fact(17))];
//        _teachLangueImaegV.backgroundColor = [UIColor redColor];
        _teachLangueImaegV.image = KImage(@"langue_icon");
        
//        [self.teachLangueImaegV mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.teacherL.mas_left);
//            make.top.equalTo(self.teacherL.mas_bottom).offset(kWidth_fact(15));
//            make.width.offset(kWidth_fact(16));
//            make.height.offset(kWidth_fact(17));
//        }];
    }
    return _teachLangueImaegV;
}

-(UIImageView *)introImageV{
    if (!_introImageV) {
        _introImageV = [[UIImageView alloc] initWithFrame:CGRectMake(self.teachLangueImaegV.left, CGRectGetMaxY(self.teachLangueImaegV.frame)+kWidth_fact(20), kWidth_fact(16), kWidth_fact(17))];
//        _canLangueImaegV.backgroundColor = [UIColor redColor];
        _introImageV.image = KImage(@"langue_icon");
    }
    return _introImageV;
}

-(UILabel *)teachLangueL{
    if (!_teachLangueL) {
        _teachLangueL = [self addLabelText:@"授课" font:KF_BH_F(13) textC:color_black10];
    }
    return _teachLangueL;
}

-(UILabel *)canLangueL{
    if (!_canLangueL) {
        _canLangueL = [self addLabelText:@"同时会说" font:KF_BH_F(13) textC:color_black10];
    }
    return _canLangueL;
}

-(UILabel *)teachLangueValL{
    if (!_teachLangueValL) {
        _teachLangueValL = [self addLabelText:@"西班牙语西班牙语西班牙语西班牙语西班牙语西班牙语西班牙语西班牙语西班牙语" font:KF_H_F(11) textC:color_gray6];
    }
    return _teachLangueValL ;
}

-(UIView *)canLangueValV{
    if (!_canLangueValV) {
        _canLangueValV = [[UIView alloc] init];
        _canLangueValV.backgroundColor = [UIColor redColor];
    }
    return _canLangueValV;
}

-(UILabel *)introL{
    if (!_introL) {
        _introL = [self addLabelText:@"个人简介" font:KF_BH_F(13) textC:color_black10];
    }
    return _introL;
}

-(UILabel *)intro_contentL{
    if (!_intro_contentL) {
        _intro_contentL = [self addLabelText:@"西班牙专业学士,从事西班牙语言教育数年，有丰富的教\n学经验。性格开朗活泼，语感和表达能力较强。" font:KF_BH_F(11) textC:color_gray6];
        _intro_contentL.frame = CGRectMake(self.introImageV.left, CGRectGetMaxY(self.introImageV.frame)+kWidth_fact(10), self.width-self.introImageV.left-kWidth_fact(15), kWidth_fact(20));
        _intro_contentL.numberOfLines = 0;
        [_intro_contentL sizeToFit];
    }
    return _intro_contentL;
}

-(UILabel *)addLabelText:(NSString *)text font:(UIFont *)f textC:(UIColor *)textC{
    UILabel *label = [[UILabel alloc] init];
    label.font = f;
    label.text = text;
    label.textColor = textC;
    return label;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
