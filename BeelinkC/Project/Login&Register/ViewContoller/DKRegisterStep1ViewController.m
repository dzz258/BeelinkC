//
//  DKRegisterStep1ViewController.m
//  BeelinkC
//
//  Created by Gavin on 2020/8/29.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKRegisterStep1ViewController.h"
#import "DKRegisterStep2ViewController.h"

@interface DKRegisterStep1ViewController ()
@property (nonatomic, strong) UIScrollView *bgScrollView;
@property (nonatomic, strong) UIView *bgV;
@property(nonatomic, strong) UILabel *titleL;
@property(nonatomic, strong) UIView *title_lineV;
@property(nonatomic, strong) UILabel *subTitleL;
@property(nonatomic, strong) UIView *mobileInputV;
@property(nonatomic, strong) UIView *interestV;
@property(nonatomic, strong) UIView *birthdayV;
@property(nonatomic, strong) NSMutableArray *interestArr;
@property(nonatomic, strong) UIButton *submitBtn;

//@property(nonatomic, strong) UIButton *submitBtn;
//@property(nonatomic, strong) UIButton *transformBtn;
//@property(nonatomic, strong) UIView *thirdLoginV;
//@property (nonatomic,strong) UITextField *text_1F;//姓名
//@property (nonatomic,strong) UITextField *text_2F;//姓名
//@property (nonatomic,strong) UITextField *text_3F;//邮箱
@end

@implementation DKRegisterStep1ViewController

-(NSMutableArray *)interestArr{
    if (!_interestArr) {
        _interestArr = [[NSMutableArray alloc] init];
    }
    return _interestArr;
}
-(UIScrollView *)bgScrollView{
    if (!_bgScrollView) {
        _bgScrollView = [[UIScrollView alloc] init];
        _bgScrollView.frame = CGRectMake(0,kTopHeight, KScreen_Width, KScreen_Height-kTopHeight-kWidth_fact(50)-kXoffsetHeight);
        _bgScrollView.showsVerticalScrollIndicator = NO;
//        _bgScrollView.backgroundColor = DCColor_nav_blue;
//        _bgScrollView.contentSize = CGSizeMake(KScreen_Width, KScreen_Height-kTopHeight+0.01);
    }
    return _bgScrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addLeftImage:KImage(@"nav_back_cyan") action:@selector(goBack)];
    if (@available(iOS 11.0, *)) {
        self.bgScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.view addSubview:self.bgScrollView];
    [self.bgScrollView addSubview:self.bgV];
    
    [self.bgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.bgScrollView);
        make.width.equalTo(self.bgScrollView); // 需要设置宽度和scrollview宽度一样
    }];
}
-(void)_addSubviews{
    [self.bgV addSubview:self.title_lineV];
    [self.bgV addSubview:self.titleL];
    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(kWidth_fact(75));
        make.left.offset(kWidth_fact(20));
        make.height.offset(kWidth_fact(24));
    }];
    
    [self.title_lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.titleL.mas_bottom).offset(kWidth_fact(2));
        make.centerX.equalTo(self.titleL.mas_centerX);
        make.height.offset(kWidth_fact(6));
        if ([kLocal_text(@"language") isEqualToString:@"en"]) {
            make.width.offset(kWidth_fact(90));
        }else{
            make.width.offset(kWidth_fact(50));
        }
    }];
    
    if ([kLocal_text(@"language") isEqualToString:@"en"]) {
        [_title_lineV.layer addSublayer:[UIColor color_shade:CGSizeMake(kWidth_fact(90), kWidth_fact(6)) colors:@[@"#00dac2",@"#fffa18"]]];
    }else{
        [_title_lineV.layer addSublayer:[UIColor color_shade:CGSizeMake(kWidth_fact(50), kWidth_fact(6)) colors:@[@"#00dac2",@"#fffa18"]]];
    }
    [self.bgV addSubview:self.subTitleL];
    [self.subTitleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleL.mas_left);
        make.top.equalTo(self.titleL.mas_bottom).offset(kWidth_fact(19));
        make.right.equalTo(self.bgV.mas_right).offset(kWidth_fact(-10));
    }];
    
    [self.bgV addSubview:self.mobileInputV];
    [self.mobileInputV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.subTitleL.mas_bottom).offset(kWidth_fact(32));
        make.left.equalTo(self.titleL.mas_left);
        make.right.equalTo(self.bgV.mas_right).offset(kWidth_fact(-20));
        if ([kLocal_text(@"language") isEqualToString:@"en"]) {
            make.height.offset(kWidth_fact(171));
        }else{
            make.height.offset(kWidth_fact(114));
        }
    }];
    
    [self.bgV addSubview:self.interestV];
    [self.interestV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mobileInputV.mas_bottom).offset(kWidth_fact(30));
        make.left.equalTo(self.titleL.mas_left);
        make.right.equalTo(self.bgV.mas_right).offset(kWidth_fact(-20));
        make.height.offset(kWidth_fact(35)*self.interestArr.count);
    }];
    
    [self.bgV addSubview:self.birthdayV];
    [self.birthdayV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleL.mas_left);
        make.top.equalTo(self.interestV.mas_bottom).offset(kWidth_fact(11));
        make.right.equalTo(self.bgV.mas_right);
        make.height.offset(kWidth_fact(57));
    }];
    // 3.所有的子控件都放到containerView里面, 在最后一个子控件后设置约束
    [self.bgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.birthdayV.mas_bottom).offset(20);// 这里放最后一个view的底部
    }];
    
    [self.view addSubview:self.submitBtn];
    [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgScrollView.mas_bottom).offset(kWidth_fact(5));
        make.right.equalTo(self.view.mas_right);
        make.width.offset(kWidth_fact(187));
        make.height.offset(kWidth_fact(45));
    }];
}
-(UIView *)bgV{
    if (!_bgV) {
        _bgV = [[UIView alloc] init];
    }
    return _bgV;
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
        _subTitleL.text = kLocal_text(@"register_subTitle_step1");
        _subTitleL.font = KF_BH_F(15);
        _subTitleL.numberOfLines = 2;
        _subTitleL.textColor = color_black10;
    }
    return _subTitleL;
}
-(UIButton *)submitBtn{//登录 提交
    if (!_submitBtn) {
        _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _submitBtn.frame = CGRectMake(0, 0, kWidth_fact(187), kWidth_fact(45));
        [_submitBtn.layer addSublayer:[UIColor color_shade:CGSizeMake(kWidth_fact(187), kWidth_fact(45)) colors:@[@"#00dac2",@"#fffa18"]]];
        [_submitBtn setTitle:kLocal_text(@"register_btn_next") forState:UIControlStateNormal];
        _submitBtn.titleLabel.font = KF_BH_F(13);
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_submitBtn.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(kWidth_fact(45), kWidth_fact(45))];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = _submitBtn.bounds;
        maskLayer.path = maskPath.CGPath;
        _submitBtn.layer.mask = maskLayer;
        _submitBtn.tag = 2;
        [_submitBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _submitBtn;
}
-(UIView *)mobileInputV{
    if (!_mobileInputV) {
        _mobileInputV = [[UIView alloc] init];
        NSInteger count = 2;
        if ([kLocal_text(@"language") isEqualToString:@"en"]) {
            count = 3;
        }
        for (int i = 0; i<count; i++) {
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
            
            UILabel *titleL = [[UILabel alloc]init];
            titleL.font = KF_H_F(13);
            [inputV addSubview:titleL];
            
            NSString *textStr = @"";
            if (i == 0) {
                textStr = @"register_input_firstName";
            }else if (i == 1){
                textStr = @"register_input_lastName";
                if (count == 2) {
                    textStr = @"register_input_email";
                }
            }else{
                textStr = @"register_input_email";
            }
            titleL.text = kLocal_text(textStr);

            [titleL mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(horizontalV.mas_left);//.offset(kWidth_fact(-15));
                make.bottom.equalTo(horizontalV.mas_bottom).offset(kWidth_fact(-8));
                make.height.offset(kWidth_fact(30));
                if (count == 3) {
                    make.width.offset(kWidth_fact(80));
                }else{
                    make.width.offset(kWidth_fact(45));
                }
            }];
            
            UITextField *textF = [[UITextField alloc] init];
            textF.font = KF_H_F(13);
            textF.keyboardType = UIKeyboardTypeNumberPad;
            textF.clearButtonMode = UITextFieldViewModeWhileEditing;
            
            textStr = [NSString stringWithFormat:@"%@_input",textStr];
            NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:kLocal_text(textStr) attributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:textF.font}];
            textF.attributedPlaceholder = attrString;
            [inputV addSubview:textF];
            [textF mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.offset(kWidth_fact(-15));
                make.left.equalTo(titleL.mas_right);
                make.height.equalTo(titleL.mas_height);
                make.centerY.equalTo(titleL.mas_centerY);
            }];
        }
    }
    return _mobileInputV;
}
-(UIView *)interestV{
    if (!_interestV) {
        _interestV = [[UIView alloc] init];
        UILabel *titleL = [[UILabel alloc]init];
        titleL.font = KF_H_F(13);
        titleL.text = kLocal_text(@"register_interest");
        [_interestV addSubview:titleL];
        [titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(0);
            make.top.offset(0);
            make.height.offset(kWidth_fact(35));
            if ([kLocal_text(@"language") isEqualToString:@"en"]) {
                make.width.offset(kWidth_fact(80));
            }else{
                make.width.offset(kWidth_fact(45));
            }
        }];
        for (int i = 0; i<20; i++) {
            [self.interestArr addObject:@{@"select":@(0)}];
            UIView *inputV = [[UIView alloc] init];
            [_interestV addSubview:inputV];
            [inputV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.offset(i*kWidth_fact(35));
                make.left.equalTo(titleL.mas_right);
                make.right.equalTo(self.interestV.mas_right).offset(kWidth_fact(-20));
                make.height.offset(kWidth_fact(35));
//                if (i == 2) {
//                    make.bottom.equalTo(self.interestV.mas_bottom);
//                }
            }];
            
            UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [selectBtn setImage:KImage(@"login_agree_") forState:UIControlStateNormal];
            [selectBtn setImage:KImage(@"login_agree_select") forState:UIControlStateSelected];
            [selectBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            selectBtn.tag = 101+i;
            [inputV addSubview:selectBtn];
            [selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.offset(0);
                make.width.height.offset(kWidth_fact(30));
                make.centerY.equalTo(inputV.mas_centerY);
            }];
            
            UILabel *titleL = [[UILabel alloc]init];
            titleL.font = KF_H_F(13);
            titleL.text = kLocal_text(@"register_input_firstName");
            titleL.tag = 201+i;
            titleL.textColor = color_gray8;
            [inputV addSubview:titleL];
                        
            [titleL mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(selectBtn.mas_right);
                make.top.offset(0);
                make.height.offset(kWidth_fact(35));
                make.width.offset(kWidth_fact(82));
            }];
            
            UIView *lineV = [[UIView alloc] init];
            lineV.backgroundColor = color_black10;
            lineV.tag = 301+i;
            lineV.hidden = YES;
            [inputV addSubview:lineV];
            [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(titleL.mas_right);
                make.centerY.equalTo(inputV.mas_centerY);
                make.width.offset(kWidth_fact(1));
                make.height.offset(kWidth_fact(14));
            }];
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.tag = 401+i;
            [btn setTitle:kLocal_text(@"register_select_default") forState:UIControlStateNormal];
            btn.titleLabel.font = KF_H_F(13);
            [btn setImage:KImage(@"login_drop") forState:UIControlStateNormal];
            [btn setTitleColor:color_gray8 forState:UIControlStateNormal];
            [inputV addSubview:btn];
            btn.hidden = YES;
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(inputV.mas_right);
                if ([kLocal_text(@"language") isEqualToString:@"en"]) {
                    make.width.lessThanOrEqualTo(@kWidth_fact(110));
                }else{
                    make.width.lessThanOrEqualTo(@kWidth_fact(145));
                }
                make.height.offset(kWidth_fact(35));
                make.centerY.equalTo(lineV.mas_centerY);
            }];
            
            //导致约束报错
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -btn.imageView.bounds.size.width, 0, btn.imageView.bounds.size.width)];
            [btn setImageEdgeInsets:UIEdgeInsetsMake(0, btn.titleLabel.bounds.size.width, 0, -btn.titleLabel.bounds.size.width)];
        }
    }
    return _interestV;
}
-(UIView *)birthdayV{
    if (!_birthdayV) {
        _birthdayV = [[UIView alloc] init];
        
        UIView *horizontalV = [[UIView alloc] init];
        horizontalV.backgroundColor = color_n_gray7;
        [_birthdayV addSubview:horizontalV];
        [horizontalV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.offset(0);
            make.bottom.equalTo(self.birthdayV.mas_bottom);
            make.height.offset(kWidth_fact(1));
        }];
        
        UILabel *titleL = [[UILabel alloc]init];
        titleL.font = KF_H_F(13);
        [_birthdayV addSubview:titleL];
                
        titleL.text = kLocal_text(@"register_birthday");
        
        [titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(horizontalV.mas_left);//.offset(kWidth_fact(-15));
            make.bottom.equalTo(horizontalV.mas_bottom).offset(kWidth_fact(-8));
            make.height.offset(kWidth_fact(30));
            if ([kLocal_text(@"language") isEqualToString:@"en"]) {
                make.width.offset(kWidth_fact(80));
            }else{
                make.width.offset(kWidth_fact(45));
            }
        }];
        
        UITextField *textF = [[UITextField alloc] init];
        textF.font = KF_H_F(13);
        textF.keyboardType = UIKeyboardTypeNumberPad;
        textF.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:kLocal_text(@"register_birthday_default") attributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:textF.font}];
        textF.attributedPlaceholder = attrString;
        [_birthdayV addSubview:textF];
        [textF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(kWidth_fact(-15));
            make.left.equalTo(titleL.mas_right);
            make.height.equalTo(titleL.mas_height);
            make.centerY.equalTo(titleL.mas_centerY);
        }];
    }
    return _birthdayV;
}
-(void)btnClick:(UIButton *)btn{
    NSLog(@"%ld",(long)btn.tag);
    if (btn.tag == 2) {
        DKRegisterStep2ViewController *registerVC = [[DKRegisterStep2ViewController alloc] init];
        [self.navigationController pushViewController:registerVC animated:YES];
    }
    if (100< btn.tag && btn.tag <self.interestArr.count+101) {
        btn.selected = !btn.selected;
        NSMutableDictionary *dict = [self.interestArr[btn.tag-101] mutableCopy];
        [dict setObject:btn.selected?@(1):@(0) forKey:@"select"];
        [self.interestArr replaceObjectAtIndex:btn.tag-101 withObject:dict];
        for (int i = 0; i<self.interestArr.count; i++) {
            UILabel *titleL = (UILabel *)[self.interestV viewWithTag:201+i];
            UIView *lineV = (UIView *)[self.interestV viewWithTag:301+i];
            UIButton *selectBtn = (UIButton *)[self.interestV viewWithTag:401+i];
            if ([self.interestArr[i][@"select"] integerValue] == 1) {
                lineV.hidden = NO;
                selectBtn.hidden = NO;
                titleL.textColor = color_cyan9;
            }else{
                lineV.hidden = YES;
                selectBtn.hidden = YES;
                titleL.textColor = color_gray8;
            }
        }
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
