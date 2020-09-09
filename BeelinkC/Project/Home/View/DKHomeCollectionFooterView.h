//
//  DKHomeCollectionFooterView.h
//  BeelinkC
//
//  Created by Gavin on 2020/9/9.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZFJRollView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DKHomeCollectionFooterView : UICollectionReusableView
@property (nonatomic, strong) ZFJRollView *rollView;
//底部视图的缓存池标示
+ (NSString *)footerViewIdentifier;
//获取底部视图对象
+ (instancetype)footerViewWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
