//
//  DKTagView.m
//  ldsapp
//
//  Created by Gavin on 2020/8/15.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKTagView.h"

@implementation DKTagView

-(void)setArr:(NSArray *)arr{
    _arr = arr;
    CGFloat marginX = 15;
    CGFloat marginY = 10;
    CGFloat height = 28;
    UIButton * markBtn;
    for (int i = 0; i < _arr.count; i++) {
        CGFloat width =  [self calculateString:_arr[i] Width:KF_H_F(15)] +20;
        UIButton * tagBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        tagBtn.tag = i;
        if (!markBtn) {
            tagBtn.frame = CGRectMake(marginX, marginY, width, height);
        }else{
            if (markBtn.frame.origin.x + markBtn.frame.size.width + marginX + width + marginX > KScreen_Width) {
                tagBtn.frame = CGRectMake(marginX, markBtn.frame.origin.y + markBtn.frame.size.height + marginY, width, height);
            }else{
                tagBtn.frame = CGRectMake(markBtn.frame.origin.x + markBtn.frame.size.width + marginX, markBtn.frame.origin.y, width, height);
            }
        }
        [tagBtn setTitle:_arr[i] forState:UIControlStateNormal];
        tagBtn.titleLabel.font = KF_H_F(15);
        [tagBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        kRadius_WC(tagBtn, kWidth_fact(2), kWidth_fact(0.5), kColor_hex(@"#999999"));
//        [self makeCornerRadius:2 borderColor:[UIColor blackColor] layer:tagBtn.layer borderWidth:.5];
        markBtn = tagBtn;
        
        [tagBtn addTarget:self action:@selector(clickTo:) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:markBtn];
    }
    CGRect rect = self.frame;
    rect.size.height = markBtn.frame.origin.y + markBtn.frame.size.height + marginY;
    NSLog(@"%@",NSStringFromCGRect(rect));
    self.frame = rect;
}

-(void)setCurrentTag:(NSInteger)currentTag{
    _currentTag = currentTag;
    UIButton *btn = [self viewWithTag:currentTag];
    [btn setTitleColor:kColor_hex(@"#b73527") forState:UIControlStateNormal];
}
-(void)clickTo:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(handleSelectTag:keyWord:)]) {
        [self.delegate handleSelectTag:sender.tag keyWord:sender.titleLabel.text];
    }
}

//-(void)makeCornerRadius:(CGFloat)radius borderColor:(UIColor *)borderColor layer:(CALayer *)layer borderWidth:(CGFloat)borderWidth{
//    layer.cornerRadius = radius;
//    layer.masksToBounds = YES;
//    layer.borderColor = borderColor.CGColor;
//    layer.borderWidth = borderWidth;
//}

-(CGFloat)calculateString:(NSString *)str Width:(UIFont *)font{
    CGSize size = [str boundingRectWithSize:CGSizeMake(KScreen_Width, 100000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
    return size.width;
}

@end
