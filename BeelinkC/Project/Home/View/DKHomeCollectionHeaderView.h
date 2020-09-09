//
//  DKHomeCollectionHeaderView.h
//  BeelinkC
//
//  Created by Gavin on 2020/9/9.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DKHomeCollectionHeaderView : UICollectionReusableView

@property (strong, nonatomic) UILabel *textLabel;

//顶部视图的缓存池标示
+ (NSString *)headerViewIdentifier;
//获取顶部视图对象
+ (instancetype)headerViewWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
