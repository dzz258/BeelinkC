//
//  UIViewController+PopoutProcess.h
//  dingdonghuigou
//
//  Created by Gavin on 2018/12/21.
//  Copyright © 2018 bei jing you ji. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ResultCodeBlock)(BOOL isSuccess, BOOL isDelete);

@interface UIViewController (PopoutProcess)

-(void)replayCode:(ResultCodeBlock)resultCodeBlock;
-(void)nextCode:(NSString *)codes result:(ResultCodeBlock)resultCodeBlock;

@end

NS_ASSUME_NONNULL_END
