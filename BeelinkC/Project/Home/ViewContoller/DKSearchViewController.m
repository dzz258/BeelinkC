//
//  DKSearchViewController.m
//  BeelinkC
//
//  Created by Gavin on 2020/9/13.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKSearchViewController.h"
#import "UIImage+Extension.h"
#import "SGPagingView.h"
#import "DKSearchListViewController.h"
#import "DKTeacherListVC.h"
#import "DKVideoListVC.h"
#import "DKLiveListVC.h"

@interface DKSearchViewController ()<UISearchBarDelegate,SGPageTitleViewDelegate, SGPageContentScrollViewDelegate>
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, copy) NSString *keyword;
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentScrollView *pageContentScrollView;
@property (nonatomic, strong) NSMutableArray *vcArray;

@end

@implementation DKSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)_addSubviews{
    [self addNavView];
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.showBottomSeparator = NO;
    configure.indicatorStyle = SGIndicatorStyleDynamic;
    configure.indicatorDynamicWidth = kWidth_fact(15);
    configure.titleFont = KF_H_F(13);
    configure.titleSelectedFont = KF_BH_F(13);
    configure.titleColor = color_gray6;
    configure.titleSelectedColor = color_black8;
    configure.indicatorColor = color_cyan9;
        
    NSArray *titleArray = @[@"老师",@"视频",@"直播"];
    
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, kTopHeight+kWidth_fact(10),KScreen_Width, kWidth_fact(23)) delegate:self titleNames:titleArray configure:configure];
    self.pageTitleView.backgroundColor = color_white10;
    [self.view addSubview:self.pageTitleView];
    
    UIView *lineV = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.pageTitleView.frame)+kWidth_fact(7), KScreen_Width, kWidth_fact(3))];
    lineV.backgroundColor = color_gray3;
    [self.view addSubview:lineV];
    
    CGFloat vHeight = KScreen_Height-CGRectGetMaxY(lineV.frame);
    self.vcArray = [[NSMutableArray alloc] init];
    DKTeacherListVC *teacherVC = [[DKTeacherListVC alloc] init];
    teacherVC.vHeight = vHeight;
    teacherVC.isHideNav = YES;
    [self.vcArray addObject:teacherVC];
    
    DKVideoListVC *videoVC = [[DKVideoListVC alloc] init];
    videoVC.vHeight = vHeight;
    videoVC.isHideNav = YES;
    [self.vcArray addObject:videoVC];
    
    DKLiveListVC *liveVC = [[DKLiveListVC alloc] init];
    liveVC.vHeight = vHeight;
    liveVC.isHideNav = YES;
    [self.vcArray addObject:liveVC];
    
    self.pageContentScrollView = [[SGPageContentScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(lineV.frame), KScreen_Width, vHeight) parentVC:self childVCs:self.vcArray];
    self.pageContentScrollView.delegatePageContentScrollView = self;
    [self.view addSubview:self.pageContentScrollView];
    
    self.pageTitleView.selectedIndex = 0;
}
-(void)addNavView{
    // 创建搜索框
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0,0, KScreen_Width, kTopHeight)];
    navView.backgroundColor = color_white10;
    [self.view addSubview:navView];
    
    UIButton *righyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [righyBtn setTitleColor:color_black8 forState:UIControlStateNormal];
//    righyBtn.frame = CGRectMake(0,kStatuHeight, 44, 44);
    [righyBtn setTitle:@"取消" forState:UIControlStateNormal];
    righyBtn.titleLabel.font = KF_H_F(13);
    [righyBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:righyBtn];
    [righyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(kStatuHeight);
        make.right.offset(kWidth_fact(-15));
        make.height.offset(44);
    }];
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.placeholder = @"输入关键字搜索";
    KRadius(searchBar, 13);
    searchBar.backgroundImage = [UIImage createImageWithColor:color_n_gray67];
    searchBar.delegate = self;
    [navView addSubview:searchBar];
    [searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(kWidth_fact(15));
        make.right.equalTo(righyBtn.mas_left).offset(kWidth_fact(-15));
        make.centerY.equalTo(righyBtn.mas_centerY);
        make.height.offset(26);
    }];
    self.searchBar = searchBar;
    
    UITextField *searchTextField = [self sa_GetSearchTextFiled];
    searchTextField.backgroundColor = [UIColor clearColor];
    searchTextField.textColor = color_black10;
    searchTextField.font = KF_H_F(11);
    [searchBar setImage:[UIImage imageNamed:@"home_seek_icon"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    [navView addSubview:searchBar];
}

- (UITextField *)sa_GetSearchTextFiled{
    if (@available(iOS 13.0, *)) {
        return self.searchBar.searchTextField;
    } else {
        UITextField *searchTextField = [self.searchBar valueForKey:@"_searchField"];
        return searchTextField;
    }
}
#pragma mark - UISearchBarDelegate -
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"1=>%@",searchBar.text);
    self.keyword = searchBar.text;
    [self.searchBar resignFirstResponder];
}


//- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
//{
//    [self.searchBar resignFirstResponder];
//    [self.navigationController popViewControllerAnimated:YES];
//}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    NSLog(@"2=>%@",searchBar.text);
//    searchBar.showsCancelButton = YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"3=>%@",searchBar.text);

}
#pragma mark - SGPageTitleViewDelegate -
- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.pageContentScrollView setPageContentScrollViewCurrentIndex:selectedIndex];
//    NSLog(@"%ld",(long)selectedIndex);
//    DCServiceListViewController *listVC = self.vcArray[selectedIndex];
//    listVC.isCurrent = YES;
}
#pragma mark - SGPageContentScrollViewDelegate -
- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
//    NSLog(@"%ld",(long)targetIndex);
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
//    DCServiceListViewController *listVC = self.vcArray[targetIndex];
//    listVC.isCurrent = YES;
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
