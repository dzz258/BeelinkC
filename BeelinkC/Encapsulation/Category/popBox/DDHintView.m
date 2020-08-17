//
//  DDHintView.m
//  dingdonghuigou
//
//  Created by Gavin on 2018/12/24.
//  Copyright © 2018 bei jing you ji. All rights reserved.
//

#import "DDHintView.h"
#import "UILabel+ChangeLineSpaceAndWordSpace.h"

@interface DDHintView()

@property (nonatomic, strong) UILabel *titleL , *contentTitleL , *hintL;
@property (nonatomic, strong)  UIButton *confirmBtn;
@property (nonatomic, strong)  UIButton *cancelBtn;
@property (nonatomic, copy) NSDictionary *dict;
@end

@implementation DDHintView
/**
 dict 参数代表含义
 {
 title : 标题 （默认 温馨提示）
 content: 描述内容  必填
 hint : 除描述内容外的提示内容 默认 无  type 为 1、3时，该参数必填
 cancel : 取消按钮文字 默认 取消
 confirm : 确定按钮 默认 确定
 type  ：弹框类型 （ 0 默认 取消、确定按钮、无hintL内容；1 取消、确定按钮、带hintL内容；2、确定按钮、无hintL内容；3、确定按钮、带hintL内容）

 }
 */
-(instancetype)initDict:(NSDictionary *)dict{
    if (self) {
        self = [super init];
        _dict = dict;
        self.frame = CGRectMake(0, 0, KScreen_Width-100, 400);
        self.backgroundColor = [UIColor whiteColor];
        [self createrUI];
    }
    return self;
}
-(void)createrUI{
    [self addSubview:self.titleL];
    [self addSubview:self.contentTitleL];
    [self addSubview:self.hintL];
    [self addSubview:self.confirmBtn];
    [self addSubview:self.cancelBtn];
    self.titleL.frame = CGRectMake(0, 10, self.width,20);
    self.contentTitleL.frame = CGRectMake(20, self.titleL.bottom+15, self.width-40, 20);
    
    [self.contentTitleL sizeToFit];
    self.contentTitleL.frame = CGRectMake(self.contentTitleL.left, self.contentTitleL.top, self.width-40, self.contentTitleL.height);
    
    if ([self.dict[@"type"] integerValue] == 1 || [self.dict[@"type"] integerValue] == 3) {
        self.hintL.frame = CGRectMake(self.contentTitleL.left, self.contentTitleL.bottom+15, self.width-40, 20);
        [self.hintL sizeToFit];
        self.hintL.frame = CGRectMake(self.hintL.left, self.hintL.top, self.width-40, self.hintL.height);
    }else{
        self.hintL.frame = CGRectMake(self.contentTitleL.left, self.contentTitleL.bottom, self.width-40, 0);
    }
    
    
    if ([self.dict[@"type"] integerValue] == 2 || [self.dict[@"type"] integerValue] == 3) {
        self.confirmBtn.frame = CGRectMake(0, self.hintL.bottom+20, self.width, 40);
    }else{
        self.cancelBtn.frame = CGRectMake(0, self.hintL.bottom+20, self.width*0.5, 40);
        self.confirmBtn.frame = CGRectMake(self.cancelBtn.right, self.cancelBtn.top, self.cancelBtn.width, self.cancelBtn.height);
    }
    self.frame = CGRectMake(0, 0, self.width, self.confirmBtn.bottom);
}
-(UILabel *)titleL{
    if (!_titleL) {
        _titleL = [[UILabel alloc] init];
        if (kNull_str(self.dict[@"title"])) {
            _titleL.text = @"温馨提示";
        }else{
            _titleL.text = self.dict[@"title"];
        }
        _titleL.textColor = [UIColor blackColor];
        _titleL.font = kF_BH(16);
        [UILabel changeWordSpaceForLabel:_titleL WithSpace:3];
        _titleL.textAlignment = NSTextAlignmentCenter;
    }
    return _titleL;
}

-(UILabel *)contentTitleL{
    if (!_contentTitleL) {
        _contentTitleL = [[UILabel alloc] init];
        _contentTitleL.text = [NSString null_str:self.dict[@"content"]];
        _contentTitleL.numberOfLines = 0;
        _contentTitleL.textColor = [UIColor blackColor];
        _contentTitleL.font = kF_H(13);
        [UILabel changeLineSpaceForLabel:_contentTitleL WithSpace:5];
        _contentTitleL.textAlignment = NSTextAlignmentCenter;
    }
    return _contentTitleL;
}

-(UILabel *)hintL{
    if (!_hintL) {
        _hintL = [[UILabel alloc] init];
        _hintL.text = [NSString null_str:self.dict[@"hint"]];
        _hintL.numberOfLines = 0;
        _hintL.textColor = [UIColor redColor];
        _hintL.font = kF_H(12);
        [UILabel changeLineSpaceForLabel:_hintL WithSpace:3];
        _hintL.textAlignment = NSTextAlignmentCenter;
        if ([self.dict[@"type"] integerValue] == 1|| [self.dict[@"type"] integerValue] == 3) {
            _hintL.hidden = NO;
        }else{
            _hintL.hidden = YES;
        }
    }
    return _hintL;
}
-(UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        if (kNull_str(self.dict[@"cancel"])) {
            [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        }else{
            [_cancelBtn setTitle:self.dict[@"cancel"] forState:UIControlStateNormal];
        }
        if ([self.dict[@"type"] integerValue] == 1|| [self.dict[@"type"] integerValue] == 3) {
            _hintL.hidden = NO;
        }else{
            _hintL.hidden = YES;
        }

        _cancelBtn.titleLabel.font = kF_H(15);
        [_cancelBtn setBackgroundColor:color_main_red];
        @weakify(self)
        [[_cancelBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            @strongify(self)
            if (self.deleteBlock) {
                self.deleteBlock();
            }
        }];
    }
    return _cancelBtn;
}

-(UIButton *)confirmBtn{
    if (!_confirmBtn) {
        _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        if (kNull_str(self.dict[@"confirm"])) {
            [_confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        }else{
            [_confirmBtn setTitle:self.dict[@"confirm"] forState:UIControlStateNormal];
        }
        [_confirmBtn setBackgroundColor:color_btn_bg];
        _confirmBtn.titleLabel.font = kF_H(15);
        @weakify(self)
        [[_confirmBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            @strongify(self)
            if (self.confirmBlock) {
                self.confirmBlock();
            }
        }];
    }
    return _confirmBtn;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
