//
//  DKNotNetWorkHintViewController.m
//  BiYongBao
//
//  Created by Gavin on 2018/8/24.
//  Copyright © 2018年 Ai. All rights reserved.
//

#import "DKNotNetWorkHintViewController.h"

@interface DKNotNetWorkHintViewController ()

@end

@implementation DKNotNetWorkHintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"未能链接到互联网";
    self.view.backgroundColor=kColor_hex(@"#f5f5f5");
    [self addLeftBarButtonItemWithTitle:@"返回" action:@selector(back)];
    
    UIScrollView *scrollV=[[UIScrollView alloc] init];
    scrollV.bounces = NO;
    //    scrollV.delegate = self;
    //    scrollV.pagingEnabled = YES;
    scrollV.showsVerticalScrollIndicator = NO;
    scrollV.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollV];
    [scrollV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.right.equalTo(self.view);
    }];
    
    
    UIView *headerV=[[UIView alloc] init];
    headerV.backgroundColor=kColor_hex(@"#f5f5f5");
    [scrollV addSubview:headerV];
    
    [headerV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@0);
        make.width.equalTo(@KScreen_Width);
        make.height.equalTo(@76.5);
    }];
    
    UIView *inputBgV=[[UIView alloc] init];
    inputBgV.backgroundColor=[UIColor whiteColor];
    [headerV addSubview:inputBgV];
    [inputBgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.width.equalTo(@KScreen_Width);
        make.top.equalTo(@10);
        make.bottom.equalTo(headerV.mas_bottom).offset(-5);
    }];
    
    UIView *textBgV=[[UIView alloc] init];
    textBgV.backgroundColor=kColor_hex(@"#f5f5f5");
    textBgV.layer.cornerRadius=5;
    textBgV.layer.borderWidth=0.5;
    textBgV.layer.borderColor=kColor_hex(@"#eeeeee").CGColor;
    [inputBgV addSubview:textBgV];
    
    UILabel *hintL=[[UILabel alloc] init];
    hintL.font=[UIFont systemFontOfSize:15];
    hintL.text=@"您的设备未启用移动网络或无线局域网";
    hintL.textColor=kColor_hex(@"#666666");
    [textBgV addSubview:hintL];
    
    
    [textBgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.top.equalTo(@12);
        make.bottom.equalTo(inputBgV.mas_bottom).offset(-13);
        make.right.equalTo(hintL.mas_right).offset(20);
    }];
    
    [hintL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@11);
        make.top.equalTo(@0);
        make.bottom.equalTo(textBgV.mas_bottom);
    }];
    
    UIImageView *imageV=[[UIImageView alloc] init];
    imageV.image=[UIImage imageNamed:@"receiveCandy_explain"];
    [scrollV addSubview:imageV];
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(headerV.mas_bottom);
        make.left.equalTo(textBgV.mas_left).offset(10);
        make.width.equalTo(@22);
        make.height.equalTo(@11);
    }];
    
    UIView *descriptionV=[[UIView alloc]init];
    descriptionV.backgroundColor=[UIColor whiteColor];
    [scrollV addSubview:descriptionV];
    
    UILabel *titleL1=[[UILabel alloc]init];
    titleL1.text=@"如需要连接到互联网，请参考以下方法：";
    titleL1.numberOfLines=0;
    titleL1.font=[UIFont boldSystemFontOfSize:14];
    titleL1.textColor=kColor_hex(@"#666666");
    [descriptionV addSubview:titleL1];
    [titleL1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.top.equalTo(@26);
    }];
    
    UILabel *textL1=[[UILabel alloc] init];
    textL1.text=@" • 检查手机中的“设置-无线局域网”是否开启，选择一个可用的网络接入。\n • 检查手机中的“设置-蜂窝移动网络”是否开启，并且手机没有被停机（ 启用蜂窝移动网络后运营商可能会收取数据通讯费用）。";
    textL1.font=[UIFont systemFontOfSize:12];
    textL1.numberOfLines=0;
    textL1.textColor=kColor_hex(@"#8e8e8e");
    [descriptionV addSubview:textL1];
    
    NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc] initWithString:textL1.text];
    NSMutableParagraphStyle *paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:7];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [textL1.text length])];
    NSRange range1 = [textL1.text rangeOfString:@"“设置-无线局域网”"];
    NSRange range2 = [textL1.text rangeOfString:@"“设置-蜂窝移动网络”"];
    [attributedString1 addAttribute:NSForegroundColorAttributeName value:kColor_hex(@"#f3ae3e") range:range1];
    [attributedString1 addAttribute:NSForegroundColorAttributeName value:kColor_hex(@"#f3ae3e") range:range2];
    textL1.attributedText=attributedString1;
    
    [textL1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleL1.mas_left);
        make.right.equalTo(descriptionV.mas_right).offset(-10);
        make.top.equalTo(titleL1.mas_bottom).offset(11);
    }];
    
    UILabel *titleL2=[[UILabel alloc]init];
    titleL2.text=@"如果你已接入无线局域网：";
    titleL2.numberOfLines=0;
    titleL2.font=[UIFont boldSystemFontOfSize:14];
    titleL2.textColor=kColor_hex(@"#666666");
    [descriptionV addSubview:titleL2];
    [titleL2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.top.equalTo(textL1.mas_bottom).offset(26);
    }];
    
    UILabel *textL2=[[UILabel alloc] init];
    textL2.text=@" • 请检查你所连接的无线局域网热点是否已接入互联网 ，或该热点是否已允许你的设备访问互联网。";
    textL2.font=[UIFont systemFontOfSize:12];
    textL2.numberOfLines=0;
    textL2.textColor=kColor_hex(@"#8e8e8e");
    [descriptionV addSubview:textL2];
    
    NSMutableAttributedString *attributedString2 = [[NSMutableAttributedString alloc] initWithString:textL2.text];
    NSMutableParagraphStyle *paragraphStyle2 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle2 setLineSpacing:7];
    [attributedString2 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle2 range:NSMakeRange(0, [textL2.text length])];
    NSRange range1_1 = [textL2.text rangeOfString:@"是否已接入互联网"];
    [attributedString2 addAttribute:NSForegroundColorAttributeName value:kColor_hex(@"#f3ae3e") range:range1_1];
    textL2.attributedText=attributedString2;
    
    [textL2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleL2.mas_left);
        make.right.equalTo(descriptionV.mas_right).offset(-10);
        make.top.equalTo(titleL2.mas_bottom).offset(11);
    }];
    
    UILabel *titleL3=[[UILabel alloc]init];
    titleL3.text=@"如果你的手机是iOS 10.x版本的系统：";
    titleL3.numberOfLines=0;
    titleL3.font=[UIFont boldSystemFontOfSize:14];
    titleL3.textColor=kColor_hex(@"#666666");
    [descriptionV addSubview:titleL3];
    [titleL3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.top.equalTo(textL2.mas_bottom).offset(26);
    }];
    
    UILabel *textL3=[[UILabel alloc] init];
    textL3.text=@" • 可以尝试到“设置-蜂窝移动网络-无线局域网助理”里 ，主动切换下无线局域网助理的开关后， 再检查APP是否可以正常访问网络。";
    textL3.font=[UIFont systemFontOfSize:12];
    textL3.numberOfLines=0;
    textL3.textColor=kColor_hex(@"#8e8e8e");
    [descriptionV addSubview:textL3];
    
    NSMutableAttributedString *attributedString3 = [[NSMutableAttributedString alloc] initWithString:textL3.text];
    NSMutableParagraphStyle *paragraphStyle3 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle3 setLineSpacing:7];
    [attributedString3 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle3 range:NSMakeRange(0, [textL3.text length])];
    NSRange range1_3 = [textL3.text rangeOfString:@"“设置-蜂窝移动网络-无线局域网助理”"];
    [attributedString3 addAttribute:NSForegroundColorAttributeName value:kColor_hex(@"#f3ae3e") range:range1_3];
    textL3.attributedText=attributedString3;
    
    [textL3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleL3.mas_left);
        make.right.equalTo(descriptionV.mas_right).offset(-10);
        make.top.equalTo(titleL3.mas_bottom).offset(11);
    }];
    
    [descriptionV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headerV.mas_bottom);
        make.left.equalTo(@0);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(textL3.mas_bottom).offset(16);
    }];
    
//    scrollV.contentSize = CGSizeMake(KScreenWidth, descriptionV.);

}
-(void)back{
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
