//
//  DKHomeCollectionHeaderView.m
//  BeelinkC
//
//  Created by Gavin on 2020/9/9.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKHomeCollectionHeaderView.h"

@implementation DKHomeCollectionHeaderView

//顶部视图的缓存池标示
+ (NSString *)headerViewIdentifier{
    static NSString *headerIdentifier = @"headerViewIdentifier";
    return headerIdentifier;
}
//获取顶部视图对象
+ (instancetype)headerViewWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath{
    //从缓存池中寻找顶部视图对象，如果没有，该方法自动调用alloc/initWithFrame创建一个新的顶部视图返回
    DKHomeCollectionHeaderView *headerView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[DKHomeCollectionHeaderView headerViewIdentifier] forIndexPath:indexPath];
    headerView.backgroundColor = color_white10;
    return headerView;
    
}
//注册了顶部视图后，当缓存池中没有顶部视图的对象时候，自动调用alloc/initWithFrame创建
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        UIImageView *iconImageV = [[UIImageView alloc] init];
        iconImageV.image = KImage(@"home_group_icon");
        [self addSubview:iconImageV];
        [iconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(kWidth_fact(15));
            make.centerY.equalTo(self.mas_centerY);
        }];
        
        UILabel *textLabel=[[UILabel alloc]init];
        textLabel.font = KF_BH_F(16);
        textLabel.textColor = color_black8;
        [self addSubview:textLabel];
        [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(iconImageV.mas_right).offset(kWidth_fact(5));
            make.centerY.equalTo(iconImageV.mas_centerY);
        }];
        self.textLabel=textLabel;
    }
    return self;
}

@end
