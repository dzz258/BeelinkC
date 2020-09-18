//
//  DKTeacherInfoStyle2TableViewCell.m
//  BeelinkC
//
//  Created by Gavin on 2020/9/16.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKTeacherInfoStyle2TableViewCell.h"

@interface DKTeacherInfoStyle2TableViewCell()

@property (nonatomic, strong) UIScrollView *scrollV;

@end

@implementation DKTeacherInfoStyle2TableViewCell

-(void)createrUI{
    [self.contentView addSubview:self.scrollV];
    [self.scrollV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(0);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
    [self addDataV];
}

-(void)addDataV{
    for (int i = 0; i < 10; i++) {
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(kWidth_fact(15)+i*kWidth_fact(360), kWidth_fact(5), kWidth_fact(335), kWidth_fact(105))];//
        bgView.backgroundColor = [UIColor whiteColor];
        kRedius_Space(bgView, kWidth_fact(10), CGSizeMake(0.1, 0.1), 0.1, color_black8);
        [self.scrollV addSubview:bgView];
        
        UIButton *headerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        KRadius(headerBtn, kWidth_fact(12.5));
        headerBtn.backgroundColor = [UIColor redColor];
        [bgView addSubview:headerBtn];
        [headerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(kWidth_fact(15));
            make.top.offset(kWidth_fact(15));
            make.width.height.offset(kWidth_fact(75));
        }];
        
        UILabel *titleL = [[UILabel alloc] init];
        titleL.text = @"Peter Taylor";
        titleL.font = KF_BH_F(13);
        titleL.textColor = color_black10;
        [bgView addSubview:titleL];
        [titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(headerBtn.mas_right).offset(kWidth_fact(15));
            make.top.equalTo(headerBtn.mas_top).offset(kWidth_fact(10));
            make.right.equalTo(bgView.mas_right).offset(kWidth_fact(-20));
        }];
        
        UILabel *subTitleL = [[UILabel alloc] init];
        subTitleL.text = @"西班牙专业学士,从事西班牙语言教育数年，有丰富的教学经验。性格开朗活泼，语感和表达能力较强。富有亲和力、耐心及责任感，课堂气氛活跃。";
        subTitleL.font = KF_H_F(11);
//        subTitleL.numberOfLines = 2;
        subTitleL.textColor = color_gray6;
        [bgView addSubview:subTitleL];
        [subTitleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(titleL.mas_left);
            make.centerY.equalTo(headerBtn.mas_centerY);
            make.right.equalTo(bgView.mas_right).offset(kWidth_fact(-20));
        }];
        
        UILabel *timeL = [[UILabel alloc] init];
        timeL.text = @" 08月01日  13:00 ";
        timeL.textColor = color_orange8;
        timeL.backgroundColor = color_orange3;
        timeL.font = KF_H_F(11);
        [bgView addSubview:timeL];
        [timeL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(titleL.mas_left);
            make.bottom.equalTo(headerBtn.mas_bottom);
            make.height.offset(kWidth_fact(20));
        }];
        
        UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightBtn setImage:KImage(@"teacher_info_cell_right") forState:UIControlStateNormal];
        [self.scrollV addSubview:rightBtn];
        [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(bgView.mas_bottom).offset(kWidth_fact(-10));
            make.centerX.equalTo(bgView.mas_right);
            make.height.width.offset(kWidth_fact(20));
        }];
        
        if (i == 9) {
            self.scrollV.contentSize = CGSizeMake(CGRectGetMaxX(bgView.frame)+kWidth_fact(15), self.scrollV.height);
        }
    }
}
-(UIScrollView *)scrollV{
    if (!_scrollV) {
        _scrollV = [[UIScrollView alloc] init];
        _scrollV.showsHorizontalScrollIndicator = NO;
//        _scrollV.backgroundColor = [UIColor redColor];
    }
    return _scrollV;
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
