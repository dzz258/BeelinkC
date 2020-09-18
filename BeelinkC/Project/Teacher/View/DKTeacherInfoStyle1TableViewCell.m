//
//  DKTeacherInfoStyle1TableViewCell.m
//  BeelinkC
//
//  Created by Gavin on 2020/9/16.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKTeacherInfoStyle1TableViewCell.h"
#import "LEEStarRating.h"

@interface DKTeacherInfoStyle1TableViewCell()

@property (nonatomic, strong) UIScrollView *scrollV;

@end

@implementation DKTeacherInfoStyle1TableViewCell

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
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(kWidth_fact(15)+i*kWidth_fact(303), kWidth_fact(5), kWidth_fact(288), kWidth_fact(140))];//
        bgView.backgroundColor = [UIColor whiteColor];
        kRedius_Space(bgView, kWidth_fact(10), CGSizeMake(0.1, 0.1), 0.1, color_black8);
        [self.scrollV addSubview:bgView];
        
        UIButton *headerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        KRadius(headerBtn, kWidth_fact(12.5));
        headerBtn.backgroundColor = [UIColor redColor];
        [bgView addSubview:headerBtn];
        [headerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(kWidth_fact(20));
            make.top.offset(kWidth_fact(22));
            make.width.height.offset(kWidth_fact(25));
        }];
        
        LEEStarRating *ratingView = [[LEEStarRating alloc] initWithFrame:CGRectMake(0,0,kWidth_fact(60),kWidth_fact(8)) Count:5];
        ratingView.spacing = kWidth_fact(3);
//        ratingView.backgroundColor = [UIColor redColor];
        ratingView.checkedImage = [UIImage imageNamed:@"details_collectH_icon"];
        ratingView.uncheckedImage = [UIImage imageNamed:@"details_collect_icon"];
        ratingView.type = RatingTypeHalf;
        ratingView.maximumScore = 10.0f;
        ratingView.minimumScore = 0.0f;
//        ratingView.touchEnabled = YES;
//        ratingView.slideEnabled = YES;
        ratingView.currentScoreChangeBlock = ^(CGFloat score){
            NSLog(@"二 [%.2f]" , score);
//            self.score = score;
        };
        // 请在设置完成最大最小的分数后再设置当前分数
        ratingView.currentScore = 4.0f;
        [bgView addSubview:ratingView];
        
        [ratingView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(bgView.mas_right).offset(kWidth_fact(-18));
            make.centerY.equalTo(headerBtn.mas_centerY);
            make.width.equalTo(@(kWidth_fact(60)));
            make.height.equalTo(@(kWidth_fact(8)));
        }];
        
        
        UILabel *titleL = [[UILabel alloc] init];
        titleL.text = @"Peter Taylor";
        titleL.font = KF_BH_F(13);
        titleL.textColor = color_black10;
        [bgView addSubview:titleL];
        [titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(headerBtn.mas_right).offset(kWidth_fact(10));
            make.centerY.equalTo(headerBtn.mas_centerY);
            make.width.lessThanOrEqualTo(@kWidth_fact(155));
        }];
        
        UILabel *contentL = [[UILabel alloc] init];
        contentL.text = @"西班牙专业学士,从事西班牙语言教育数年，有丰富的教学经验。性格开朗活泼，语感和表达能力较强。富有亲和力、耐心及责任感，课堂气氛活跃。";
        contentL.font = KF_H_F(11);
        contentL.numberOfLines = 0;
        contentL.textColor = color_gray6;
        [bgView addSubview:contentL];
        [contentL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(headerBtn.mas_left);
            make.top.equalTo(headerBtn.mas_bottom).offset(kWidth_fact(12));
            make.right.equalTo(ratingView.mas_right);
            make.bottom.equalTo(bgView.mas_bottom).offset(kWidth_fact(-36));
        }];
        
        
        UIButton *replyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [replyBtn setTitle:@"回复" forState:UIControlStateNormal];
        [replyBtn setTitleColor:color_cyan9 forState:UIControlStateNormal];
        replyBtn.titleLabel.font = KF_H_F(11);
        [bgView addSubview:replyBtn];
        [replyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(bgView.mas_right).offset(kWidth_fact(-14));
            make.bottom.equalTo(bgView.mas_bottom).offset(kWidth_fact(-10));
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
