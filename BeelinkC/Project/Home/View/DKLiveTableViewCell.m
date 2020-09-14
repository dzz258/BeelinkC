//
//  DKLiveTableViewCell.m
//  BeelinkC
//
//  Created by Gavin on 2020/9/14.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKLiveTableViewCell.h"
#define DEGREES_TO_RADIANS(degrees) ((3.14159265359 * degrees) / 180)

@interface DKLiveTableViewCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView *picImageV;
@property (nonatomic, strong) UIView *titleBgV;
@property (nonatomic, strong) UILabel *titleL;
@property (nonatomic, strong) UIView *statusV;
@property (nonatomic, strong) UILabel *statusL;
@property (nonatomic, strong) UIButton *headerBtn;
@property (nonatomic, strong) UIButton *appointmentBtn;
@property (nonatomic, strong) UILabel *scoreL;
@property (nonatomic, strong) UILabel *teacherL;
@property (nonatomic, strong) UILabel *sourceL;
@property (nonatomic, strong) UIImageView *countryImageV;
@property (nonatomic, strong) UIButton *shareBtn;
@property (nonatomic, strong) UIButton *takeBtn;
@property (nonatomic, strong) UILabel *languageL;
@property (nonatomic, strong) UILabel *timeL;

@end


@implementation DKLiveTableViewCell

-(void)createrUI{
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(kWidth_fact(15));
        make.right.offset(kWidth_fact(-15));
        make.top.offset(kWidth_fact(10));
        make.bottom.offset(kWidth_fact(-10));
    }];
            
    [self.bgView addSubview:self.picImageV];
    [self.picImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.height.offset(kWidth_fact(195));
    }];
           
    [self.picImageV addSubview:self.titleBgV];
    [self.titleBgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.height.offset(kWidth_fact(25));
    }];

    [self.titleBgV addSubview:self.titleL];
    [self.titleBgV addSubview:self.statusV];

    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(kWidth_fact(16));
        make.centerY.equalTo(self.titleBgV.mas_centerY);
        make.right.lessThanOrEqualTo(self.statusV.mas_left).offset(kWidth_fact(-10));
    }];
    
    [self.statusV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(self.titleBgV.mas_centerY);
        make.width.offset(kWidth_fact(85));
        make.height.offset(kWidth_fact(25));
    }];
    
    [self.statusV addSubview:self.statusL];
    [self.statusL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.offset(0);
    }];
//
//            UIButton *playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//            [playBtn setImage:KImage(@"home_play") forState:UIControlStateNormal];
//            [picImageView addSubview:playBtn];
//            [playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.top.offset(kWidth_fact(84));
//                make.centerX.equalTo(picImageView.mas_centerX);
//            }];
//
           
    [self.bgView addSubview:self.headerBtn];
    [self.headerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(kWidth_fact(20));
        make.centerY.equalTo(self.picImageV.mas_bottom);
        make.width.height.offset(kWidth_fact(50));
    }];

            
    [self.picImageV addSubview:self.appointmentBtn];
    [self.appointmentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.picImageV.mas_bottom);
        make.right.equalTo(self.picImageV.mas_right);
        make.width.offset(kWidth_fact(80));
        make.height.offset(kWidth_fact(27));
    }];
    
    [self.bgView addSubview:self.scoreL];
    [self.scoreL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headerBtn.mas_centerX);
        make.top.equalTo(self.headerBtn.mas_bottom).offset(kWidth_fact(8));
        make.width.offset(kWidth_fact(45));
        make.height.offset(kWidth_fact(16));
    }];
//
    [self.bgView addSubview:self.teacherL];
    [self.teacherL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerBtn.mas_right).offset(kWidth_fact(9));
        make.top.equalTo(self.picImageV.mas_bottom).offset(kWidth_fact(10));
        make.width.lessThanOrEqualTo(@kWidth_fact(112));
        make.height.offset(kWidth_fact(15));
    }];

    [self.bgView addSubview:self.sourceL];
    [self.sourceL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.teacherL.mas_right).offset(kWidth_fact(5));
        make.centerY.equalTo(self.teacherL.mas_centerY);
    }];

    
    [self.bgView addSubview:self.countryImageV];
    [self.countryImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sourceL.mas_right).offset(kWidth_fact(2));
        make.centerY.equalTo(self.sourceL.mas_centerY);
        make.width.height.offset(kWidth_fact(12));
    }];

    
    [self.bgView addSubview:self.shareBtn];
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.picImageV.mas_bottom).offset(11);
        make.right.offset(kWidth_fact(-20));
        make.width.height.offset(kWidth_fact(13));
    }];

    
    [self.bgView addSubview:self.takeBtn];
    [self.takeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.shareBtn.mas_centerY);
        make.right.equalTo(self.shareBtn.mas_left).offset(kWidth_fact(-20));
        make.width.height.offset(kWidth_fact(16));
    }];

    [self.bgView addSubview:self.languageL];
    [self.languageL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.teacherL.mas_left);
        make.centerY.equalTo(self.scoreL.mas_centerY);
        make.width.lessThanOrEqualTo(@kWidth_fact(120));
    }];
    
    [self.bgView addSubview:self.timeL];
    [self.timeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.shareBtn.mas_right);
        make.centerY.equalTo(self.languageL.mas_centerY);
        make.width.lessThanOrEqualTo(@kWidth_fact(125));
    }];
}
-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        kRedius_Space(_bgView, kWidth_fact(23), CGSizeMake(0.2, 0.2), 0.2, color_black8);
        _bgView.backgroundColor = color_white10;
    }
    return _bgView;
}
-(UIImageView *)picImageV{
    if (!_picImageV) {
        _picImageV = [[UIImageView alloc] init];
        _picImageV.userInteractionEnabled = YES;
        _picImageV.frame = CGRectMake(0, 0, kWidth_fact(345), kWidth_fact(195));
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_picImageV.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(kWidth_fact(23), kWidth_fact(23))];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = _picImageV.bounds;
        maskLayer.path = maskPath.CGPath;
        _picImageV.layer.mask = maskLayer;
        _picImageV.image = KImage(@"48791.jpg");
    }
    return _picImageV;
}
-(UIView *)titleBgV{
    if(!_titleBgV){
        _titleBgV = [[UIView alloc] init];
        _titleBgV.backgroundColor = color_alpha_black5;
    }
    return _titleBgV;
}
-(UILabel *)titleL{
    if (!_titleL) {
        _titleL = [self addLabelText:@"西班牙语基础课程—2020年首批" font:KF_BH_F(15) textC:color_white10];
    }
    return _titleL;
}
-(UIView *)statusV{
    if (!_statusV) {
        _statusV = [[UIView alloc] init];
        _statusV.backgroundColor = [UIColor yellowColor];
        _statusV.frame = CGRectMake(0, 0, kWidth_fact(85), kWidth_fact(25));

        UIBezierPath *statusMaskPath = [UIBezierPath bezierPath];
        [statusMaskPath moveToPoint:CGPointMake(0, 0)];
        [statusMaskPath addLineToPoint:CGPointMake(kWidth_fact(62), 0)];
        [statusMaskPath addArcWithCenter:CGPointMake(kWidth_fact(62), kWidth_fact(23)) radius:kWidth_fact(23) startAngle:DEGREES_TO_RADIANS(278) endAngle:DEGREES_TO_RADIANS(0) clockwise:YES];
        [statusMaskPath addLineToPoint:CGPointMake(kWidth_fact(85), kWidth_fact(25))];
        [statusMaskPath addLineToPoint:CGPointMake(kWidth_fact(23), kWidth_fact(25))];
        [statusMaskPath addArcWithCenter:CGPointMake(kWidth_fact(23), kWidth_fact(2)) radius:kWidth_fact(23) startAngle:DEGREES_TO_RADIANS(90) endAngle:DEGREES_TO_RADIANS(180) clockwise:YES];
        CAShapeLayer *statusMaskLayer = [[CAShapeLayer alloc] init];
        statusMaskLayer.frame = _statusV.bounds;
        statusMaskLayer.path = statusMaskPath.CGPath;
        _statusV.layer.mask = statusMaskLayer;
        [_statusV.layer addSublayer:[UIColor color_shade:CGSizeMake(kWidth_fact(85), kWidth_fact(25)) colors:@[@"#00dac2",@"#fffa18"]]];
    }
    return _statusV;
}
-(UILabel *)statusL{
    if (!_statusL) {
        _statusL = [self addLabelText:@"1 ON 1" font:KF_BH_F(15) textC:color_white10];
        _statusL.textAlignment = NSTextAlignmentCenter;
    }
    return _statusL;
}
-(UIButton *)headerBtn{
    if (!_headerBtn) {
        _headerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _headerBtn.backgroundColor = [UIColor redColor];
        kRadius_WC(_headerBtn, kWidth_fact(25), kWidth_fact(2), color_white10);
    }
    return _headerBtn;
}
-(UIButton *)appointmentBtn{
    if (!_appointmentBtn) {
        _appointmentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _appointmentBtn.frame = CGRectMake(0, 0, kWidth_fact(80), kWidth_fact(27));
        _appointmentBtn.backgroundColor = color_cyan9;
        _appointmentBtn.titleLabel.font = KF_H_F(11);
        [_appointmentBtn setTitleColor:color_white10 forState:UIControlStateNormal];
        [_appointmentBtn setTitle:@"＋立即预约" forState:UIControlStateNormal];
        UIBezierPath *appointmentMaskPath = [UIBezierPath bezierPathWithRoundedRect:_appointmentBtn.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(kWidth_fact(23), kWidth_fact(23))];
        CAShapeLayer *appointmentMaskLayer = [[CAShapeLayer alloc] init];
        appointmentMaskLayer.frame = _appointmentBtn.bounds;
        appointmentMaskLayer.path = appointmentMaskPath.CGPath;
        _appointmentBtn.layer.mask = appointmentMaskLayer;
    }
    return _appointmentBtn;
}
-(UILabel *)scoreL{
    if (!_scoreL) {
        _scoreL = [self addLabelText:@"4.6分" font:KF_BH_F(11) textC:color_orange8];
        _scoreL.backgroundColor = color_orange3;
        KRadius(_scoreL, kWidth_fact(2));
        _scoreL.textAlignment = NSTextAlignmentCenter;
    }
    return _scoreL;
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
-(UILabel *)languageL{
    if (!_languageL) {
        _languageL = [self addLabelText:@"授课语言：西班牙西班牙西班牙" font:KF_H_F(11) textC:color_gray6];
    }
    return _languageL;
}
-(UILabel *)timeL{
    if (!_timeL) {
        _timeL = [self addLabelText:@"开播:08月01日 20:00" font:KF_H_F(11) textC:color_gray6];
    }
    return _timeL;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(UILabel *)addLabelText:(NSString *)text font:(UIFont *)f textC:(UIColor *)textC{
    UILabel *label = [[UILabel alloc] init];
    label.font = f;
    label.text = text;
    label.textColor = textC;
    return label;
}


@end
