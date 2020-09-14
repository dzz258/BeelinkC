//
//  DKLiveListVC.m
//  BeelinkC
//
//  Created by Gavin on 2020/9/13.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKLiveListVC.h"
#import "DKLiveTableViewCell.h"

@interface DKLiveListVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation DKLiveListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)_addSubviews{
    self.superTableV.delegate = self;
    self.superTableV.dataSource = self;
    [self.view addSubview:self.superTableV];
    
    [self.superTableV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.offset(0);
        make.right.equalTo(self.view.mas_right);
        make.height.offset(self.vHeight);
    }];
}
#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kWidth_fact(276);
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    DKLiveTableViewCell *cell = [DKLiveTableViewCell cellFromTableView:tableView];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
