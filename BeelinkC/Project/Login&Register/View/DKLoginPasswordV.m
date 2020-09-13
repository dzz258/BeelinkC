//
//  DKLoginPasswordV.m
//  BeelinkC
//
//  Created by Gavin on 2020/8/27.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKLoginPasswordV.h"

#define kAnimationTime  0.8

@interface DKLoginPasswordV ()

@property(nonatomic, strong) UILabel *titleL;
@property(nonatomic, strong) UIView *title_lineV;
@property(nonatomic, strong) UILabel *subTitleL;
@property(nonatomic, strong) UIButton *subTitleBtn;
@property(nonatomic, strong) UIView *mobileInputV;
@property(nonatomic, strong) UIButton *submitBtn;
@property(nonatomic, strong) UIButton *transformBtn;
@property(nonatomic, strong) UIView *thirdLoginV;
@property (nonatomic,strong) UITextField *text_1F;//账号（手机号）
@property (nonatomic,strong) UITextField *text_2F;//验证码

@end

@implementation DKLoginPasswordV

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initV];
    }
    return self;
}
-(void)initV{
    [self addSubview:self.title_lineV];
    [self addSubview:self.titleL];
    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.offset(kWidth_fact(20));
        make.height.offset(kWidth_fact(24));
    }];
    
    [self.title_lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleL.mas_left);
        make.bottom.equalTo(self.titleL.mas_bottom).offset(kWidth_fact(2));
        make.right.equalTo(self.titleL.mas_right);
        make.height.offset(kWidth_fact(6));
    }];
    
    if ([kLocal_text(@"language") isEqualToString:@"en"]) {
        [_title_lineV.layer addSublayer:[UIColor color_shade:CGSizeMake(kWidth_fact(70), kWidth_fact(6)) colors:@[@"#00dac2",@"#fffa18"]]];
    }else{
        [_title_lineV.layer addSublayer:[UIColor color_shade:CGSizeMake(kWidth_fact(50), kWidth_fact(6)) colors:@[@"#00dac2",@"#fffa18"]]];
    }
    [self addSubview:self.subTitleL];
    [self.subTitleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleL.mas_left);
        make.top.equalTo(self.titleL.mas_bottom).offset(kWidth_fact(19));
        make.height.offset(kWidth_fact(16));
    }];
    
    [self addSubview:self.subTitleBtn];
    [self.subTitleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.subTitleL.mas_right);
        make.centerY.equalTo(self.subTitleL.mas_centerY);
    }];
    
    [self addSubview:self.mobileInputV];
    [self.mobileInputV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.subTitleL.mas_bottom).offset(kWidth_fact(32));
        make.left.equalTo(self.titleL.mas_left);
        make.right.offset(kWidth_fact(-20));
        make.height.offset(kWidth_fact(114));
    }];
    
    [self addSubview:self.submitBtn];
    [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mobileInputV.mas_bottom).offset(kWidth_fact(55));
        make.centerX.equalTo(self.mas_centerX);
        make.width.offset(kWidth_fact(335));
        make.height.offset(kWidth_fact(45));
    }];
    
    [self addSubview:self.transformBtn];
    [self.transformBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.submitBtn.mas_bottom).offset(kWidth_fact(15));
        make.centerX.equalTo(self.submitBtn.mas_centerX);
    }];
    
    [self addSubview:self.thirdLoginV];
    [self.thirdLoginV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.height.offset(kWidth_fact(35));
        make.bottom.equalTo(self.mas_bottom).offset(kHeight_fact(-30)-kXoffsetHeight);
    }];
}
-(UILabel *)titleL{
    if (!_titleL) {
        _titleL = [[UILabel alloc] init];
        _titleL.text = kLocal_text(@"login_title");
        _titleL.font = KF_BH_F(25);
        _titleL.textColor = color_black8;
    }
    return _titleL;
}
-(UIView *)title_lineV{
    if (!_title_lineV) {
        _title_lineV = [[UIView alloc] init];
        KRadius(_title_lineV, kWidth_fact(3));
    }
    return _title_lineV;
}
-(UILabel *)subTitleL{
    if (!_subTitleL) {
        _subTitleL = [[UILabel alloc] init];
        _subTitleL.text = kLocal_text(@"login_subTitle_prefix");
        _subTitleL.font = KF_BH_F(15);
        _subTitleL.textColor = color_black10;
    }
    return _subTitleL;
}
-(UIButton *)subTitleBtn{
    if (!_subTitleBtn) {
        _subTitleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_subTitleBtn setTitleColor:color_cyan9 forState:UIControlStateNormal];
        [_subTitleBtn setTitle:kLocal_text(@"login_subTitle_suffix") forState:UIControlStateNormal];
        _subTitleBtn.titleLabel.font = KF_BH_F(15);
        _subTitleBtn.tag = 1;
        [_subTitleBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _subTitleBtn;
}
-(UIButton *)submitBtn{
    if (!_submitBtn) {
        _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_submitBtn.layer addSublayer:[UIColor color_shade:CGSizeMake(kWidth_fact(335), kWidth_fact(45)) colors:@[@"#00dac2",@"#fffa18"]]];
        [_submitBtn setTitle:kLocal_text(@"login_enter") forState:UIControlStateNormal];
        _submitBtn.titleLabel.font = KF_BH_F(13);
        KRadius(_submitBtn, kWidth_fact(22.5));
        _submitBtn.tag = 2;
        [_submitBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _submitBtn;
}
-(UIButton *)transformBtn{
    if (!_transformBtn) {
        _transformBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_transformBtn setTitle:kLocal_text(@"login_code") forState:UIControlStateNormal];
        _transformBtn.titleLabel.font = KF_H_F(13);
        [_transformBtn setTitleColor:color_gray8 forState:UIControlStateNormal];
        _transformBtn.tag = 3;
        [_transformBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _transformBtn;
}

-(UIView *)mobileInputV{
    if (!_mobileInputV) {
        _mobileInputV = [[UIView alloc] init];
        for (int i = 0; i<2; i++) {
            UIView *inputV = [[UIView alloc] init];
            [_mobileInputV addSubview:inputV];
            [inputV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.offset(0);
                make.top.offset(i*kWidth_fact(57));
                make.height.offset(kWidth_fact(57));
            }];
            
            UIView *horizontalV = [[UIView alloc] init];
            horizontalV.backgroundColor = color_n_gray7;
            [inputV addSubview:horizontalV];
            [horizontalV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.offset(0);
                make.bottom.equalTo(inputV.mas_bottom);
                make.height.offset(kWidth_fact(1));
            }];
            
            if (i == 0) {
                [inputV addSubview:self.text_1F];
                [self.text_1F mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.offset(kWidth_fact(-15));
                    make.left.offset(0);
                    make.height.offset(kWidth_fact(30));
                    make.bottom.equalTo(horizontalV.mas_bottom).offset(kWidth_fact(-7));
                }];
                
                
            
            }else{
//                [self.text_2F mas_makeConstraints:^(MASConstraintMaker *make) {
//                    make.right.equalTo(btn.masc).offset(kWidth_fact(-15));
//                    make.left.offset(0);
//                    make.height.offset(kWidth_fact(30));
//                    make.bottom.equalTo(horizontalV.mas_bottom).offset(kWidth_fact(-7));
//                }];
                
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                [btn setTitleColor:color_cyan9 forState:UIControlStateNormal];
                [btn setTitle:kLocal_text(@"login_btn_forget-pass") forState:UIControlStateNormal];
                btn.titleLabel.font = KF_BH_F(15);
                btn.tag = 5;
                [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
                [inputV addSubview:btn];
                [inputV addSubview:self.text_2F];

                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.offset(0);
                    make.centerY.equalTo(self.text_2F.mas_centerY);
                    CGFloat with = kStr_width(kLocal_text(@"login_btn_forget-pass"), kWidth_fact(200), KF_BH_F(15))+10;
                    make.height.offset(kWidth_fact(30));
                    make.width.offset(with);
                }];
                
                [self.text_2F mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.equalTo(btn.mas_left).offset(kWidth_fact(-15));
                    make.left.offset(0);
                    make.height.offset(kWidth_fact(30));
                    make.bottom.equalTo(horizontalV.mas_bottom).offset(kWidth_fact(-7));
                }];
            }
        }
    }
    return _mobileInputV;
}
-(UIView *)thirdLoginV{
    if (!_thirdLoginV) {
        _thirdLoginV = [[UIView alloc] init];
        UILabel *titleL = [[UILabel alloc] init];
        titleL.text = kLocal_text(@"login_third");
        titleL.font = KF_H_F(13);
        titleL.textColor = color_black8;
        [_thirdLoginV addSubview:titleL];
        [titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(kWidth_fact(20));
            make.centerY.equalTo(self.thirdLoginV.mas_centerY);
        }];
        NSArray *array = @[@"login_facebook",@"login_weibo",@"login_weixin",@"login_apple"];
        for (int i = 0; i<array.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setImage:KImage(array[i]) forState:UIControlStateNormal];
            [_thirdLoginV addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.offset(kWidth_fact(-20)-i*kWidth_fact(50));
                make.centerY.equalTo(self.thirdLoginV.mas_centerY);
                make.width.height.offset(kWidth_fact(35));
            }];
        }
    }
    return _thirdLoginV;
}
-(UITextField *)text_1F{
    if (!_text_1F) {
        _text_1F = [[UITextField alloc] init];
        _text_1F.font = KF_H_F(13);
        _text_1F.keyboardType = UIKeyboardTypeNumberPad;
        _text_1F.clearButtonMode = UITextFieldViewModeWhileEditing;
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:kLocal_text(@"login_input_account") attributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:_text_1F.font}];
        _text_1F.attributedPlaceholder = attrString;
    }
    return _text_1F;
}

-(UITextField *)text_2F{
    if (!_text_2F) {
        _text_2F = [[UITextField alloc] init];
        _text_2F.font = KF_H_F(13);
        _text_2F.clearButtonMode = UITextFieldViewModeWhileEditing;
        _text_2F.secureTextEntry = YES;
        _text_2F.textContentType = UITextContentTypePassword;
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:kLocal_text(@"login_input_pass") attributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:_text_2F.font}];
        _text_2F.attributedPlaceholder = attrString;
    }
    return _text_2F;
}
-(void)btnClick:(UIButton *)btn{
    NSLog(@"%ld",(long)btn.tag);
    if (self.click) {
        self.click(btn.tag);
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
