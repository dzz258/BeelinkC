//
//  DKNotNetWorkHintView.m
//  BiYongBao
//
//  Created by Gavin on 2018/8/24.
//  Copyright © 2018年 Ai. All rights reserved.
//

#import "DKNotNetWorkHintView.h"

@interface DKNotNetWorkHintView ()

@property (nonatomic, strong) UIButton *clickBtn; //*

@end

@implementation DKNotNetWorkHintView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
        [self createrUI];
    }
    return self;
}
-(void)createrUI{
    self.clickBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.clickBtn.backgroundColor=kColor_hex(@"#FFE8D8");
    [self.clickBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.clickBtn];
    
    UIImage *image=[UIImage imageNamed:@"not_network_icon"];
    UIImageView *imageView=[[UIImageView alloc] init];
    imageView.image=image;
    [self.clickBtn addSubview:imageView];
    
    UILabel *hintL=[[UILabel alloc] init];
    hintL.text=@"当前网络不可用，请检查你的网络设置";
    hintL.font=[UIFont systemFontOfSize:14];
    hintL.textColor=kColor_hex(@"#F69559");
    [self.clickBtn addSubview:hintL];
    
    UIImageView *arrowImageView=[[UIImageView alloc]init];
    arrowImageView.image=[UIImage imageNamed:@"not_network_look"];
    [self.clickBtn addSubview:arrowImageView];
    
    [self.clickBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(@0);
    }];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.centerY.equalTo(self.clickBtn.mas_centerY);
        make.width.equalTo(@(image.size.width));
        make.height.equalTo(@(image.size.height));
    }];
    
    [hintL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView.mas_right).offset(13);
        make.centerY.equalTo(imageView.mas_centerY);
        make.right.equalTo(arrowImageView.mas_left).offset(-5);
    }];
    
    [arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.clickBtn.mas_right).offset(-15);
        make.centerY.equalTo(self.clickBtn.mas_centerY);
        make.width.equalTo(@7);
        make.height.equalTo(@12);
    }];
    
//
//    //1.创建网络监听管理者
//    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
//    //2.监听网络状态的改变
//    /*
//     AFNetworkReachabilityStatusUnknown          = 未知
//     AFNetworkReachabilityStatusNotReachable     = 没有网络
//     AFNetworkReachabilityStatusReachableViaWWAN = 3G
//     AFNetworkReachabilityStatusReachableViaWiFi = WIFI
//     */
//    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        switch (status) {
//            case AFNetworkReachabilityStatusNotReachable:
//                kLog(@"没有网络");
//                self.hidden = NO;
//                [self.superview bringSubviewToFront:self];
//                break;
//            default:{
//                self.hidden = YES;
//                [self removeFromSuperview];
//                [self removeAllSubviews];
//            }
//                break;
//        }
//    }];
//    //3.开始监听
//    [manager startMonitoring];
}
-(void)btnClick{
    if (self.dkNotNewWorkBlock) {
        self.dkNotNewWorkBlock();
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
