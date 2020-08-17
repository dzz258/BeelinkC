//
//  DKBaseTableViewCell.h
//  dingdonghuigou
//
//  Created by Gavin on 2018/12/14.
//  Copyright © 2018 bei jing you ji. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^DKBtnBlock)(UIButton *btn,id model);

@interface DKBaseTableViewCell : UITableViewCell//UITableViewCell
/*************************不需要修改 start******************************/
// 开发者不需要关心
+ (NSString *)cellIdentifier;
+ (instancetype)cellFromTableView:(UITableView *)tableView;
/*************************不需要修改 end******************************/

/**
 子类需要重写，设置固定值
 
 @return package of animateding cell height
 */
+ (NSNumber *)cellHeight;
+(void)parameters:(DKBaseTableViewCell *)cell;
-(void)createrUI;

@property (nonatomic, copy) DKBtnBlock dkBtnBlock;
-(void)btnClick:(UIButton *)btn;

@property (nonatomic, strong) UIView * cellCut_offRule;//分割线

@end

NS_ASSUME_NONNULL_END
