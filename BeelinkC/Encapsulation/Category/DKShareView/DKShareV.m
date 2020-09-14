//
//  DKShareV.m
//  BeelinkC
//
//  Created by Gavin on 2020/9/14.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKShareV.h"

@interface DKShareV()
@property (nonatomic,strong) DKShareModel *shareModel;
//底部view
@property (nonatomic,strong) UIView *bottomPopView;
@property (nonatomic,strong) NSMutableArray *platformArray;
@property (nonatomic,strong) NSMutableArray *buttonArray;
@property (nonatomic,assign) DXShareContentType shareConentType;
@property (nonatomic,assign) CGFloat shreViewHeight;//分享视图的高度

@end

@implementation DKShareV

-(instancetype)initModel:(DKShareModel *)shareModel{
//- (instancetype)initWithFrame:(CGRect)frame {
    self = [super init];
    if (self) {
        self.platformArray = [NSMutableArray array];
        self.buttonArray = [NSMutableArray array];
        //初始化分享平台
        [self setUpPlatformsItems];
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] init];
        tapGestureRecognizer.delegate = self;
        [tapGestureRecognizer addTarget:self action:@selector(closeShareView)];
        
        [self addGestureRecognizer:tapGestureRecognizer];
        
        //计算分享视图的总高度
        self.shreViewHeight = DXShreHeightSpace *(self.platformArray.count /4 + 2) + DXShreButtonHeight * (self.platformArray.count /4 + 1) + DXShreCancelHeight+kXoffsetHeight;
        
        int columnCount=4;
        //计算间隙
        CGFloat appMargin=(KScreen_Width-columnCount*DXShreButtonWith)/(columnCount+1);
        
        for (int i=0; i<self.platformArray.count; i++) {
            DXSharePlatform *platform = self.platformArray[i];
            //计算列号和行号
            int colX=i%columnCount;
            int rowY=i/columnCount;
            //计算坐标
            CGFloat buttonX = appMargin+colX*(DXShreButtonWith+appMargin);
            CGFloat buttonY = DXShreHeightSpace+rowY*(DXShreButtonHeight+DXShreHeightSpace);
            DXShareButton *shareBut = [[DXShareButton alloc] init];
            [shareBut setTitle:platform.name forState:UIControlStateNormal];
            [shareBut setImage:[UIImage imageNamed:platform.iconStateNormal] forState:UIControlStateNormal];
            [shareBut setImage:[UIImage imageNamed:platform.iconStateHighlighted] forState:UIControlStateHighlighted];
            shareBut.frame = CGRectMake(10, 10, 76, 90);
            [shareBut addTarget:self action:@selector(clickShare:) forControlEvents:UIControlEventTouchUpInside];
            shareBut.tag = platform.sharePlatform;//这句话必须写！！！
            [self.bottomPopView addSubview:shareBut];
            shareBut.frame = CGRectMake(buttonX, buttonY, DXShreButtonWith, DXShreButtonHeight);
            [self.bottomPopView addSubview:shareBut];
            [self.buttonArray addObject:shareBut];
            
        }
        
        //按钮动画
        for (DXShareButton *button in self.buttonArray) {
            NSInteger idx = [self.buttonArray indexOfObject:button];
            
            CGAffineTransform fromTransform = CGAffineTransformMakeTranslation(0, 50);
            button.transform = fromTransform;
            button.alpha = 0.3;
            
            [UIView animateWithDuration:0.9+idx*0.1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1.f options:UIViewAnimationOptionCurveEaseInOut animations:^{

                button.transform = CGAffineTransformIdentity;
                button.alpha = 1;
            } completion:^(BOOL finished) {
                
            }];
        }
        
        UIView *lineV = [[UIView alloc] initWithFrame:CGRectMake(0, self.shreViewHeight - DXShreCancelHeight-kXoffsetHeight-1, KScreen_Width, 1)];
//        lineV.backgroundColor = color_nav_line;
        [self.bottomPopView addSubview:lineV];
        
        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [cancelButton setFrame:CGRectMake(0, self.shreViewHeight - DXShreCancelHeight-kXoffsetHeight, KScreen_Width, DXShreCancelHeight)];
        [cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        cancelButton.backgroundColor = color_view_bg;
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        cancelButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [cancelButton addTarget:self action:@selector(closeShareView) forControlEvents:UIControlEventTouchUpInside];
        [self.bottomPopView addSubview:cancelButton];
        
        [self addSubview:self.bottomPopView];

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
