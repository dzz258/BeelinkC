//
//  DKBaseModel.h
//  ldsapp
//
//  Created by Gavin on 2020/3/22.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DKBaseModel : NSObject

@property (nonatomic, assign) NSInteger error_code;

@property (nonatomic, copy) NSString *error_msg;

@end

NS_ASSUME_NONNULL_END
