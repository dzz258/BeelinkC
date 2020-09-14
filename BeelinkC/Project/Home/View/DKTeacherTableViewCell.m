//
//  DKTeacherTableViewCell.m
//  BeelinkC
//
//  Created by Gavin on 2020/9/13.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKTeacherTableViewCell.h"

@interface DKTeacherTableViewCell()

@property (nonatomic, strong) UIButton *headerBtn;
@property (nonatomic, strong) UILabel *teacherL;
@property (nonatomic, strong) UILabel *sourceL;
@property (nonatomic, strong) UIImageView *countryImageV;
@property (nonatomic, strong) UILabel *scoreL;
@property (nonatomic, strong) UIButton *concernBtn;

@property (nonatomic, strong) UIImageView *teachLangueImaegV;
@property (nonatomic, strong) UILabel *teachLangueL;
@property (nonatomic, strong) UILabel *teachLangueValL;

@property (nonatomic, strong) UIImageView *canLangueImaegV;
@property (nonatomic, strong) UILabel *canLangueL;
@property (nonatomic, strong) UIView *canLangueValV;

@end

@implementation DKTeacherTableViewCell

-(void)createrUI{
    [self.contentView addSubview:self.headerBtn];
    [self.headerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(kWidth_fact(15));
        make.top.offset(kWidth_fact(9));
        make.width.height.offset(kWidth_fact(50));
    }];
    
    [self.contentView addSubview:self.teacherL];
    [self.teacherL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerBtn.mas_right).offset(kWidth_fact(15));
        make.top.offset(kWidth_fact(14));
        make.width.lessThanOrEqualTo(@kWidth_fact(165));
        make.height.offset(kWidth_fact(15));
    }];
    
    [self.contentView addSubview:self.scoreL];
    [self.scoreL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headerBtn.mas_centerX);
        make.top.equalTo(self.headerBtn.mas_bottom).offset(kWidth_fact(10));
        make.width.offset(kWidth_fact(45));
        make.height.offset(kWidth_fact(16));
    }];
    
    [self.contentView addSubview:self.sourceL];
    [self.sourceL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.teacherL.mas_right).offset(kWidth_fact(5));
        make.centerY.equalTo(self.teacherL.mas_centerY);
    }];
    
    [self.contentView addSubview:self.countryImageV];
    [self.countryImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sourceL.mas_right).offset(kWidth_fact(2));
        make.centerY.equalTo(self.sourceL.mas_centerY);
        make.width.height.offset(kWidth_fact(12));
    }];
    
    [self.contentView addSubview:self.concernBtn];
    [self.concernBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(kWidth_fact(23));
        make.right.offset(kWidth_fact(-15));
        make.width.offset(kWidth_fact(50));
        make.height.offset(kWidth_fact(22));
    }];
    
    [self.contentView addSubview:self.teachLangueImaegV];
    [self.teachLangueImaegV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.teacherL.mas_left);
        make.top.equalTo(self.teacherL.mas_bottom).offset(kWidth_fact(15));
        make.width.offset(kWidth_fact(16));
        make.height.offset(kWidth_fact(17));
    }];
    [self.contentView addSubview:self.teachLangueL];
    [self.teachLangueL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.teachLangueImaegV.mas_right).offset(kWidth_fact(3));
        make.centerY.equalTo(self.teachLangueImaegV.mas_centerY);
    }];
    
    [self.contentView addSubview:self.teachLangueValL];
    [self.teachLangueValL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.teachLangueL.mas_right).offset(kWidth_fact(10));
        make.centerY.equalTo(self.teachLangueL.mas_centerY);
        make.width.lessThanOrEqualTo(@kWidth_fact(150));
    }];
    
    [self.contentView addSubview:self.canLangueImaegV];
    [self.canLangueImaegV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.teacherL.mas_left);
        make.top.equalTo(self.teachLangueImaegV.mas_bottom).offset(kWidth_fact(10));
        make.width.offset(kWidth_fact(16));
        make.height.offset(kWidth_fact(17));
    }];
    
    [self.contentView addSubview:self.canLangueL];
    [self.canLangueL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.canLangueImaegV.mas_right).offset(kWidth_fact(3));
        make.centerY.equalTo(self.canLangueImaegV.mas_centerY);
    }];
    
    [self.contentView addSubview:self.canLangueValV];
    [self.canLangueValV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.canLangueL.mas_right).offset(kWidth_fact(10));
        make.height.offset(kWidth_fact(20));
        make.centerY.equalTo(self.canLangueL.mas_centerY);
        make.right.offset(kWidth_fact(-15));
    }];
    
    self.cellCut_offRule.hidden = NO;
    [self.cellCut_offRule mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.offset(kWidth_fact(15));
        make.right.offset(kWidth_fact(-15));
    }];
}
-(UIButton *)headerBtn{
    if (!_headerBtn) {
        _headerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _headerBtn.backgroundColor = [UIColor redColor];
        kRadius_WC(_headerBtn, kWidth_fact(25), kWidth_fact(2), color_white10);
    }
    return _headerBtn;
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
        _teacherL = [self addLabelText:@"Herman老师" font:KF_BH_F(15) textC:color_black10];
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
-(UIButton *)concernBtn{
    if (!_concernBtn) {
        _concernBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        KRadius(_concernBtn, kWidth_fact(11));
        [_concernBtn setTitle:@"已关注" forState:UIControlStateNormal];
        _concernBtn.titleLabel.font = KF_H_F(11);
        [_concernBtn setBackgroundColor:color_cyan9];
    }
    return _concernBtn;
}

-(UIImageView *)teachLangueImaegV{
    if (!_teachLangueImaegV) {
        _teachLangueImaegV = [[UIImageView alloc] init];
//        _teachLangueImaegV.backgroundColor = [UIColor redColor];
        _teachLangueImaegV.image = KImage(@"langue_icon");
    }
    return _teachLangueImaegV;
}

-(UIImageView *)canLangueImaegV{
    if (!_canLangueImaegV) {
        _canLangueImaegV = [[UIImageView alloc] init];
//        _canLangueImaegV.backgroundColor = [UIColor redColor];
        _canLangueImaegV.image = KImage(@"langue_icon");
    }
    return _canLangueImaegV;
}

-(UILabel *)teachLangueL{
    if (!_teachLangueL) {
        _teachLangueL = [self addLabelText:@"授课语言" font:KF_BH_F(13) textC:color_black10];
    }
    return _teachLangueL;
}

-(UILabel *)canLangueL{
    if (!_canLangueL) {
        _canLangueL = [self addLabelText:@"授课语言" font:KF_BH_F(13) textC:color_black10];
    }
    return _canLangueL;
}

-(UILabel *)teachLangueValL{
    if (!_teachLangueValL) {
        _teachLangueValL = [self addLabelText:@"西班牙语西班牙语西班牙语西班牙语西班牙语西班牙语西班牙语西班牙语西班牙语" font:KF_H_F(11) textC:color_gray6];
    }
    return _teachLangueValL ;
}

-(UIView *)canLangueValV{
    if (!_canLangueValV) {
        _canLangueValV = [[UIView alloc] init];
        _canLangueValV.backgroundColor = [UIColor redColor];
    }
    return _canLangueValV;
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
