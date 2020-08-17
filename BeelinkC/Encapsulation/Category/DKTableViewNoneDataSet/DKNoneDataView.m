//
//  DKNoneDataView.m
//  CopyrightService
//
//  Created by Gavin on 2019/10/31.
//  Copyright © 2019 Gavin. All rights reserved.
//

#import "DKNoneDataView.h"

@interface DKNoneDataView ()

@property (nonatomic, strong) UILabel *messageLabel;

@end

@implementation DKNoneDataView

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 此处添加姿势图
    }
    return self;
}

// 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.messageLabel sizeToFit];
    self.messageLabel.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
}

- (UILabel *)messageLabel
{
    if (_messageLabel == nil) {
        _messageLabel = [UILabel new];
        _messageLabel.text = @"暂无数据";
        _messageLabel.textColor = [UIColor redColor];
        _messageLabel.font = [UIFont systemFontOfSize:18];
        [self addSubview:_messageLabel];
    }
    return _messageLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
