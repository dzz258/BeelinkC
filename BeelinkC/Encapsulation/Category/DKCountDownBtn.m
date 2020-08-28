//
//  DKCountDownBtn.m
//  BeelinkC
//
//  Created by Gavin on 2020/8/28.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKCountDownBtn.h"

//默认的倒计时60s
static const NSInteger DefaultCount = 10;

//默认字体颜色
#define  DefaultFontColor color_cyan9
#define  HighlightedColor color_gray8

@interface DKCountDownBtn()
//计时器
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,strong)NSDate *startDate;
@end

@implementation DKCountDownBtn

-(instancetype)init{
    if (self = [super init]) {
        _count = DefaultCount;
        [self addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        [self setTitleColor:DefaultFontColor forState:UIControlStateNormal];
        [self setTitle:kLocal_text(@"login_btn_verifycode") forState:UIControlStateNormal];
        
    }
    return self;
}

-(void)setCount:(NSInteger)count{
    _count = count;
}

-(void)timerStart:(NSTimer *)timer{
    double deltaTime = [[NSDate date] timeIntervalSinceDate:self.startDate];
    NSInteger second= self.count - (NSInteger)(deltaTime+0.5) ;
    if (second <= 0) {
        [self stop];
    }else{
        [self setTitle:[NSString stringWithFormat:@"%02lds",second] forState:UIControlStateNormal];
    }
}

-(void)click{
    if (self.clickBlock) {
        self.clickBlock(self);
    }
}
-(void)refresh{
    self.userInteractionEnabled = YES;
    if (_timer) {
        [_timer invalidate]; //停止计时器
        _timer = nil;
        [self setTitle:kLocal_text(@"login_btn_verifycode") forState:UIControlStateNormal];
    }
    [self setTitleColor:DefaultFontColor forState:UIControlStateNormal];
}
-(void)start{
    _startDate = [NSDate date];
    self.userInteractionEnabled = NO;
    [self setTitle:[NSString stringWithFormat:@"%02lds",_count] forState:UIControlStateNormal];
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerStart:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    [self setTitleColor:HighlightedColor forState:UIControlStateNormal];
}
-(void)stop{
    self.userInteractionEnabled = YES;
    if (_timer) {
        [_timer invalidate]; //停止计时器
        _timer = nil;
        [self setTitle:kLocal_text(@"login_btn_againcode") forState:UIControlStateNormal];
    }
    if (self.completeBlock) {
        self.completeBlock(self);
    }
    [self setTitleColor:DefaultFontColor forState:UIControlStateNormal];
}

-(void)dealloc{  //销毁计时器
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
