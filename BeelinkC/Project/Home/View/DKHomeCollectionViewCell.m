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
@property (nonatomic, strong) UILabel *titleL;
@property (nonatomic, strong) UILabel *subTitleL;

@property (nonatomic, strong) UILabel *priceL;
@property (nonatomic, strong) UILabel *originalPriceL;

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
    [self.contentView addSubview:self.titleL];
    [self.contentView addSubview:self.subTitleL];
    [self.contentView addSubview:self.priceL];
    [self.contentView addSubview:self.originalPriceL];
    
    self.contentView.backgroundColor = [UIColor whiteColor];
//    [self.picImageV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.offset(0);
//        make.left.offset(0);
//        make.width.height.equalTo(@kWidth_fact(120));
//    }];
    
    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.picImageV.mas_left).offset(kWidth_fact(8));
        make.top.equalTo(self.picImageV.mas_bottom).offset(kWidth_fact(8));
        make.right.equalTo(self.contentView.mas_right).offset(-kWidth_fact(5));
        make.height.equalTo(@kWidth_fact(11));
    }];

    [self.subTitleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleL.mas_left);
        make.top.equalTo(self.titleL.mas_bottom).offset(kWidth_fact(6));
        make.right.equalTo(self.contentView.mas_right).offset(-kWidth_fact(5));
    }];

    [self.priceL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.subTitleL.mas_left).offset(-kWidth_fact(2));
        make.top.equalTo(self.subTitleL.mas_bottom).offset(kWidth_fact(10));
        make.height.equalTo(@kWidth_fact(10));
    }];
    
    [self.originalPriceL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceL.mas_right).offset(kWidth_fact(5));
        make.centerY.equalTo(self.priceL.mas_centerY);
        make.height.equalTo(@kWidth_fact(8));
    }];
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
        _picImageV=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth_fact(120), kWidth_fact(120))];
        _picImageV.backgroundColor = [UIColor redColor];
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_picImageV.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(kWidth_fact(4), kWidth_fact(4))];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = _picImageV.bounds;
        maskLayer.path = maskPath.CGPath;
        _picImageV.layer.mask = maskLayer;
    }
    return _picImageV;
}
-(UILabel *)titleL{
    if (!_titleL) {
        _titleL = [[UILabel alloc] init];
        _titleL.font = KF_H_F(11);
        _titleL.textColor =[UIColor blackColor];
        _titleL.text = @"海尔1.5匹家用空调";
    }
    return _titleL;
}

-(UILabel *)subTitleL{
    if (!_subTitleL) {
        _subTitleL = [[UILabel alloc] init];
        _subTitleL.font = KF_H_F(9);
        _subTitleL.textColor = [UIColor blackColor];
        _subTitleL.numberOfLines = 2;
        _subTitleL.text = @"3匹一级变频冷暖空调立\n式柜机";
    }
    return _subTitleL;
}
-(UILabel *)priceL{
    if (!_priceL) {
        _priceL = [[UILabel alloc] init];
        _priceL.font = KF_H_F(13);
        _priceL.textColor = [UIColor blackColor];
        _priceL.text = @"￥5799";
    }
    return _priceL;
}
-(UILabel *)originalPriceL{
    if (!_originalPriceL) {
        _originalPriceL = [[UILabel alloc] init];
        _originalPriceL.font = KF_H_F(8);
        _originalPriceL.textColor = [UIColor blackColor];
        _originalPriceL.text = @"￥6999";
        NSString *textStr = @"￥6999 ";
        //中划线
        NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:textStr attributes:attribtDic];
        // 赋值
        _originalPriceL.attributedText = attribtStr;
    }
    return _originalPriceL;
}


@end
