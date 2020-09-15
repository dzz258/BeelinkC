//
//  DKShareButton.m
//  BeelinkC
//
//  Created by Gavin on 2020/9/15.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKShareButton.h"

@implementation DKShareButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.font = KF_H_F(11);
        [self setTitleColor:color_gray75 forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    CGRect retValue = CGRectMake(kWidth_fact(5),self.frame.size.height-kWidth_fact(11),self.frame.size.width-kWidth_fact(10),kWidth_fact(10));
    return retValue;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGRect retValue = CGRectMake(self.frame.size.width*0.5 - kWidth_fact(25),0,kWidth_fact(50),kWidth_fact(50));
    return retValue;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
