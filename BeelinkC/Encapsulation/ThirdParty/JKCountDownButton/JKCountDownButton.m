//
//  JKCountDownButton.m
//  JKCountDownButton
//
//  Created by Jakey on 15/3/8.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "JKCountDownButton.h"
@interface JKCountDownButton(){
    
    NSTimer *_timer;
    NSDate *_startDate;
    
//    CountDownChanging _countDownChanging;
//    CountDownFinished _countDownFinished;
//    TouchedCountDownButtonHandler _touchedCountDownButtonHandler;
}
@property(nonatomic,assign) NSInteger second;
@property(nonatomic,assign) NSUInteger totalSecond;
@property(nonatomic,copy) TouchedCountDownButtonHandler touchedCountDownButtonHandler;
@property(nonatomic,copy) CountDownChanging countDownChanging;
@property(nonatomic,copy) CountDownFinished countDownFinished;

@end

@implementation JKCountDownButton
#pragma -mark touche action
- (void)countDownButtonHandler:(TouchedCountDownButtonHandler)touchedCountDownButtonHandler{
    _touchedCountDownButtonHandler = [touchedCountDownButtonHandler copy];
    [self addTarget:self action:@selector(touched:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)touched:(JKCountDownButton*)sender{
    if (_touchedCountDownButtonHandler) {
        __weak typeof(self) weakself = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            weakself.touchedCountDownButtonHandler(sender,sender.tag);
        });
    }
}

#pragma -mark count down method
- (void)startCountDownWithSecond:(NSUInteger)totalSecond
{
    _totalSecond = totalSecond;
    _second = totalSecond;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerStart:) userInfo:nil repeats:YES];
    _startDate = [NSDate date];
    _timer.fireDate = [NSDate distantPast];
    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
}
- (void)timerStart:(NSTimer *)theTimer {
     double deltaTime = [[NSDate date] timeIntervalSinceDate:_startDate];
    
     _second = _totalSecond - (NSInteger)(deltaTime+0.5) ;

    
    if (_second< 0.0)
    {
        [self stopCountDown];
    }
    else
    {
        if (_countDownChanging)
        {
            __weak typeof(self) weakself = self;
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakself setTitle:weakself.countDownChanging(weakself,weakself.second) forState:UIControlStateNormal];
                [weakself setTitle:weakself.countDownChanging(weakself,weakself.second) forState:UIControlStateDisabled];
            });
        }
        else
        {
            NSString *title = [NSString stringWithFormat:@"%zd秒",_second];
            [self setTitle:title forState:UIControlStateNormal];
            [self setTitle:title forState:UIControlStateDisabled];

        }
    }
}

- (void)stopCountDown{
    if (_timer) {
        if ([_timer respondsToSelector:@selector(isValid)])
        {
            if ([_timer isValid])
            {
                [_timer invalidate];
                _second = _totalSecond;
                if (_countDownFinished)
                {
                    __weak typeof(self) weakself = self;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [weakself setTitle:weakself.countDownFinished(weakself,weakself.totalSecond)forState:UIControlStateNormal];
                        [weakself setTitle:weakself.countDownFinished(weakself,weakself.totalSecond)forState:UIControlStateDisabled];
                    });
                }
                else
                {
                    [self setTitle:@"重新发送" forState:UIControlStateNormal];
                    [self setTitle:@"重新发送" forState:UIControlStateDisabled];

                }
            }
        }
    }
}
-(void)destroyCountDown{
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer =nil;
    NSLog(@"销毁");
}
#pragma -mark block
- (void)countDownChanging:(CountDownChanging)countDownChanging{
    _countDownChanging = [countDownChanging copy];
}
- (void)countDownFinished:(CountDownFinished)countDownFinished{
    _countDownFinished = [countDownFinished copy];
}
@end
