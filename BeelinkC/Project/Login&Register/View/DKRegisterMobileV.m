//
//  DKRegisterMobileV.m
//  BeelinkC
//
//  Created by Gavin on 2020/8/27.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKRegisterMobileV.h"

#import "DKDropBtn.h"
#import "DKCountDownBtn.h"

#define kAnimationTime  0.8

@interface DKRegisterMobileV ()
@property(nonatomic, strong) UILabel *titleL;
@property(nonatomic, strong) UIView *title_lineV;
@property(nonatomic, strong) UILabel *subTitleL;
@property(nonatomic, strong) UIButton *subTitleBtn;
@property(nonatomic, strong) UIView *mobileInputV;
@property(nonatomic, strong) UIButton *submitBtn;
@property(nonatomic, strong) UIView *agreeV;
@property (nonatomic,strong) UITextField *text_1F;//账号（手机号）
@property (nonatomic,strong) UITextField *text_2F;//验证码
@end

@implementation DKRegisterMobileV

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
        [_title_lineV.layer addSublayer:[UIColor color_shade:CGSizeMake(kWidth_fact(80), kWidth_fact(6)) colors:@[@"#00dac2",@"#fffa18"]]];
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
    
    [self addSubview:self.agreeV];
    [self.agreeV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.submitBtn.mas_bottom).offset(kWidth_fact(6));
        make.centerX.equalTo(self.submitBtn.mas_centerX);
        make.height.offset(kWidth_fact(30));
    }];
}
-(UILabel *)titleL{
    if (!_titleL) {
        _titleL = [[UILabel alloc] init];
        _titleL.text = kLocal_text(@"register_title");
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
        _subTitleL.text = kLocal_text(@"register_subTitle_prefix");
        _subTitleL.font = KF_BH_F(15);
        _subTitleL.textColor = color_black10;
    }
    return _subTitleL;
}
-(UIButton *)subTitleBtn{//注册
    if (!_subTitleBtn) {
        _subTitleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_subTitleBtn setTitleColor:color_cyan9 forState:UIControlStateNormal];
        [_subTitleBtn setTitle:kLocal_text(@"register_subTitle_suffix") forState:UIControlStateNormal];
        _subTitleBtn.titleLabel.font = KF_BH_F(15);
        _subTitleBtn.tag = 1;
        [_subTitleBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _subTitleBtn;
}
-(UIButton *)submitBtn{//登录 提交
    if (!_submitBtn) {
        _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_submitBtn.layer addSublayer:[UIColor color_shade:CGSizeMake(kWidth_fact(335), kWidth_fact(45)) colors:@[@"#00dac2",@"#fffa18"]]];
        [_submitBtn setTitle:kLocal_text(@"register_btn_next") forState:UIControlStateNormal];
        _submitBtn.titleLabel.font = KF_BH_F(13);
        KRadius(_submitBtn, kWidth_fact(22.5));
        _submitBtn.tag = 2;
        [_submitBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//        @weakify(self)
//        [[_submitBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
//            @strongify(self)
//            DKCountDownBtn *countDownBtn = (DKCountDownBtn *)[self viewWithTag:101];
//            [countDownBtn stop];
//        }];
    }
    return _submitBtn;
}
-(UIView *)agreeV{
    if (!_agreeV) {
        _agreeV = [[UIView alloc] init];
//        _agreeV.backgroundColor = [UIColor redColor];
        
        UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [selectBtn setImage:KImage(@"login_agree_") forState:UIControlStateNormal];
        [selectBtn setImage:KImage(@"login_agree_select") forState:UIControlStateSelected];
        [selectBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        selectBtn.tag = 3;
        [_agreeV addSubview:selectBtn];
        [selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(0);
            make.width.height.offset(kWidth_fact(30));
            make.centerY.equalTo(self.agreeV.mas_centerY);
        }];
        
        UILabel *titleL = [[UILabel alloc] init];
        titleL.text = kLocal_text(@"register_agree");
        titleL.font = KF_H_F(12);
        titleL.textColor = color_gray8;
        [_agreeV addSubview:titleL];
        [titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(selectBtn.mas_right);
            make.centerY.equalTo(selectBtn.mas_centerY);
        }];
        
        
        UIButton *agreeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [agreeBtn setTitleColor:color_cyan9 forState:UIControlStateNormal];
        [agreeBtn setTitle:kLocal_text(@"register_protocol") forState:UIControlStateNormal];
        agreeBtn.titleLabel.font = KF_H_F(12);
        agreeBtn.tag = 5;
        [agreeBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_agreeV addSubview:agreeBtn];
        [agreeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(titleL.mas_right);
            make.right.equalTo(self.agreeV.mas_right);
            make.centerY.equalTo(titleL.mas_centerY);
            make.height.equalTo(self.agreeV.mas_height);
        }];
//        "register_agree" = "I read and agree"
//        "register_protocol" = "《to Terms & Conditions 》"
    }
    return _agreeV;
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
            horizontalV.backgroundColor = color_gray7;
            [inputV addSubview:horizontalV];
            [horizontalV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.offset(0);
                make.bottom.equalTo(inputV.mas_bottom);
                make.height.offset(kWidth_fact(1));
            }];
            
            UIView *verticalV = [[UIView alloc] init];
            verticalV.backgroundColor = color_black10;
            [inputV addSubview:verticalV];
            [verticalV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.offset(kWidth_fact(90));
                make.bottom.offset(kWidth_fact(-15));
                make.height.offset(kWidth_fact(14));
                make.width.offset(kWidth_fact(1));
            }];
            
            if (i == 0) {
                [inputV addSubview:self.text_1F];
                [self.text_1F mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.offset(kWidth_fact(-15));
                    make.left.equalTo(verticalV.mas_right).offset(kWidth_fact(15));
                    make.height.equalTo(verticalV.mas_height);
                    make.centerY.equalTo(verticalV.mas_centerY);
                }];
                
                DKDropBtn *arrow = [[DKDropBtn alloc]initWithFrame:CGRectMake(0, 0, kWidth_fact(90), kWidth_fact(50))];
                arrow.titleL.text = @"中国";
                arrow.titleL.font = KF_H_F(13);
                arrow.subTitleL.text = @"+863";
                arrow.subTitleL.font = KF_H_F(13);
                arrow.tag = 4;
                [arrow addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//                kWeakSelf(arrow);
                arrow.arrowBtnClick = ^{
                    
//                    [UIView animateWithDuration:kAnimationTime animations:^{
//                        CGAffineTransform rotation = weakarrow.imageV.transform;
//                        weakarrow.imageV.transform = CGAffineTransformRotate(rotation, M_PI);
//                    }];
                };

                [inputV addSubview:arrow];
                [arrow mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.equalTo(verticalV.mas_right);//.offset(kWidth_fact(-15));
                    make.centerY.equalTo(verticalV.mas_centerY);
                    make.height.offset(kWidth_fact(50));
                    make.width.offset(kWidth_fact(90));
                }];
            }else{
                [inputV addSubview:self.text_2F];
                [self.text_2F mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.offset(kWidth_fact(-15));
                    make.left.equalTo(verticalV.mas_right).offset(kWidth_fact(15));
                    make.height.equalTo(verticalV.mas_height);
                    make.centerY.equalTo(verticalV.mas_centerY);
                }];
                
                DKCountDownBtn *countDownBtn = [[DKCountDownBtn alloc]init];
                countDownBtn.titleLabel.font = KF_H_F(13);
                countDownBtn.tag = 101;
                [inputV addSubview:countDownBtn];
//                kWeakSelf(countDownBtn);
                [countDownBtn setClickBlock:^(DKCountDownBtn * _Nonnull btn) {
                    [btn start];
                }];
//                [countDownBtn setClickButtonBlock:^{
//                    NSLog(@"点击了按钮");
//                }];
                
                [countDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.offset(0);
                    make.right.equalTo(verticalV.mas_right).offset(kWidth_fact(-15));
                    make.height.offset(kWidth_fact(30));
                    make.centerY.equalTo(verticalV.mas_centerY);
                }];
                
                [countDownBtn setCompleteBlock:^(DKCountDownBtn * _Nonnull btn) {
                    NSLog(@"倒计时完成");
                }];
            }
        }
    }
    return _mobileInputV;
}
-(UITextField *)text_1F{
    if (!_text_1F) {
        _text_1F = [[UITextField alloc] init];
        _text_1F.font = KF_H_F(13);
        _text_1F.keyboardType = UIKeyboardTypeNumberPad;
        _text_1F.clearButtonMode = UITextFieldViewModeWhileEditing;
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:kLocal_text(@"login_input_phone") attributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:_text_1F.font}];
        _text_1F.attributedPlaceholder = attrString;
    }
    return _text_1F;
}

-(UITextField *)text_2F{
    if (!_text_2F) {
        _text_2F = [[UITextField alloc] init];
        _text_2F.font = KF_H_F(13);
//        _text_2F.placeholder = @"请输入验证码";
//        _text_2F.backgroundColor = DCColor_gray11;
//        _text_2F.clearButtonMode = UITextFieldViewModeWhileEditing;
//        _text_2F.secureTextEntry = YES;
//        _text_2F.textContentType = UITextContentTypePassword;
        _text_2F.keyboardType = UIKeyboardTypeASCIICapable;
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:kLocal_text(@"login_input_code") attributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:_text_2F.font}];
        _text_2F.attributedPlaceholder = attrString;
    }
    return _text_2F;
}
-(void)btnClick:(UIButton *)btn{
    NSLog(@"%ld",(long)btn.tag);
    if (btn.tag == 3) {
        btn.selected = !btn.selected;
    }
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
