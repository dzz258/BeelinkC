//
//  DXShareView.m
//  SharePanel
//
//  Created by dyy on 2018/1/18.
//  Copyright © 2018年 d. All rights reserved.
//

#import "DXShareView.h"
#import "DXShareButton.h"
#import "DXSharePlatform.h"

static CGFloat const DXShreButtonHeight = 90.f;
static CGFloat const DXShreButtonWith = 76.f;
static CGFloat const DXShreHeightSpace = 15.f;//竖间距
static CGFloat const DXShreCancelHeight = 40.f;

@interface DXShareView()<UIGestureRecognizerDelegate>

//底部view
@property (nonatomic,strong) UIView *bottomPopView;

@property (nonatomic,strong) NSMutableArray *platformArray;
@property (nonatomic,strong) NSMutableArray *buttonArray;
@property (nonatomic,strong) DXShareModel *shareModel;
@property (nonatomic,assign) DXShareContentType shareConentType;
@property (nonatomic,assign) CGFloat shreViewHeight;//分享视图的高度

@end

@implementation DXShareView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
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

//#pragma mark - 点击了分享按钮
-(void)clickShare:(UIButton *)sender
{
//    #warning 本人用的友盟社会化分享组件
////    [NSObject wx_shareType:WXSceneSession title:@"分享标题" desc:@"分享内容分享内容分享内容分享内容分享内容分享内容分享内容分享内容分享内容" url:@"https://www.baidu.com" img:@"Invite"];
//
//    switch (sender.tag) {
//        case DXShareTypeWechatSession://微信好友
//        {
//            [NSObject wx_shareType:WXSceneSession title:self.shareModel.title desc:self.shareModel.descr url:self.shareModel.url img:self.shareModel.thumbImage];
////            [self shareLinkToPlatform:UMSocialPlatformType_WechatSession shareConentType:self.shareConentType];
//        }
//            break;
//        case DXShareTypeWechatTimeline://微信朋友圈
//        {
//            [NSObject wx_shareType:WXSceneTimeline title:self.shareModel.title desc:self.shareModel.descr url:self.shareModel.url img:self.shareModel.thumbImage];
////            [self shareLinkToPlatform:UMSocialPlatformType_WechatTimeLine shareConentType:self.shareConentType];
//        }
//            break;
////        case DXShareTypeQQ://QQ好友
////        {
////            [self shareLinkToPlatform:UMSocialPlatformType_QQ shareConentType:self.shareConentType];
////        }
////            break;
////        case DXShareTypeQzone://QQ朋友圈
////        {
////            [self shareLinkToPlatform:UMSocialPlatformType_Qzone shareConentType:self.shareConentType];
////        }
////            break;
////        case DXShareTypeUrl://复制链接
////        {
////            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
////            pasteboard.string = self.shareConentType == DXShareContentTypeLink ? self.shareModel.url : self.shareModel.title;
////            [XHToast showBottomWithText:@"复制成功"];
////        }
////            break;
//        default:
//            break;
//    }
//    [self closeShareView];
}

#warning 以下注释代码 需导入友盟社会化分享组件
#pragma mark - 分享链接到三方平台
//-(void)shareLinkToPlatform:(UMSocialPlatformType)shareToPlatform shareConentType:(DXShareContentType)shareConentType
//{
//    switch (self.shareConentType) {
//        case DXShareContentTypeText://文本分享
//        {
//            //创建分享消息对象
//            UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
//            //设置文本
//            messageObject.text = self.shareModel.title;
//            //调用分享接口
//            [[UMSocialManager defaultManager] shareToPlatform:shareToPlatform messageObject:messageObject currentViewController:nil completion:^(id result, NSError *error) {
//                [self shareResult:result error:error];
//
//            }];
//        }
//            break;
//        case DXShareContentTypeImage://图片分享
//        {
//            //创建分享消息对象
//            UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
//
//            //创建图片内容对象
//            UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
//
//            [shareObject setShareImage:self.shareModel.thumbImage];
//
//            //分享消息对象设置分享内容对象
//            messageObject.shareObject = shareObject;
//
//            //调用分享接口
//            [[UMSocialManager defaultManager] shareToPlatform:shareToPlatform messageObject:messageObject currentViewController:nil completion:^(id result, NSError *error) {
//                [self shareResult:result error:error];
//
//            }];
//        }
//            break;
//        case DXShareContentTypeLink://链接分享
//        {
//            UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
//
//            UMShareWebpageObject *webPageObject = [UMShareWebpageObject shareObjectWithTitle:self.shareModel.title descr:self.shareModel.descr thumImage:self.shareModel.thumbImage];
//
//            webPageObject.webpageUrl = self.shareModel.url;
//            messageObject.shareObject = webPageObject;
//
//            [[UMSocialManager defaultManager] shareToPlatform:shareToPlatform messageObject:messageObject currentViewController:nil completion:^(id result, NSError *error) {
//                [self shareResult:result error:error];
//            }];
//        }
//            break;
//        default:
//            break;
//    }
//}

#pragma mark - 分享结果处理
//-(void)shareResult:(id)result error:(NSError*)error
//{
//    if (!error) {
////        [XHToast showBottomWithText:@"分享成功"];
//    }
//    else
//    {
////        [XHToast showBottomWithText:@"分享失败"];
//    }
//}

-(UIView *)bottomPopView
{
    if (_bottomPopView == nil) {
        _bottomPopView = [[UIView alloc] initWithFrame:CGRectMake(0, KScreen_Height, KScreen_Width, self.shreViewHeight)];
//        _bottomPopView.backgroundColor = color_view_bg;
    }
    return _bottomPopView;
}

-(void)showShareViewWithDXShareModel:(DXShareModel*)shareModel shareContentType:(DXShareContentType)shareContentType
{
    self.shareModel = shareModel;
    self.shareConentType = shareContentType;
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = [UIColor clearColor];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:.3f animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.4f];
        self.bottomPopView.frame = CGRectMake(0, KScreen_Height - self.shreViewHeight, KScreen_Width, self.shreViewHeight);
    }];
}

#pragma mark - 点击背景关闭视图
-(void)closeShareView
{
    [UIView animateWithDuration:.3f animations:^{
        self.backgroundColor = [UIColor clearColor];
        self.bottomPopView.frame = CGRectMake(0, KScreen_Height, KScreen_Width, self.shreViewHeight);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
#pragma  mark UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    
    if ([touch.view isDescendantOfView:self.bottomPopView]) {
        return NO;
    }
    return YES;
}

#pragma mark 设置平台
-(void)setUpPlatformsItems
{
#warning 防止审核失败 最好要先判断是否已安装微信、QQ 或其他平台的App
    //微信好友
//    if ([[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_WechatSession]) {
        DXSharePlatform *wechatSessionModel = [[DXSharePlatform alloc] init];
        wechatSessionModel.iconStateNormal = @"weixin_allshare";
        wechatSessionModel.iconStateHighlighted = @"weixin_allshare_night";
        wechatSessionModel.sharePlatform = DXShareTypeWechatSession;
        wechatSessionModel.name = @"微信好友";
        [self.platformArray addObject:wechatSessionModel];

//    }
    
    
    
    //微信朋友圈
//    if ([[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_WechatTimeLine]) {
        DXSharePlatform *wechatTimeLineModel = [[DXSharePlatform alloc] init];
        wechatTimeLineModel.iconStateNormal = @"pyq_allshare";
        wechatTimeLineModel.iconStateHighlighted = @"pyq_allshare_night";
        wechatTimeLineModel.sharePlatform = DXShareTypeWechatTimeline;
        wechatTimeLineModel.name = @"微信朋友圈";
        [self.platformArray addObject:wechatTimeLineModel];
//    }
    
    //QQ好友
//    if ([[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_QQ]) {
//        DXSharePlatform *qqModel = [[DXSharePlatform alloc] init];
//        qqModel.iconStateNormal = @"qq_allshare";
//        qqModel.iconStateHighlighted = @"qq_allshare_night";
//        qqModel.sharePlatform = DXShareTypeQQ;
//        qqModel.name = @"QQ好友";
//        [self.platformArray addObject:qqModel];
//    }
    
    //QQ空间
//    if ([[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_Qzone]) {
//        DXSharePlatform *qqZone = [[DXSharePlatform alloc] init];
//        qqZone.iconStateNormal = @"qqzone_allshare";
//        qqZone.iconStateHighlighted = @"qqzone_allshare_night";
//        qqZone.sharePlatform = DXShareTypeQzone;
//        qqZone.name = @"QQ空间";
//        [self.platformArray addObject:qqZone];
//    }
    
    //复制链接
//    if (self.shareConentType != DXShareContentTypeImage) {
//        DXSharePlatform *urlModel = [[DXSharePlatform alloc] init];
//        urlModel.iconStateNormal = @"link_allshare";
//        urlModel.iconStateHighlighted = @"link_allshare_night";
//        urlModel.sharePlatform = DXShareTypeUrl;
//        urlModel.name = @"复制链接";
//        [self.platformArray addObject:urlModel];
//    }
 
}

@end
