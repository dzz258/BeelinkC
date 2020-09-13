//
//  DKBaseTableViewCell.m
//  dingdonghuigou
//
//  Created by Gavin on 2018/12/14.
//  Copyright © 2018 bei jing you ji. All rights reserved.
//

#import "DKBaseTableViewCell.h"

@implementation DKBaseTableViewCell

+ (instancetype)cellFromTableView:(UITableView *)tableView {
    DKBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self cellIdentifier]];
    if (!cell) {
        cell = [[self alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:[self cellIdentifier]];
        cell.backgroundColor=color_white10;
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.selectedBackgroundView = [UIView new];
        cell.selectedBackgroundView.backgroundColor = kColor_hex(@"#E6FCFA");
        
        [self parameters:cell];
    }
    return cell;
}
+(void)parameters:(DKBaseTableViewCell *)cell{}

+ (NSNumber *)cellHeight {
    return [NSNumber numberWithFloat:0.];
}

+ (NSString *)cellIdentifier {
    return [NSString stringWithFormat:@"%@", [self class]];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.cellCut_offRule];
        [self.cellCut_offRule mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(@0);
            make.bottom.equalTo(self.contentView.mas_bottom);
            make.height.equalTo(@kWidth_fact(1));
        }];
        [self createrUI];

    }
    return self;
}
-(void)createrUI{}
-(void)btnClick:(UIButton *)btn{
    if (self.dkBtnBlock) {
        self.dkBtnBlock(btn,@{});
    }
}
-(UIView *)cellCut_offRule{
    if (!_cellCut_offRule) {
        _cellCut_offRule = [[UIView alloc] init];
        _cellCut_offRule.backgroundColor = color_gray3;
        _cellCut_offRule.hidden = YES;
    }
    return _cellCut_offRule;
}
- (void)layoutSubviews {
    [super layoutSubviews];
}

@end
