//
//  DKLoginViewController.m
//  ldsapp
//
//  Created by Gavin on 2020/3/15.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKLoginViewController.h"
#import "JKCountDownButton.h"
#import "UILabel+YBAttributeTextTapAction.h"
#import "NSString+AttributedString.h"
#import "DKLoginViewModel.h"
#import "DKWKWebViewBsseViewController.h"

@interface DKLoginViewController ()
/**
 为了让键盘遮挡上移生效
 */
@property (nonatomic, strong) UIScrollView *bgScrollView;
@property (nonatomic, strong) DKLoginViewModel *viewModel;
@property (nonatomic,strong) UITextField *text_1F;//账号（手机号）
@property (nonatomic,strong) UITextField *text_2F;//验证码
@property (nonatomic, strong) JKCountDownButton *codeBtn;
@property (nonatomic, strong) UIButton *loginBtn;

@end

@implementation DKLoginViewController

- (DKLoginViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [DKLoginViewModel viewModel];
    }
    return _viewModel;
}

-(UIScrollView *)bgScrollView{
    if (!_bgScrollView) {
        _bgScrollView = [[UIScrollView alloc] init];
        _bgScrollView.frame = CGRectMake(0, 0, KScreen_Width, KScreen_Height);
//        _bgScrollView.backgroundColor = DCColor_nav_blue;
        _bgScrollView.contentSize = CGSizeMake(KScreen_Width, KScreen_Height+0.01);
    }
    return _bgScrollView;
}
-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.titleLabel.font = KF_H_F(15);
//        [_loginBtn setTitleColor:color_btn_title_white forState:UIControlStateNormal];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
//        [_loginBtn setBackgroundColor:color_btn_bg];
        KRadius(_loginBtn, 10);
        @weakify(self)
        [[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            @strongify(self)
            [self gotoLogin];
        }];
    }
    return _loginBtn;
}
-(void)gotoLogin{
    kWeakSelf(self);
    [self loading:YES hint:@"   登录中..."];
    [self.viewModel api_login:self.text_1F.text code:self.text_2F.text success:^(id  _Nonnull data) {
        weakself.loading = NO;
        [weakself.codeBtn destroyCountDown];
    } failure:^(NSError * _Nonnull error) {
        weakself.loading = NO;
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self addLeftBarButtonWithImage:KImage(@"nav_back") action:@selector(goBack)];
    if (@available(iOS 11.0, *)) {
        self.bgScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.view addSubview:self.bgScrollView];
}
-(void)_addSubviews{
    UIImageView *iconImageV = [[UIImageView alloc] init];
    iconImageV.image = KImage(@"login_icon");
    [self.bgScrollView addSubview:iconImageV];
    [iconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(@(kTopHeight+kWidth_fact(56)));
        make.width.equalTo(@kWidth_fact(126));
        make.height.equalTo(@kWidth_fact(90));
    }];
    
    UIView *text1Bg = [[UIView alloc] init];
//    text1Bg.backgroundColor = color_view_bg_lividity3;
    KRadius(text1Bg, kWidth_fact(4));
    [self.bgScrollView addSubview:text1Bg];
    [text1Bg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconImageV.mas_bottom).offset(kWidth_fact(55));
        make.left.equalTo(@kWidth_fact(46));
        make.right.equalTo(self.view.mas_right).offset(-kWidth_fact(46));
        make.height.equalTo(@kWidth_fact(45));
    }];
    
    
    UILabel *areaL = [[UILabel alloc] init];
    areaL.text = @"+86";
    areaL.font = KF_H_F(15);
//    areaL.textColor = color_textF_title;
    areaL.textAlignment = NSTextAlignmentRight;
    [text1Bg addSubview:areaL];
    
    [areaL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.centerY.equalTo(text1Bg.mas_centerY);
        make.width.equalTo(@kWidth_fact(39));
    }];
    
    UIView *lineV = [[UIView alloc] init];
//    lineV.backgroundColor = color_table_group_line;
    [text1Bg addSubview:lineV];
    [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(areaL.mas_right).offset(kWidth_fact(10));
        make.centerY.equalTo(areaL.mas_centerY);
        make.height.equalTo(@kWidth_fact(25));
        make.width.equalTo(@kWidth_fact(1));
    }];
    
    [text1Bg addSubview:self.text_1F];
    [self.text_1F mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineV.mas_right).offset(kWidth_fact(10));
        make.right.equalTo(text1Bg.mas_right).offset(-kWidth_fact(10));
        make.centerY.equalTo(text1Bg.mas_centerY);
        make.height.equalTo(@kWidth_fact(40));
    }];
    
    UIView *text2Bg = [[UIView alloc] init];
//    text2Bg.backgroundColor = color_view_bg_lividity3;
    KRadius(text2Bg, kWidth_fact(4));
    [self.bgScrollView addSubview:text2Bg];
    [text2Bg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(text1Bg.mas_bottom).offset(kWidth_fact(13));
        make.left.equalTo(text1Bg.mas_left);
        make.width.equalTo(@kWidth_fact(180));
        make.height.equalTo(@kWidth_fact(45));
    }];
    
    [text2Bg addSubview:self.text_2F];
    [self.text_2F mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@kWidth_fact(10));
        make.right.equalTo(text2Bg.mas_right).offset(-kWidth_fact(10));
        make.centerY.equalTo(text2Bg.mas_centerY);
        make.height.equalTo(@kWidth_fact(40));
    }];
    
    [self.bgScrollView addSubview:self.codeBtn];
    [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(text2Bg.mas_centerY);
        make.right.equalTo(text1Bg.mas_right);
        make.height.equalTo(text2Bg.mas_height);
        make.width.equalTo(@kWidth_fact(90));
    }];

    [self.bgScrollView addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(text2Bg.mas_bottom).offset(kWidth_fact(53));
        make.left.equalTo(text1Bg.mas_left);
        make.right.equalTo(text1Bg.mas_right);
        make.height.equalTo(@kWidth_fact(45));
    }];
    
    UILabel *TCPL = [[UILabel alloc] init];
    TCPL.text = @"登录即代表阅读并同意服务协议";
    TCPL.font = KF_H_F(11);
//    TCPL.textColor = color_main_gray4;
    TCPL.numberOfLines = 0;
    [self.bgScrollView addSubview:TCPL];
    
//    TCPL.attributedText = [TCPL.text stringWithParagraphlineSpeace:0 NormalAttributeFC:@{} withKeyTextColor:@[@"服务协议"] KeyAttributeFC:@{NSForegroundColorAttributeName:color_main_title_black}];
    
    [TCPL yb_addAttributeTapActionWithStrings:@[@"服务协议"] tapClicked:^(UILabel *label, NSString *string, NSRange range, NSInteger index) {
        NSLog(@"点击了用户协议");
        NSLog(@"index=>%ld",(long)index);
        self.loading = YES;
        [DKLoginViewModel api_user_agreementSuccess:^(id  _Nonnull data) {
            self.loading = NO;
            DKWKWebViewBsseViewController *wkWebVC = [[DKWKWebViewBsseViewController alloc] init];
            wkWebVC.urlPath = [NSString null_str:data[@"agreement_url"]];
            [self.navigationController pushViewController:wkWebVC animated:YES];
        } failure:^(NSError * _Nonnull error) {
            self.loading = NO;
        }];
    }];
    TCPL.textAlignment = NSTextAlignmentCenter;
    [TCPL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.loginBtn.mas_left);
        make.top.equalTo(self.loginBtn.mas_bottom).offset(kWidth_fact(15));
        make.right.equalTo(self.loginBtn.mas_right);
    }];
}

-(UITextField *)text_1F{
    if (!_text_1F) {
        _text_1F = [[UITextField alloc] init];
        _text_1F.font = KF_H_F(15);
//        _text_1F.backgroundColor = DCColor_gray11;
        _text_1F.keyboardType = UIKeyboardTypeNumberPad;
        _text_1F.clearButtonMode = UITextFieldViewModeWhileEditing;
//        _text_1F.textColor = color_textF_title;
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"请输入手机账号" attributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:_text_1F.font}];
        _text_1F.attributedPlaceholder = attrString;
    }
    return _text_1F;
}

-(UITextField *)text_2F{
    if (!_text_2F) {
        _text_2F = [[UITextField alloc] init];
        KRadius(_text_2F, kWidth_fact(2));
        _text_2F.font = KF_H_F(15);
        _text_2F.placeholder = @"请输入验证码";
//        _text_2F.backgroundColor = DCColor_gray11;
//        _text_2F.clearButtonMode = UITextFieldViewModeWhileEditing;
//        _text_2F.secureTextEntry = YES;
//        _text_2F.textContentType = UITextContentTypePassword;
        _text_2F.keyboardType = UIKeyboardTypeASCIICapable;
//        _text_2F.textColor = color_textF_title;
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"请输入验证码" attributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:_text_1F.font}];
        _text_2F.attributedPlaceholder = attrString;
    }
    return _text_2F;
}
-(UIButton *)codeBtn{
    if (!_codeBtn) {
        _codeBtn = [JKCountDownButton buttonWithType:UIButtonTypeCustom];
        _codeBtn.titleLabel.font = KF_H_F(15);
//        [_codeBtn setTitleColor:color_btn_title_white forState:UIControlStateNormal];
//        [_codeBtn setBackgroundColor:color_btn_bg];
        KRadius(_codeBtn, kWidth_fact(4));
        [_codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        kWeakSelf(self);
        [_codeBtn countDownButtonHandler:^(JKCountDownButton *countDownButton, NSInteger tag) {
            countDownButton.enabled = NO;
            [weakself send_sms];
        }];
        [_codeBtn countDownFinished:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
            countDownButton.enabled = YES;
//            [countDownButton setTitleColor:color_btn_title_white forState:UIControlStateNormal];
//            [countDownButton setBackgroundColor:color_btn_bg];
            return @"重新发送";
        }];
    }
    return _codeBtn;
}
-(void)send_sms{
    kWeakSelf(self);
    [self loading:YES hint:@""];
    [self.viewModel api_sms:[NSString null_str:self.text_1F.text] success:^(id  _Nonnull data) {
        weakself.loading = NO;
        [weakself.codeBtn startCountDownWithSecond:60];
//        [weakself.codeBtn setBackgroundColor:color_view_bg_lividity3];
//        [weakself.codeBtn setTitleColor:color_btn_bg forState:UIControlStateNormal];
        [weakself.codeBtn countDownChanging:^NSString *(JKCountDownButton *countDownButton,NSUInteger second) {
            NSString *title = [NSString stringWithFormat:@"剩余%zd秒",second];
            return title;
        }];
    } failure:^(NSError * _Nonnull error) {
        weakself.loading = NO;
        weakself.codeBtn.enabled = YES;
    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
