//
//  DKNotNetWorkHintView.h
//  BiYongBao
//
//  Created by Gavin on 2018/8/24.
//  Copyright © 2018年 Ai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DKNotNewWorkBlock)(void);

@interface DKNotNetWorkHintView : UIView

@property (nonatomic, copy) DKNotNewWorkBlock dkNotNewWorkBlock;

@end
