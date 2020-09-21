//
//  DKTeacherInfoViewController.m
//  BeelinkC
//
//  Created by Gavin on 2020/9/16.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKTeacherInfoViewController.h"
#import "DKTeacherInfoStyle1TableViewCell.h"
#import "DKTeacherInfoStyle2TableViewCell.h"
#import "DKTeacherInfoStyle3TableViewCell.h"
#import "DKTeacherInfoStyle4TableViewCell.h"
#import "DKTeacherInfoHeaderView.h"

@interface DKTeacherInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) DKTeacherInfoHeaderView *headerV;
@property (nonatomic, strong) UIView *navV;
@end

@implementation DKTeacherInfoViewController

-(DKTeacherInfoHeaderView *)headerV{
    if (!_headerV) {
        _headerV = [[DKTeacherInfoHeaderView alloc] init];
//        _headerV.backgroundColor = [UIColor blueColor];
    }
    return _headerV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (@available(iOS 11.0, *)) {
        self.superTableV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}
-(void)_addSubviews{
    self.superTableV.delegate = self;
    self.superTableV.dataSource = self;
//    self.superTableV.backgroundColor = [UIColor yellowColor];
    self.superTableV.tableHeaderView = self.headerV;
    [self.view addSubview:self.superTableV];
    
    [self.superTableV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.offset(0);
        make.right.equalTo(self.view.mas_right);
        make.height.offset(KScreen_Height);
    }];
    
    UIView *navV = [[UIView alloc] init];
    navV.alpha = 0;
    navV.backgroundColor = color_white10;
    [self.view addSubview:navV];
    self.navV = navV;
    
    [navV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.offset(kTopHeight);
    }];
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:KImage(@"nav_back_black") forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBtn];
    [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.width.offset(50);
        make.height.offset(44);
        make.bottom.equalTo(navV.mas_bottom);
    }];
}
#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section < 2) {
        return 1;
    }
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return kWidth_fact(150);
    }
    if (indexPath.section == 1) {
        return kWidth_fact(140);
    }
    return kWidth_fact(157);
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return kWidth_fact(45);
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *groupV = [[UIView alloc] init];
//    groupV.backgroundColor = [UIColor blueColor];
    if (section == 0) {
        UIView *lineV = [[UIView alloc] init];
        lineV.backgroundColor = color_gray3;
        [groupV addSubview:lineV];
        [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.offset(0);
            make.height.offset(kWidth_fact(5));
        }];
    }
    UILabel *titleL = [[UILabel alloc] init];
    titleL.text = @"老师评分（9.3分）";
    titleL.font = KF_BH_F(16);
    titleL.textColor = color_black8;
    [groupV addSubview:titleL];
    [titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(kWidth_fact(15));
        make.top.offset(20);
        make.height.offset(kWidth_fact(16));
    }];
    return groupV;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    kWeakSelf(self);
    if (indexPath.section == 0) {
        DKTeacherInfoStyle1TableViewCell *cell = [DKTeacherInfoStyle1TableViewCell cellFromTableView:tableView];
        return cell;
    }
    if (indexPath.section == 1) {
        DKTeacherInfoStyle2TableViewCell *cell = [DKTeacherInfoStyle2TableViewCell cellFromTableView:tableView];
        return cell;
    }
    DKTeacherInfoStyle3TableViewCell *cell = [DKTeacherInfoStyle3TableViewCell cellFromTableView:tableView];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"%f",scrollView.contentOffset.y);
    CGFloat offSetY = scrollView.contentOffset.y;
        if (offSetY>0) {
            if (kTopHeight<= offSetY) {
                self.navV.alpha = 1;
            }else{
                self.navV.alpha = offSetY/kTopHeight;
            }
        }else{
            self.navV.alpha = 0;
        }
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
