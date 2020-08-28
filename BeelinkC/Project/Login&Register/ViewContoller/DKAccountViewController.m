//
//  DKAccountViewController.m
//  BeelinkC
//
//  Created by Gavin on 2020/8/26.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKAccountViewController.h"
#import "DKLoginMobileV.h"
#import "DKLoginPasswordV.h"
#import "DKRegisterMobileV.h"

@interface DKAccountViewController ()

/// 显示类型  手机验证码登录：login_mobile；账号密码登录：login_password; 手机验证码注册：register_mobile
@property (nonatomic,copy) NSString *showType;
/// 按钮操作类型  1：展示手机验证登录页面，2：展示账号密码登录页面，3：展示手机验证码注册页面，11：登录页面切换手机区号，12：验证码注册页面切换手机号区号，13：忘记密码操作，14：查看用户协议操作， 100：登录成功操作
@property (nonatomic,assign) NSInteger tagType;
@property (nonatomic,strong) DKLoginMobileV *loginMobileV;
@property (nonatomic,strong) DKLoginPasswordV *loginPasswordV;
@property (nonatomic,strong) DKRegisterMobileV *registerMobileV;

@end

@implementation DKAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor redColor];
    
}
-(void)_addSubviews{
    self.tagType = 1;
    [self addNavView];
    [self.view addSubview:self.loginMobileV];
    [self.view addSubview:self.loginPasswordV];
    [self.view addSubview:self.registerMobileV];
    [self managePage];
}
-(void)addNavView{
    UIView *nav_view = [[UIView alloc] init];
//    nav_view.backgroundColor = color_main_red;
    [self.view addSubview:nav_view];
    
    [nav_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.equalTo(@0);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@(kTopHeight));
    }];
    
    UIImageView *iconImageV = [[UIImageView alloc] init];
    iconImageV.image = KImage(@"login_logo");
    [nav_view addSubview:iconImageV];
    [iconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@kWidth_fact(14));
        make.top.equalTo(@(kStatuHeight+10));
        make.width.offset(27);
        make.height.offset(25);
    }];
    
    UILabel *titleL = [[UILabel alloc] init];
    titleL.text = @"Beelink";
    titleL.font = KF_BH_F(18);
    titleL.textColor = color_black8;
    [nav_view addSubview:titleL];
    [titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconImageV.mas_right).offset(kWidth_fact(6));
        make.centerY.equalTo(iconImageV.mas_centerY);
    }];
}
-(DKLoginMobileV *)loginMobileV{
    if (!_loginMobileV) {
        _loginMobileV = [[DKLoginMobileV alloc] initWithFrame:CGRectMake(0, kTopHeight+kWidth_fact(75), KScreen_Width, KScreen_Height-kTopHeight-kWidth_fact(75))];
        kWeakSelf(self);
        _loginMobileV.click = ^(NSInteger tag) {
            if (tag == 1) {
                weakself.showType = @"register_mobile";
                weakself.tagType = 3;
            }else if (tag == 3){
                weakself.showType = @"login_password";
                weakself.tagType = 2;
            }
            [weakself managePage];
        };
    }
    return _loginMobileV;
}
-(DKLoginPasswordV *)loginPasswordV{
    if (!_loginPasswordV) {
        _loginPasswordV = [[DKLoginPasswordV alloc] initWithFrame:CGRectMake(0, kTopHeight+kWidth_fact(75), KScreen_Width, KScreen_Height-kTopHeight-kWidth_fact(75))];
        kWeakSelf(self);
        _loginPasswordV.click = ^(NSInteger tag) {
            if (tag == 1) {
                weakself.showType = @"register_mobile";
                weakself.tagType = 3;
            }else if (tag == 3){
                weakself.showType = @"login_mobile";
                weakself.tagType = 1;
            }
            [weakself managePage];
        };
    }
    return _loginPasswordV;
}
-(DKRegisterMobileV *)registerMobileV{
    if (!_registerMobileV) {
        _registerMobileV = [[DKRegisterMobileV alloc] initWithFrame:CGRectMake(0, kTopHeight+kWidth_fact(75), KScreen_Width, KScreen_Height-kTopHeight-kWidth_fact(75))];
        kWeakSelf(self);
        _registerMobileV.click = ^(NSInteger tag) {
            if (tag == 1) {
                weakself.showType = @"login_mobile";
                weakself.tagType = 1;
            }else if (tag == 3){
//                weakself.showType = @"login_mobile";
//                weakself.tagType = 1;
            }
            [weakself managePage];
        };
    }
    return _registerMobileV;
}
-(void)managePage{
    /// 按钮操作类型  1：展示手机验证登录页面，2：展示账号密码登录页面，3：展示手机验证码注册页面，11：登录页面切换手机区号，12：验证码注册页面切换手机号区号，13：忘记密码操作，14：查看用户协议操作， 100：登录成功操作
    self.loginMobileV.hidden = self.tagType == 1 ? NO:YES;
    self.loginPasswordV.hidden = self.tagType == 2 ? NO:YES;
    self.registerMobileV.hidden = self.tagType == 3 ? NO:YES;
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
