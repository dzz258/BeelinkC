//
//  DKErrorHintV.m
//  DouKui
//
//  Created by Gavin on 2017/11/13.
//  Copyright © 2017年 ShenZhen GaoShengTong Computer software development Co., LTD. All rights reserved.
//

#import "DKErrorHintV.h"

@implementation DKErrorHintV

- (instancetype)initNotNetHintWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSupFrame:frame showType:dkNoInternet imageName:nil hint:nil];
    }
    return self;
}

- (instancetype)initShowHintWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSupFrame:frame showType:dkNoServer imageName:nil hint:nil];
    }
    return self;
}

- (instancetype)initShowHintWithFrame:(CGRect)frame showType:(dkNoDataType)type{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSupFrame:frame showType:type imageName:nil hint:nil];
    }
    return self;
}
- (instancetype)initShowHintWithFrame:(CGRect)frame showType:(dkNoDataType)type hintText:(NSString *)hintText{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSupFrame:frame showType:type imageName:nil hint:hintText];
    }
    return self;
}
- (instancetype)initShowFrame:(CGRect)frame showType:(dkNoDataType)type imageName:(NSString *)imageName hint:(NSString *)hint{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSupFrame:frame showType:type imageName:imageName hint:hint];
    }
    return self;
}
-(void)addSupFrame:(CGRect)frame showType:(dkNoDataType)type imageName:(NSString *)imageName hint:(NSString *)hint{
    self.backgroundColor = [UIColor whiteColor];
    UIImage *showImage = KImage(imageName);
    if (showImage == nil) {
        if (type == dkNoInternet) {
            showImage = KImage(dkNoInternetImage);
        }else if (type == dkNoServer){
            showImage = KImage(dkNoServerImage);
        }else{
            showImage = KImage(dkNoDataImage);
        }
    }
    if (hint.length == 0) {
        if (type == dkNoInternet) {
            hint = dkNoInternetHint;
        }else if (type == dkNoServer){
            hint = dkNoServerHint;
        }else{
            hint = dkNoDataHint;
        }
    }
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = showImage;
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(@(self.height*0.3));
    }];
    
    UILabel *tipLabel = [[UILabel alloc] init];
    tipLabel.textColor = color_hint_title;
    tipLabel.font = KF_H_F(15);
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.numberOfLines = 0;
    tipLabel.centerX = imageView.centerX;
    tipLabel.text = hint;
    [self addSubview:tipLabel];
    [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@kWidth_fact(20));
        make.right.equalTo(self.mas_right).offset(-kWidth_fact(20));
        make.centerX.equalTo(imageView.mas_centerX);
        make.top.equalTo(imageView.mas_bottom).offset(kWidth_fact(18));
    }];
    
    if (tipLabel.text.length == 0) {
        tipLabel.hidden = YES;
    }
    
    BOOL isCanTouch = YES;
    if (type == dkNoData) {
        isCanTouch = NO;
    }
    if (isCanTouch) {
        UIButton *btnTouchView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [btnTouchView addTarget:self action:@selector(windowTouchAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnTouchView];
    }
}
//空数据View的点击响应协议
- (void)windowTouchAction{
    if (self.dkNoDataViewBlock) {
        self.dkNoDataViewBlock();
    }
}

#pragma mark - 计算文本
/**
 *  @brief 计算文字的大小
 *
 *  @param font  字体(默认为系统字体)
 *  @param width 约束宽度
 */
- (CGSize)sizeWithString:(NSString *)string font:(UIFont *)font constrainedToWidth:(CGFloat)width
{
    UIFont *textFont = font ? font : kF_H([UIFont systemFontSize]);
    
    CGSize textSize;
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 70000
    if ([string respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName: textFont,
                                     NSParagraphStyleAttributeName: paragraph};
        textSize = [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                        options:(NSStringDrawingUsesLineFragmentOrigin |
                                                 NSStringDrawingTruncatesLastVisibleLine)
                                     attributes:attributes
                                        context:nil].size;
    } else {
        textSize = [string sizeWithFont:textFont
                      constrainedToSize:CGSizeMake(width, CGFLOAT_MAX)
                          lineBreakMode:NSLineBreakByWordWrapping];
    }
#else
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName: textFont,
                                 NSParagraphStyleAttributeName: paragraph};
    textSize = [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                    options:(NSStringDrawingUsesLineFragmentOrigin |
                                             NSStringDrawingTruncatesLastVisibleLine)
                                 attributes:attributes
                                    context:nil].size;
#endif
    
    return CGSizeMake(ceil(textSize.width), ceil(textSize.height));
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
-(void)deleteView{
    self.dkNoDataViewBlock=nil;
    [self removeFromSuperview];
}
@end
