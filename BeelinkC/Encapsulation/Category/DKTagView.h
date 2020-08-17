//
//  DKTagView.h
//  ldsapp
//
//  Created by Gavin on 2020/8/15.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DKTagViewDelegate <NSObject>

@optional

-(void)handleSelectTag:(NSInteger)tag keyWord:(NSString *)keyWord;

@end

@interface DKTagView : UIView

@property (nonatomic ,weak)id <DKTagViewDelegate>delegate;

@property (nonatomic ,strong)NSArray * arr;

@property (nonatomic, assign) NSInteger currentTag;

@end

NS_ASSUME_NONNULL_END
