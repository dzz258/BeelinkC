//
//  DKHomeCollectionViewCell.m
//  BeelinkC
//
//  Created by Gavin on 2020/9/9.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKHomeCollectionViewCell.h"

@interface DKHomeCollectionViewCell ()

@property (nonatomic, strong) UIImageView *picImageV;
@property (nonatomic, strong) UIImageView *iconImageV;

@property (nonatomic, strong) UILabel *titleL;

@property (nonatomic, strong) UIImageView *score_icon_ImageV;
@property (nonatomic, strong) UILabel *scoreL;

@property (nonatomic, strong) UIImageView *look_icon_ImageV;
@property (nonatomic, strong) UILabel *lookL;

@property (nonatomic, strong) UIImageView *more_icon_ImageV;
@property (nonatomic, strong) UIButton *moreBtn;

@end

@implementation DKHomeCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)layoutSubviews{
    [UIView animateWithDuration:0.3 animations:^{
        [super layoutSubviews];
    }];
}


-(void)setupUI{
    kRedius_Space(self.contentView, kWidth_fact(4), CGSizeMake(0.1, 0.1), 0.1, kColor_hex(@"999999"));
    
    [self.contentView addSubview:self.picImageV];
    [self.contentView addSubview:self.iconImageV];
    
    [self.contentView addSubview:self.titleL];
    
    [self.picImageV addSubview:self.score_icon_ImageV];
    [self.picImageV addSubview:self.scoreL];
    [self.picImageV addSubview:self.look_icon_ImageV];
    [self.picImageV addSubview:self.lookL];
    [self.contentView addSubview:self.more_icon_ImageV];
    [self.contentView addSubview:self.moreBtn];

    self.contentView.backgroundColor = color_white10;
    
    [self.picImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.height.offset(kWidth_fact(93));
    }];
    [self.iconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.equalTo(self.picImageV.mas_bottom).offset(kWidth_fact(10));
        make.width.height.offset(kWidth_fact(27));
    }];
    
    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageV.mas_right).offset(kWidth_fact(5));
        make.top.equalTo(self.iconImageV.mas_top);
        make.right.equalTo(self.contentView.mas_right).offset(-kWidth_fact(17));
    }];

    [self.score_icon_ImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(kWidth_fact(10));
        make.bottom.offset(kWidth_fact(-5));
    }];
    
    [self.scoreL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.score_icon_ImageV.mas_right).offset(kWidth_fact(4));
        make.centerY.equalTo(self.score_icon_ImageV.mas_centerY);
    }];
    
    [self.look_icon_ImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.scoreL.mas_right).offset(kWidth_fact(10));
        make.centerY.equalTo(self.scoreL.mas_centerY);
    }];
    
    [self.lookL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.look_icon_ImageV.mas_right).offset(kWidth_fact(4));
        make.centerY.equalTo(self.look_icon_ImageV.mas_centerY);
    }];

    [self.more_icon_ImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.picImageV.mas_right).offset(kWidth_fact(-3));
        make.top.equalTo(self.picImageV.mas_bottom).offset(kWidth_fact(10));
    }];
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.picImageV.mas_right);
        make.centerY.equalTo(self.more_icon_ImageV.mas_centerY);
        make.width.height.offset(kWidth_fact(23));
    }];
//
//    [self.originalPriceL mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.priceL.mas_right).offset(kWidth_fact(5));
//        make.centerY.equalTo(self.priceL.mas_centerY);
//        make.height.equalTo(@kWidth_fact(8));
//    }];
}

-(void)buttonClick{}

-(void)setImageName:(NSString *)imageName{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *resourcePath = [bundle resourcePath];
    NSString *filePath = [resourcePath stringByAppendingPathComponent:imageName];
    self.picImageV.image = [UIImage imageWithContentsOfFile:filePath];
}
-(UIImageView *)picImageV{
    if (!_picImageV) {
        _picImageV=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth_fact(165), kWidth_fact(93))];
        _picImageV.backgroundColor = [UIColor redColor];
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_picImageV.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(kWidth_fact(10), kWidth_fact(10))];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = _picImageV.bounds;
        maskLayer.path = maskPath.CGPath;
        _picImageV.layer.mask = maskLayer;
    }
    return _picImageV;
}
-(UIImageView *)iconImageV{
    if (!_iconImageV) {
        _iconImageV=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth_fact(165), kWidth_fact(93))];
        _iconImageV.backgroundColor = [UIColor redColor];
    }
    return _iconImageV;
}
-(UILabel *)titleL{
    if (!_titleL) {
        _titleL = [[UILabel alloc] init];
        _titleL.font = KF_H_F(13);
        _titleL.textColor = color_black10;
        _titleL.numberOfLines = 2;
        _titleL.text = @"口语超级大空投—助\n你英语满血复活";
    }
    return _titleL;
}

-(UIImageView *)score_icon_ImageV{
    if (!_score_icon_ImageV) {
        _score_icon_ImageV=[[UIImageView alloc] init];
        _score_icon_ImageV.image = KImage(@"home_cell_score");
    }
    return _score_icon_ImageV;
}
-(UILabel *)scoreL{
    if (!_scoreL) {
        _scoreL = [[UILabel alloc] init];
        _scoreL.font = KF_H_F(10);
        _scoreL.textColor = kColor_hex(@"ffffff");
        _scoreL.text = @"4.5分";
    }
    return _scoreL;
}
-(UIImageView *)look_icon_ImageV{
    if (!_look_icon_ImageV) {
        _look_icon_ImageV=[[UIImageView alloc] init];
        _look_icon_ImageV.image = KImage(@"home_cell_look_num");
    }
    return _look_icon_ImageV;
}

-(UILabel *)lookL{
    if (!_lookL) {
        _lookL = [[UILabel alloc] init];
        _lookL.font = KF_H_F(10);
        _lookL.textColor = kColor_hex(@"ffffff");
        _lookL.text = @"38983983";
    }
    return _lookL;
}

-(UIImageView *)more_icon_ImageV{
    if (!_more_icon_ImageV) {
        _more_icon_ImageV=[[UIImageView alloc] init];
        _more_icon_ImageV.image = KImage(@"home_cell_more");
    }
    return _more_icon_ImageV;
}
-(UIButton *)moreBtn{
    if (!_moreBtn) {
        _moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _moreBtn;
}
//@property (nonatomic, strong) UIImageView *more_icon_ImageV;
//@property (nonatomic, strong) UIButton *moreBtn;
//-(UILabel *)subTitleL{
//    if (!_subTitleL) {
//        _subTitleL = [[UILabel alloc] init];
//        _subTitleL.font = KF_H_F(9);
//        _subTitleL.textColor = [UIColor blackColor];
//        _subTitleL.numberOfLines = 2;
//        _subTitleL.text = @"3匹一级变频冷暖空调立\n式柜机";
//    }
//    return _subTitleL;
//}
//-(UILabel *)priceL{
//    if (!_priceL) {
//        _priceL = [[UILabel alloc] init];
//        _priceL.font = KF_H_F(13);
//        _priceL.textColor = [UIColor blackColor];
//        _priceL.text = @"￥5799";
//    }
//    return _priceL;
//}
//-(UILabel *)originalPriceL{
//    if (!_originalPriceL) {
//        _originalPriceL = [[UILabel alloc] init];
//        _originalPriceL.font = KF_H_F(8);
//        _originalPriceL.textColor = [UIColor blackColor];
//        _originalPriceL.text = @"￥6999";
//        NSString *textStr = @"￥6999 ";
//        //中划线
//        NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
//        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:textStr attributes:attribtDic];
//        // 赋值
//        _originalPriceL.attributedText = attribtStr;
//    }
//    return _originalPriceL;
//}


@end
