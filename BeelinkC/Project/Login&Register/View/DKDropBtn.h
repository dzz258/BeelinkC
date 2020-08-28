//
//  DKDropBtn.h
//  BeelinkC
//
//  Created by Gavin on 2020/8/28.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DKDropBtn : UIButton

@property (nonatomic,strong)UILabel *titleL;
@property (nonatomic,strong)UILabel *subTitleL;
@property (nonatomic,strong)UIImageView *imageV;

@property (nonatomic,copy) void(^arrowBtnClick)(void);

@end

NS_ASSUME_NONNULL_END
