//
//  DKDropBtn.m
//  BeelinkC
//
//  Created by Gavin on 2020/8/28.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKDropBtn.h"

@interface DKDropBtn ()

@end

@implementation DKDropBtn

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        [self setImage:[UIImage imageNamed:@"login_drop"] forState:UIControlStateNormal];
//        [self setImage:[UIImage imageNamed:@"login_drop"] forState:UIControlStateHighlighted];
//        [self setTitleColor:kColor(@"000000", @"") forState:UIControlStateNormal];
        [self addTarget:self action:@selector(arrowClick) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:self.imageV];
        [self addSubview:self.subTitleL];
        [self addSubview:self.titleL];
        
        [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
            make.right.offset(kWidth_fact(-10));
            make.height.offset(kWidth_fact(5));
            make.width.offset(kWidth_fact(7));
        }];
        
        [self.subTitleL mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.offset(0);
            make.right.equalTo(self.mas_right).offset(kWidth_fact(-25));
            make.centerY.equalTo(self.mas_centerY);
        }];
        
        [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(0);
//            make.top.offset(0);
            make.right.equalTo(self.subTitleL.mas_left).offset(kWidth_fact(-5));
            make.centerY.equalTo(self.mas_centerY);
        }];
    }
    return self;
}
-(UILabel *)titleL{
    if (!_titleL) {
        _titleL = [[UILabel alloc] init];
        _titleL.textColor = color_black8;
        _titleL.numberOfLines = 2;
    }
    return _titleL;
}
-(UILabel *)subTitleL{
    if (!_subTitleL) {
        _subTitleL = [[UILabel alloc] init];
        _subTitleL.textColor = color_black8;
    }
    return _subTitleL;
}
-(UIImageView *)imageV{
    if (!_imageV) {
        _imageV = [[UIImageView alloc] init];
        _imageV.image = KImage(@"login_drop");
//        [self setImage:[UIImage imageNamed:@"login_drop"] forState:UIControlStateNormal];
//        [self setImage:[UIImage imageNamed:@"login_drop"] forState:UIControlStateHighlighted];
    }
    return _imageV;
}
-(void)arrowClick{
    if (self.arrowBtnClick) {
        self.arrowBtnClick();
    }
}
//-(CGRect)titleRectForContentRect:(CGRect)contentRect{
//    return CGRectMake(0, 0, self.width-kWidth_fact(7)-kWidth_fact(15), self.height);
//}
//-(CGRect)imageRectForContentRect:(CGRect)contentRect{
//    return CGRectMake(self.width-kWidth_fact(7)-kWidth_fact(10),(self.height-kWidth_fact(5))*0.5, kWidth_fact(7), kWidth_fact(5));
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
