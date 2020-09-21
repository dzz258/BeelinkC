//
//  DKTeacherInfoStyle3TableViewCell.m
//  BeelinkC
//
//  Created by Gavin on 2020/9/16.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKTeacherInfoStyle3TableViewCell.h"

@interface DKTeacherInfoStyle3TableViewCell()
@property (nonatomic,strong) UIView *leftV;
@property (nonatomic, strong) UIImageView *leftPicImageV;
@property (nonatomic, strong) UIImageView *leftIconImageV;

@property (nonatomic, strong) UILabel *leftTitleL;

@property (nonatomic, strong) UIImageView *leftScore_icon_ImageV;
@property (nonatomic, strong) UILabel *leftScoreL;

@property (nonatomic, strong) UIImageView *leftLook_icon_ImageV;
@property (nonatomic, strong) UILabel *leftLookL;

@property (nonatomic, strong) UIImageView *leftMore_icon_ImageV;
@property (nonatomic, strong) UIButton *leftMoreBtn;

@property (nonatomic,strong) UIView *rightV;


@property (nonatomic, strong) UIImageView *rightPicImageV;
@property (nonatomic, strong) UIImageView *rightIconImageV;

@property (nonatomic, strong) UILabel *rightTitleL;

@property (nonatomic, strong) UIImageView *rightScore_icon_ImageV;
@property (nonatomic, strong) UILabel *rightScoreL;

@property (nonatomic, strong) UIImageView *rightLook_icon_ImageV;
@property (nonatomic, strong) UILabel *rightLookL;

@property (nonatomic, strong) UIImageView *rightMore_icon_ImageV;
@property (nonatomic, strong) UIButton *rightMoreBtn;

@end

@implementation DKTeacherInfoStyle3TableViewCell

-(void)createrUI{
    [self.contentView addSubview:self.leftV];
    [self.contentView addSubview:self.rightV];
    [self.leftV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(kWidth_fact(15));
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.left.offset(kWidth_fact(15));
        make.width.offset(kWidth_fact(165));
    }];
    
    [self.leftV addSubview:self.leftPicImageV];
    [self.leftV addSubview:self.leftIconImageV];
    
    [self.leftV addSubview:self.leftTitleL];
    
    [self.leftPicImageV addSubview:self.leftScore_icon_ImageV];
    [self.leftPicImageV addSubview:self.leftScoreL];
    [self.leftPicImageV addSubview:self.leftLook_icon_ImageV];
    [self.leftPicImageV addSubview:self.leftLookL];
    [self.contentView addSubview:self.leftMore_icon_ImageV];
    [self.contentView addSubview:self.leftMoreBtn];

    self.contentView.backgroundColor = color_white10;
    
    [self.leftPicImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.height.offset(kWidth_fact(93));
    }];
    [self.leftIconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.equalTo(self.leftPicImageV.mas_bottom).offset(kWidth_fact(10));
        make.width.height.offset(kWidth_fact(27));
    }];
    
    [self.leftTitleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftIconImageV.mas_right).offset(kWidth_fact(5));
        make.top.equalTo(self.leftIconImageV.mas_top);
        make.right.equalTo(self.contentView.mas_right).offset(-kWidth_fact(17));
    }];

    [self.leftScore_icon_ImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(kWidth_fact(10));
        make.bottom.offset(kWidth_fact(-5));
    }];
    
    [self.leftScoreL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftScore_icon_ImageV.mas_right).offset(kWidth_fact(4));
        make.centerY.equalTo(self.leftScore_icon_ImageV.mas_centerY);
    }];
    
    [self.leftLook_icon_ImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftScoreL.mas_right).offset(kWidth_fact(10));
        make.centerY.equalTo(self.leftScoreL.mas_centerY);
    }];
    
    [self.leftLookL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftLook_icon_ImageV.mas_right).offset(kWidth_fact(4));
        make.centerY.equalTo(self.leftLook_icon_ImageV.mas_centerY);
    }];

    [self.leftMore_icon_ImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.leftPicImageV.mas_right).offset(kWidth_fact(-3));
        make.top.equalTo(self.leftPicImageV.mas_bottom).offset(kWidth_fact(10));
    }];
    [self.leftMoreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.leftPicImageV.mas_right);
        make.centerY.equalTo(self.leftMore_icon_ImageV.mas_centerY);
        make.width.height.offset(kWidth_fact(23));
    }];
    
    [self.rightV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(kWidth_fact(15));
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.right.offset(kWidth_fact(-15));
        make.width.offset(kWidth_fact(165));
    }];
    
    [self.rightV addSubview:self.rightPicImageV];
    [self.rightV addSubview:self.rightIconImageV];
    
    [self.rightV addSubview:self.rightTitleL];
    
    [self.rightPicImageV addSubview:self.rightScore_icon_ImageV];
    [self.rightPicImageV addSubview:self.rightScoreL];
    [self.rightPicImageV addSubview:self.rightLook_icon_ImageV];
    [self.rightPicImageV addSubview:self.rightLookL];
    [self.contentView addSubview:self.rightMore_icon_ImageV];
    [self.contentView addSubview:self.rightMoreBtn];

    self.contentView.backgroundColor = color_white10;
    
    [self.rightPicImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.height.offset(kWidth_fact(93));
    }];
    [self.rightIconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.equalTo(self.rightPicImageV.mas_bottom).offset(kWidth_fact(10));
        make.width.height.offset(kWidth_fact(27));
    }];
    
    [self.rightTitleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rightIconImageV.mas_right).offset(kWidth_fact(5));
        make.top.equalTo(self.rightIconImageV.mas_top);
        make.right.equalTo(self.contentView.mas_right).offset(-kWidth_fact(17));
    }];

    [self.rightScore_icon_ImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(kWidth_fact(10));
        make.bottom.offset(kWidth_fact(-5));
    }];
    
    [self.rightScoreL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rightScore_icon_ImageV.mas_right).offset(kWidth_fact(4));
        make.centerY.equalTo(self.rightScore_icon_ImageV.mas_centerY);
    }];
    
    [self.rightLook_icon_ImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rightScoreL.mas_right).offset(kWidth_fact(10));
        make.centerY.equalTo(self.rightScoreL.mas_centerY);
    }];
    
    [self.rightLookL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rightLook_icon_ImageV.mas_right).offset(kWidth_fact(4));
        make.centerY.equalTo(self.rightLook_icon_ImageV.mas_centerY);
    }];

    [self.rightMore_icon_ImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.rightPicImageV.mas_right).offset(kWidth_fact(-3));
        make.top.equalTo(self.rightPicImageV.mas_bottom).offset(kWidth_fact(10));
    }];
    [self.rightMoreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.rightPicImageV.mas_right);
        make.centerY.equalTo(self.rightMore_icon_ImageV.mas_centerY);
        make.width.height.offset(kWidth_fact(23));
    }];
}

-(UIView *)leftV{
    if (!_leftV) {
        _leftV = [[UIView alloc] init];
        _leftV.backgroundColor = color_white10;
        kRedius_Space(_leftV, kWidth_fact(4), CGSizeMake(0.1, 0.1), 0.1, kColor_hex(@"999999"));

    }
    return _leftV;
}
-(UIImageView *)leftPicImageV{
    if (!_leftPicImageV) {
        _leftPicImageV=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth_fact(165), kWidth_fact(93))];
        _leftPicImageV.backgroundColor = [UIColor redColor];
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_leftPicImageV.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(kWidth_fact(10), kWidth_fact(10))];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = _leftPicImageV.bounds;
        maskLayer.path = maskPath.CGPath;
        _leftPicImageV.layer.mask = maskLayer;
    }
    return _leftPicImageV;
}
-(UIImageView *)leftIconImageV{
    if (!_leftIconImageV) {
        _leftIconImageV=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth_fact(165), kWidth_fact(93))];
        _leftIconImageV.backgroundColor = [UIColor redColor];
    }
    return _leftIconImageV;
}
-(UILabel *)leftTitleL{
    if (!_leftTitleL) {
        _leftTitleL = [[UILabel alloc] init];
        _leftTitleL.font = KF_H_F(13);
        _leftTitleL.textColor = color_black10;
        _leftTitleL.numberOfLines = 2;
        _leftTitleL.text = @"口语超级大空投—助\n你英语满血复活";
    }
    return _leftTitleL;
}

-(UIImageView *)leftScore_icon_ImageV{
    if (!_leftScore_icon_ImageV) {
        _leftScore_icon_ImageV=[[UIImageView alloc] init];
        _leftScore_icon_ImageV.image = KImage(@"home_cell_score");
    }
    return _leftScore_icon_ImageV;
}
-(UILabel *)leftScoreL{
    if (!_leftScoreL) {
        _leftScoreL = [[UILabel alloc] init];
        _leftScoreL.font = KF_H_F(10);
        _leftScoreL.textColor = kColor_hex(@"ffffff");
        _leftScoreL.text = @"4.5分";
    }
    return _leftScoreL;
}
-(UIImageView *)leftLook_icon_ImageV{
    if (!_leftLook_icon_ImageV) {
        _leftLook_icon_ImageV=[[UIImageView alloc] init];
        _leftLook_icon_ImageV.image = KImage(@"home_cell_look_num");
    }
    return _leftLook_icon_ImageV;
}

-(UILabel *)leftLookL{
    if (!_leftLookL) {
        _leftLookL = [[UILabel alloc] init];
        _leftLookL.font = KF_H_F(10);
        _leftLookL.textColor = kColor_hex(@"ffffff");
        _leftLookL.text = @"38983983";
    }
    return _leftLookL;
}

-(UIImageView *)leftMore_icon_ImageV{
    if (!_leftMore_icon_ImageV) {
        _leftMore_icon_ImageV=[[UIImageView alloc] init];
        _leftMore_icon_ImageV.image = KImage(@"home_cell_more");
    }
    return _leftMore_icon_ImageV;
}
-(UIButton *)leftMoreBtn{
    if (!_leftMoreBtn) {
        _leftMoreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _leftMoreBtn;
}

-(UIView *)rightV{
    if (!_rightV) {
        _rightV = [[UIView alloc] init];
        _rightV.backgroundColor = color_white10;
        kRedius_Space(_rightV, kWidth_fact(4), CGSizeMake(0.1, 0.1), 0.1, kColor_hex(@"999999"));
    }
    return _rightV;
}

-(UIImageView *)rightPicImageV{
    if (!_rightPicImageV) {
        _rightPicImageV=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth_fact(165), kWidth_fact(93))];
        _rightPicImageV.backgroundColor = [UIColor redColor];
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_rightPicImageV.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(kWidth_fact(10), kWidth_fact(10))];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = _rightPicImageV.bounds;
        maskLayer.path = maskPath.CGPath;
        _rightPicImageV.layer.mask = maskLayer;
    }
    return _rightPicImageV;
}
-(UIImageView *)rightIconImageV{
    if (!_rightIconImageV) {
        _rightIconImageV=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth_fact(165), kWidth_fact(93))];
        _rightIconImageV.backgroundColor = [UIColor redColor];
    }
    return _rightIconImageV;
}
-(UILabel *)rightTitleL{
    if (!_rightTitleL) {
        _rightTitleL = [[UILabel alloc] init];
        _rightTitleL.font = KF_H_F(13);
        _rightTitleL.textColor = color_black10;
        _rightTitleL.numberOfLines = 2;
        _rightTitleL.text = @"口语超级大空投—助\n你英语满血复活";
    }
    return _rightTitleL;
}

-(UIImageView *)rightScore_icon_ImageV{
    if (!_rightScore_icon_ImageV) {
        _rightScore_icon_ImageV=[[UIImageView alloc] init];
        _rightScore_icon_ImageV.image = KImage(@"home_cell_score");
    }
    return _rightScore_icon_ImageV;
}
-(UILabel *)rightScoreL{
    if (!_rightScoreL) {
        _rightScoreL = [[UILabel alloc] init];
        _rightScoreL.font = KF_H_F(10);
        _rightScoreL.textColor = kColor_hex(@"ffffff");
        _rightScoreL.text = @"4.5分";
    }
    return _rightScoreL;
}
-(UIImageView *)rightLook_icon_ImageV{
    if (!_rightLook_icon_ImageV) {
        _rightLook_icon_ImageV=[[UIImageView alloc] init];
        _rightLook_icon_ImageV.image = KImage(@"home_cell_look_num");
    }
    return _rightLook_icon_ImageV;
}

-(UILabel *)rightLookL{
    if (!_rightLookL) {
        _rightLookL = [[UILabel alloc] init];
        _rightLookL.font = KF_H_F(10);
        _rightLookL.textColor = kColor_hex(@"ffffff");
        _rightLookL.text = @"38983983";
    }
    return _rightLookL;
}

-(UIImageView *)rightMore_icon_ImageV{
    if (!_rightMore_icon_ImageV) {
        _rightMore_icon_ImageV=[[UIImageView alloc] init];
        _rightMore_icon_ImageV.image = KImage(@"home_cell_more");
    }
    return _rightMore_icon_ImageV;
}
-(UIButton *)rightMoreBtn{
    if (!_rightMoreBtn) {
        _rightMoreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _rightMoreBtn;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
