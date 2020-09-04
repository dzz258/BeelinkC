//
//  DKForgetStep1ViewController.m
//  BeelinkC
//
//  Created by Gavin on 2020/9/4.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKForgetStep1ViewController.h"
#import "DKForgetStep2ViewController.h"

@interface DKForgetStep1ViewController ()

@property(nonatomic, strong) UILabel *titleL;
@property(nonatomic, strong) UIView *title_lineV;
@property(nonatomic, strong) UILabel *subTitleL;
@property(nonatomic, strong) UIView *mobileInputV;
@property(nonatomic, strong) UIButton *submitBtn;
@property (nonatomic,strong) UITextField *text_1F;//账号（手机号）

@end

@implementation DKForgetStep1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addLeftImage:KImage(@"nav_back_cyan") action:@selector(goBack)];

}
- (void)_addSubviews{
    [self.view addSubview:self.title_lineV];
    [self.view addSubview:self.titleL];
    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(kTopHeight+kWidth_fact(75));
        make.left.offset(kWidth_fact(20));
        make.height.offset(kWidth_fact(24));
    }];
    
    [self.title_lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.titleL.mas_bottom).offset(kWidth_fact(2));
        make.centerX.equalTo(self.titleL.mas_centerX);
        make.height.offset(kWidth_fact(6));
        if ([kLocal_text(@"language") isEqualToString:@"en"]) {
            make.width.offset(kWidth_fact(190));
        }else{
            make.width.offset(kWidth_fact(100));
        }
    }];
    
    if ([kLocal_text(@"language") isEqualToString:@"en"]) {
        [self.title_lineV.layer addSublayer:[UIColor color_shade:CGSizeMake(kWidth_fact(190), kWidth_fact(6)) colors:@[@"#00dac2",@"#fffa18"]]];
    }else{
        [self.title_lineV.layer addSublayer:[UIColor color_shade:CGSizeMake(kWidth_fact(100), kWidth_fact(6)) colors:@[@"#00dac2",@"#fffa18"]]];
    }
    [self.view addSubview:self.subTitleL];
    [self.subTitleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleL.mas_left);
        make.top.equalTo(self.titleL.mas_bottom).offset(kWidth_fact(19));
        make.height.offset(kWidth_fact(16));
    }];
    
    [self.view addSubview:self.mobileInputV];
    [self.mobileInputV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.subTitleL.mas_bottom).offset(kWidth_fact(32));
        make.left.equalTo(self.titleL.mas_left);
        make.right.offset(kWidth_fact(-20));
        make.height.offset(kWidth_fact(57));
    }];
    
    [self.view addSubview:self.submitBtn];
    [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mobileInputV.mas_bottom).offset(kWidth_fact(112));
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.offset(kWidth_fact(335));
        make.height.offset(kWidth_fact(45));
    }];
}
-(UILabel *)titleL{
    if (!_titleL) {
        _titleL = [[UILabel alloc] init];
        _titleL.text = kLocal_text(@"forget_step1_title");
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
        _subTitleL.text = kLocal_text(@"forget_step1_subTitle");
        _subTitleL.font = KF_BH_F(15);
        _subTitleL.textColor = color_black10;
    }
    return _subTitleL;
}

-(UIButton *)submitBtn{
    if (!_submitBtn) {
        _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_submitBtn.layer addSublayer:[UIColor color_shade:CGSizeMake(kWidth_fact(335), kWidth_fact(45)) colors:@[@"#00dac2",@"#fffa18"]]];
        [_submitBtn setTitle:kLocal_text(@"forget_next") forState:UIControlStateNormal];
        _submitBtn.titleLabel.font = KF_BH_F(13);
        KRadius(_submitBtn, kWidth_fact(22.5));
        _submitBtn.tag = 2;
        [_submitBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _submitBtn;
}

-(UIView *)mobileInputV{
    if (!_mobileInputV) {
        _mobileInputV = [[UIView alloc] init];
        
        UIView *horizontalV = [[UIView alloc] init];
        horizontalV.backgroundColor = color_gray7;
        [_mobileInputV addSubview:horizontalV];
        [horizontalV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.offset(0);
            make.bottom.equalTo(self.mobileInputV.mas_bottom);
            make.height.offset(kWidth_fact(1));
        }];
            
        UILabel *titleL = [[UILabel alloc]init];
        titleL.font = KF_H_F(13);
        [_mobileInputV addSubview:titleL];
        titleL.text = kLocal_text(@"forget_step1_account");

        [titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(horizontalV.mas_left);//.offset(kWidth_fact(-15));
            make.bottom.equalTo(horizontalV.mas_bottom).offset(kWidth_fact(-8));
            make.height.offset(kWidth_fact(30));
            make.width.offset(kWidth_fact(60));
        }];
            
        [_mobileInputV addSubview:self.text_1F];
        [self.text_1F mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(kWidth_fact(-15));
            make.left.equalTo(titleL.mas_right);
            make.height.offset(kWidth_fact(30));
            make.bottom.equalTo(horizontalV.mas_bottom).offset(kWidth_fact(-7));
        }];
        
    }
    return _mobileInputV;
}

-(UITextField *)text_1F{
    if (!_text_1F) {
        _text_1F = [[UITextField alloc] init];
        _text_1F.font = KF_H_F(13);
        _text_1F.clearButtonMode = UITextFieldViewModeWhileEditing;
//        _text_1F.secureTextEntry = YES;
//        _text_1F.textContentType = UITextContentTypePassword;
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:kLocal_text(@"forget_step1_account_input") attributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:_text_1F.font}];
        _text_1F.attributedPlaceholder = attrString;
    }
    return _text_1F;
}

-(void)btnClick:(UIButton *)btn{
    NSLog(@"%ld",(long)btn.tag);
    if (btn.tag == 2) {
        DKForgetStep2ViewController *forgetVC = [[DKForgetStep2ViewController alloc]init];
        [self.navigationController pushViewController:forgetVC animated:YES];
    }
//    if (self.click) {
//        self.click(btn.tag);
//    }
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
