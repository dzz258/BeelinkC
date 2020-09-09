//
//  DKHomeCollectionFooterView.m
//  BeelinkC
//
//  Created by Gavin on 2020/9/9.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKHomeCollectionFooterView.h"
#define KCellSpace    40 //cell之间的间距

@interface DKHomeCollectionFooterView ()<ZFJRollViewDelegate>

@end

@implementation DKHomeCollectionFooterView

//底部视图的缓存池标示
+ (NSString *)footerViewIdentifier{
    static NSString *footerIdentifier = @"footerViewIdentifier";
    return footerIdentifier;
}
//获取底部视图对象
+ (instancetype)footerViewWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath{
    //从缓存池中寻找底部视图对象，如果没有，该方法自动调用alloc/initWithFrame创建一个新的底部视图返回
    DKHomeCollectionFooterView *footerView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[DKHomeCollectionFooterView footerViewIdentifier] forIndexPath:indexPath];
    return footerView;
    
}
//注册了底部视图后，当缓存池中没有底部视图的对象时候，自动调用alloc/initWithFrame创建
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self addSubview:self.rollView];
    }
    return self;
}
-(ZFJRollView *)rollView{
    if (!_rollView) {
        _rollView = [[ZFJRollView alloc] initWithFrame:CGRectMake(0, 0, KScreen_Width - KCellSpace, kWidth_fact(240)) withDistanceForScroll:0 withGap:30];
//        _rollView.backgroundColor = [UIColor whiteColor];
        _rollView.delegate = self;
    }
    return _rollView;
}
@end
