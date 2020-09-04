//
//  DKForgetStep2ViewController.m
//  BeelinkC
//
//  Created by Gavin on 2020/9/4.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKForgetStep2ViewController.h"
#import <WGDigitField/WGDigitField.h>

@interface BackgroundWithBottomLine : UIView

@property (nonatomic, strong) UIView *bottomLine;

+ (instancetype)create;

@end

@implementation BackgroundWithBottomLine

+ (instancetype)create {
    BackgroundWithBottomLine *background = [[BackgroundWithBottomLine alloc] initWithFrame:CGRectMake(0, 0, 40, 45)];
    background.bottomLine = [[UIView alloc] init];
    background.bottomLine.backgroundColor = [UIColor grayColor];
    [background addSubview:background.bottomLine];
    [background.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.and.bottom.equalTo(@0);
        make.height.equalTo(@1);
    }];
    return background;
}

@end

@interface DKForgetStep2ViewController ()
@property(nonatomic, strong) UILabel *titleL;
@property(nonatomic, strong) UIView *title_lineV;
@property(nonatomic, strong) UILabel *subTitleL;
@property(nonatomic, strong) UIButton *submitBtn;
@property(nonatomic, strong) UIButton *codeHineBtn;

@end

@implementation DKForgetStep2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)_addSubviews{
    
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
            make.width.offset(kWidth_fact(250));
        }else{
            make.width.offset(kWidth_fact(120));
        }
    }];
    
    if ([kLocal_text(@"language") isEqualToString:@"en"]) {
        [self.title_lineV.layer addSublayer:[UIColor color_shade:CGSizeMake(kWidth_fact(250), kWidth_fact(6)) colors:@[@"#00dac2",@"#fffa18"]]];
    }else{
        [self.title_lineV.layer addSublayer:[UIColor color_shade:CGSizeMake(kWidth_fact(120), kWidth_fact(6)) colors:@[@"#00dac2",@"#fffa18"]]];
    }
    [self.view addSubview:self.subTitleL];
    [self.subTitleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleL.mas_left);
        make.top.equalTo(self.titleL.mas_bottom).offset(kWidth_fact(19));
        make.right.equalTo(self.view.mas_right).offset(kWidth_fact(-15));
//        make.height.offset(kWidth_fact(16));
    }];
    
    WGDigitField<WGDigitView<BackgroundWithBottomLine *> *> *field2 = [[WGDigitField<WGDigitView<BackgroundWithBottomLine *> *> alloc] initWithDigitViewInitBlock:^WGDigitView<BackgroundWithBottomLine *> * (NSInteger index){
        BackgroundWithBottomLine *background2 = [BackgroundWithBottomLine create];
        
        return [[WGDigitView<BackgroundWithBottomLine *> alloc] initWithBackgroundView:background2 digitFont:KF_BH_F(25) digitColor:color_black10];
    } numberOfDigits:6 leadSpacing:kWidth_fact(20) tailSpacing:kWidth_fact(20) weakenBlock:^(WGDigitView<BackgroundWithBottomLine *> * _Nonnull digitView) {
        digitView.backgroundView.bottomLine.backgroundColor = [UIColor grayColor];
    } highlightedBlock:^(WGDigitView<BackgroundWithBottomLine *> * _Nonnull digitView) {
        digitView.backgroundView.bottomLine.backgroundColor = [UIColor redColor];
    } fillCompleteBlock:^(WGDigitField * _Nonnull digitField, NSArray<WGDigitView<BackgroundWithBottomLine *> *> * _Nonnull digitViewArray, NSString * _Nonnull text) {
        for (WGDigitView<BackgroundWithBottomLine *> *digitView in digitViewArray) {
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
            animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
            animation.duration = 0.6;
            animation.values = @[@(-20.0), @20.0, @(-20.0), @20.0, @(-10.0), @10.0, @(-5.0), @(5.0), @(0.0)];
            [digitView.backgroundView.layer addAnimation:animation forKey:@"shake.animation"];
        }
        [digitField resignFirstResponder];
    }];

    [self.view addSubview:field2];
    [field2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.and.trailing.equalTo(@0);
        make.top.equalTo(self.subTitleL.mas_bottom).offset(kWidth_fact(50));
        make.height.equalTo(@(kWidth_fact(20) + 2 * 17));
    }];
    
    [self.view addSubview:self.codeHineBtn];
    [self.codeHineBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(kWidth_fact(20));
        make.top.equalTo(field2.mas_bottom);
//        make.height.offset(kWidth_fact(30));
    }];
    [self.view addSubview:self.submitBtn];
    [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.codeHineBtn.mas_bottom).offset(kWidth_fact(50));
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.offset(kWidth_fact(335));
        make.height.offset(kWidth_fact(45));
    }];
}
-(UILabel *)titleL{
    if (!_titleL) {
        _titleL = [[UILabel alloc] init];
        _titleL.text = kLocal_text(@"forget_step2_title");
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
        _subTitleL.text = [NSString stringWithFormat:@"%@+86 130 010 44595%@",kLocal_text(@"forget_step2_subTitle_prefix"),kLocal_text(@"forget_step2_subTitle_suffix")];
        _subTitleL.font = KF_BH_F(15);
        _subTitleL.numberOfLines = 0;
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
-(UIButton *)codeHineBtn{
    if (!_codeHineBtn) {
        _codeHineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_codeHineBtn setTitle:[NSString stringWithFormat:@"00:56%@",kLocal_text(@"forget_step2_sms_hint")] forState:UIControlStateNormal];
        _codeHineBtn.titleLabel.font = KF_H_F(12);
        _codeHineBtn.tag = 3;
        [_codeHineBtn setTitleColor:color_gray8 forState:UIControlStateNormal];
        [_codeHineBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _codeHineBtn;
}
-(void)btnClick:(UIButton *)btn{
    NSLog(@"%ld",(long)btn.tag);
    if (btn.tag == 2) {
//        DKForgetStep2ViewController *forgetVC = [[DKForgetStep2ViewController alloc]init];
//        [self.navigationController pushViewController:forgetVC animated:YES];
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
