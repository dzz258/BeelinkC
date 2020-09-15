//
//  DKShareV.m
//  BeelinkC
//
//  Created by Gavin on 2020/9/14.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKShareV.h"
#import "DKShareButton.h"

@interface DKShareV()
@property (nonatomic,strong) DKShareModel *shareModel;
//底部view
@property (nonatomic,strong) UIView *bottomPopView;
@property (nonatomic,strong) NSMutableArray *platformArray;
@property (nonatomic,strong) NSMutableArray *buttonArray;
@property (nonatomic,assign) DXShareContentType shareConentType;
@property (nonatomic,assign) CGFloat shreViewHeight;//分享视图的高度

@property (nonatomic, strong) UIView *headerV;
@property (nonatomic, strong) UIScrollView *btnScrollV;
@property (nonatomic, strong) UIView *bottomV;

@end

@implementation DKShareV

-(instancetype)initModel:(DKShareModel *)shareModel{
//- (instancetype)initWithFrame:(CGRect)frame {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.frame = CGRectMake(0, 0, KScreen_Width, 0);
        
        [self addBtnV];
        if (shareModel.titleModel) {
            [self addHeaderV];
            self.btnScrollV.top = CGRectGetMaxY(self.headerV.frame);
        }
        [self addBottomV];
        
        [self setHeight:CGRectGetMaxY(self.bottomV.frame)];
        
        NSLog(@"%@",NSStringFromCGRect(self.frame));
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(kWidth_fact(25), kWidth_fact(25))];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.bounds;
        maskLayer.path = maskPath.CGPath;
        self.layer.mask = maskLayer;
    }
    return self;
}
-(UIScrollView *)btnScrollV{
    if (!_btnScrollV) {
        _btnScrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kWidth_fact(20), self.width, kWidth_fact(93))];//132
//        _btnScrollV.backgroundColor = [UIColor yellowColor];
    }
    return _btnScrollV;
}
-(UIView *)headerV{
    if (!_headerV) {
        _headerV = [[UIView alloc] initWithFrame:CGRectMake(0, kWidth_fact(25), self.width, kWidth_fact(85))];
//        _headerV.backgroundColor = [UIColor yellowColor];
    }
    return _headerV;
}
-(UIView *)bottomV{
    if (!_bottomV) {
        _bottomV = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.btnScrollV.frame), self.width, kWidth_fact(103))];
    }
    return _bottomV;
}
-(void)addBottomV{
    [self addSubview:self.bottomV];
    UIView *lineV = [[UIView alloc] initWithFrame:CGRectMake(kWidth_fact(15), kWidth_fact(40), self.width-kWidth_fact(30), kWidth_fact(1))];
    lineV.backgroundColor = color_n_gray67;
    [self.bottomV addSubview:lineV];
    [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(kWidth_fact(40));
        make.left.offset(kWidth_fact(15));
        make.right.offset(kWidth_fact(-15));
        make.height.offset(kWidth_fact(1));
    }];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setTitleColor:color_black8 forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = KF_BH_F(13);
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.bottomV addSubview:cancelBtn];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(lineV.mas_bottom);
        make.bottom.equalTo(self.bottomV.mas_bottom);
    }];
}
-(void)addBtnV{
    [self addSubview:self.btnScrollV];
    NSArray *array = @[
        @{@"title":kLocal_text(@"share_wx"),@"img":@"weixin"},
        @{@"title":@"微博",@"img":@"weibo"},
        @{@"title":@"Facebook",@"img":@"facebook"},
        @{@"title":@"WhatsAPP",@"img":@"WhatsAPP"},
    ];
    for (int i=0; i<array.count; i++) {
        NSDictionary *dict = array[i];
        DKShareButton *shareBtn = [[DKShareButton alloc] init];
        [shareBtn setTitle:dict[@"title"] forState:UIControlStateNormal];
        [shareBtn setImage:KImage(dict[@"img"]) forState:UIControlStateNormal];
        shareBtn.frame = CGRectMake(kWidth_fact(12)+i*kWidth_fact(88), kWidth_fact(20), kWidth_fact(88), kWidth_fact(73));
//        [shareBtn addTarget:self action:@selector(clickShare:) forControlEvents:UIControlEventTouchUpInside];
//        shareBtn.tag = platform.sharePlatform;//这句话必须写！！！
        [self.btnScrollV addSubview:shareBtn];
    }
}
-(void)addHeaderV{
    [self addSubview:self.headerV];
    
    UIButton *headerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    headerBtn.backgroundColor = [UIColor redColor];
    KRadius(headerBtn, kWidth_fact(25));
//    kRadius_WC(headerBtn, kWidth_fact(25), kWidth_fact(2), color_white10);
    
    UILabel *teacherL = [self addLabelText:@"Herman老师" font:KF_BH_F(15) textC:color_black10];

    UILabel *sourceL = [self addLabelText:@"来自:" font:KF_H_F(11) textC:color_gray6];

    UIImageView *countryImageV = [[UIImageView alloc] init];
    countryImageV.backgroundColor = [UIColor redColor];
    countryImageV.contentMode = UIViewContentModeScaleAspectFit;

    UIButton *concernBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    KRadius(concernBtn, kWidth_fact(11));
    [concernBtn setTitle:@"已关注" forState:UIControlStateNormal];
    concernBtn.titleLabel.font = KF_H_F(11);
    [concernBtn setBackgroundColor:color_cyan9];

    UIImageView *teachLangueImaegV = [[UIImageView alloc] init];
    teachLangueImaegV.image = KImage(@"langue_icon");

    UILabel *teachLangueL = [self addLabelText:@"授课语言" font:KF_BH_F(13) textC:color_black10];

    UILabel *teachLangueValL = [self addLabelText:@"西班牙语西班牙语西班牙语西班牙语西班牙语西班牙语西班牙语西班牙语西班牙语" font:KF_H_F(11) textC:color_gray6];
        
    [self.headerV addSubview:headerBtn];
    [headerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(kWidth_fact(30));
        make.top.offset(kWidth_fact(15));
        make.width.height.offset(kWidth_fact(50));
    }];
    
    [self.headerV addSubview:teacherL];
    [teacherL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headerBtn.mas_right).offset(kWidth_fact(10));
        make.top.offset(kWidth_fact(23));
        make.width.lessThanOrEqualTo(@kWidth_fact(165));
        make.height.offset(kWidth_fact(15));
    }];
    
    [self.headerV addSubview:sourceL];
    [sourceL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(teacherL.mas_right).offset(kWidth_fact(5));
        make.centerY.equalTo(teacherL.mas_centerY);
    }];
    
    [self.headerV addSubview:countryImageV];
    [countryImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(sourceL.mas_right).offset(kWidth_fact(2));
        make.centerY.equalTo(sourceL.mas_centerY);
        make.width.height.offset(kWidth_fact(12));
    }];
    
    [self.headerV addSubview:concernBtn];
    [concernBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(kWidth_fact(29));
        make.right.offset(kWidth_fact(-30));
        make.width.offset(kWidth_fact(50));
        make.height.offset(kWidth_fact(22));
    }];
    
    [self.headerV addSubview:teachLangueImaegV];
    [teachLangueImaegV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(teacherL.mas_left);
        make.top.equalTo(teacherL.mas_bottom).offset(kWidth_fact(10));
        make.width.offset(kWidth_fact(16));
        make.height.offset(kWidth_fact(17));
    }];
    
    [self.headerV addSubview:teachLangueL];
    [teachLangueL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(teachLangueImaegV.mas_right).offset(kWidth_fact(3));
        make.centerY.equalTo(teachLangueImaegV.mas_centerY);
    }];
    
    [self.headerV addSubview:teachLangueValL];
    [teachLangueValL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(teachLangueL.mas_right).offset(kWidth_fact(10));
        make.centerY.equalTo(teachLangueL.mas_centerY);
        make.width.lessThanOrEqualTo(@kWidth_fact(120));
    }];
    
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
