//
//  DKLoginMobileV.h
//  BeelinkC
//
//  Created by Gavin on 2020/8/27.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DKLoginMobileV : UIView

@property (nonatomic,copy) void(^click)(NSInteger tag);

@end

NS_ASSUME_NONNULL_END
