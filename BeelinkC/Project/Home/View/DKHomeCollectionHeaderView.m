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
    headerView.backgroundColor = [UIColor redColor];
    return headerView;
    
}
//注册了顶部视图后，当缓存池中没有顶部视图的对象时候，自动调用alloc/initWithFrame创建
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        UILabel *textLabel=[[UILabel alloc]init];
        CGFloat x=5;
        CGFloat y=5;
        CGFloat width=frame.size.width-10;
        CGFloat height=frame.size.height-10;
        textLabel.frame=CGRectMake(x, y, width, height);
        textLabel.numberOfLines=0;
//        textLabel.textAlignment=NSTextAlignmentCenter;
        textLabel.font=[UIFont systemFontOfSize:15];
        textLabel.textColor=[UIColor blackColor];
        [self addSubview:textLabel];
        self.textLabel=textLabel;
    }
    return self;
}

@end
