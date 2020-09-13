//
//  DKHomeViewController.m
//  BeelinkC
//
//  Created by Gavin on 2020/9/8.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKHomeViewController.h"
#import "WSLWaterFlowLayout.h"
#import "DKHomeCollectionViewCell.h"
#import "DKHomeCollectionHeaderView.h"
#import "DKHomeCollectionFooterView.h"
#import "DKSearchViewController.h"

@interface DKHomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,WSLWaterFlowLayoutDelegate,ZFJRollViewDelegate>
@property (nonatomic, strong) UICollectionView *collevtionview;
@property (nonatomic, strong) WSLWaterFlowLayout * flowLayout;
@end

@implementation DKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)_addSubviews{
    [self addNavView];
    [self.view addSubview:self.collevtionview];
    [self.collevtionview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.offset(kTopHeight);
        make.height.offset(KScreen_Height-kTopHeight-kTabBarHeight);
    }];
    [self.flowLayout.collectionView  reloadData];
}
-(void)addNavView{
    UIView *nav_view = [[UIView alloc] init];
    nav_view.backgroundColor = color_white10;
    [self.view addSubview:nav_view];

    [nav_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.equalTo(@0);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@(kTopHeight));
    }];

    UIImageView *iconImageV = [[UIImageView alloc] init];
    iconImageV.backgroundColor = [UIColor redColor];
    iconImageV.image = KImage(@"home_icon");
    [nav_view addSubview:iconImageV];
    [iconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(kWidth_fact(15));
        make.top.equalTo(@(kStatuHeight+7));
        make.width.height.offset(30);
    }];

//    UILabel *titleL = [[UILabel alloc] init];
//    titleL.text = @"量大使";
//    titleL.font = KF_H_F(15);
//    titleL.textColor = color_main_white;
//    [nav_view addSubview:titleL];
//    [titleL mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(iconImageV.mas_right).offset(kWidth_fact(6));
//        make.centerY.equalTo(iconImageV.mas_centerY);
//    }];

    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    KRadius(searchBtn, 13);
    searchBtn.backgroundColor = color_n_gray67;
    [searchBtn addTarget:self action:@selector(searchVC) forControlEvents:UIControlEventTouchUpInside];
    [nav_view addSubview:searchBtn];
    

    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.backgroundColor = [UIColor redColor];
    [nav_view addSubview:rightBtn];
    
    [searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconImageV.mas_right).offset(kWidth_fact(15));
        make.centerY.equalTo(iconImageV.mas_centerY);
        make.right.equalTo(rightBtn.mas_left).offset(kWidth_fact(-15));
        make.height.equalTo(@25);
    }];
    
    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(kWidth_fact(-15));
        make.centerY.equalTo(iconImageV.mas_centerY);
        make.width.height.offset(17);
    }];
    
    UIImageView *searchIconImageV = [[UIImageView alloc] init];
    searchIconImageV.image = KImage(@"home_seek_icon");
    [searchBtn addSubview:searchIconImageV];
    [searchIconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(kWidth_fact(10));
        make.centerY.equalTo(searchBtn.mas_centerY);
        make.width.height.equalTo(@11);
    }];

    UILabel *searchL = [[UILabel alloc] init];
    searchL.text = @"输入关键字搜索视频";
    searchL.font = KF_H_F(12);
    searchL.textColor = color_n_gray8;
    [searchBtn addSubview:searchL];
    [searchL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(searchIconImageV.mas_right).offset(kWidth_fact(10));
        make.centerY.equalTo(searchBtn.mas_centerY);
    }];
}
-(void)searchVC{
    DKSearchViewController *productListVC = [[DKSearchViewController alloc] init];
    productListVC.isHideNav = YES;
    [self.navigationController pushViewController:productListVC animated:YES];
}
-(WSLWaterFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout = [[WSLWaterFlowLayout alloc] init];
        _flowLayout.delegate = self;
        _flowLayout.flowLayoutStyle = WSLWaterFlowVerticalEqualWidth;
    }
    return _flowLayout;
}
-(UICollectionView *)collevtionview{
    if (!_collevtionview) {
        _collevtionview=[[UICollectionView alloc]initWithFrame:CGRectMake(0,0, KScreen_Width, 0) collectionViewLayout:self.flowLayout];
        _collevtionview.backgroundColor= color_white10;
        _collevtionview.showsVerticalScrollIndicator=NO;
        _collevtionview.showsHorizontalScrollIndicator=NO;
        _collevtionview.dataSource = self;
        _collevtionview.delegate = self;
//        _collevtionview.backgroundColor = [UIColor yellowColor];
//        _collevtionview.bounces = NO;
//        [_collevtionview registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"DKHomeHeader"];
        //注册容器视图中显示的顶部视图
        [_collevtionview registerClass:[DKHomeCollectionHeaderView class]
           forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                  withReuseIdentifier:[DKHomeCollectionHeaderView headerViewIdentifier]];
        [_collevtionview registerClass:[DKHomeCollectionFooterView class]
        forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
               withReuseIdentifier:[DKHomeCollectionFooterView footerViewIdentifier]];
        
        [_collevtionview registerClass:[DKHomeCollectionViewCell class] forCellWithReuseIdentifier:@"DKHomeCollectionViewCell"];
        
        
//        _collevtionview.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
//        //底部刷新
//        _collevtionview.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
    }
    return _collevtionview;
}
#pragma mark - WSLWaterFlowLayoutDelegate
//返回每个item大小
- (CGSize)waterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(kWidth_fact(165),kWidth_fact(142));
}

/** 列数*/
-(CGFloat)columnCountInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout{
    return 2;
}
/** 行数*/
-(CGFloat)rowCountInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout{
    return 1;
}
/** 列间距*/
-(CGFloat)columnMarginInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout{
    return kWidth_fact(15);
}
/** 行间距*/
-(CGFloat)rowMarginInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout{
    return kWidth_fact(10);
}
/** 边缘之间的间距*/
-(UIEdgeInsets)edgeInsetInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout{
    return UIEdgeInsetsMake(0, kWidth_fact(15),kWidth_fact(5), kWidth_fact(15));
}
///** 头视图Size */
-(CGSize )waterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout sizeForHeaderViewInSection:(NSInteger)section{
//    if (section == 0) {
        return CGSizeMake(KScreen_Width, kWidth_fact(35));
//    }
//    return CGSizeZero;
}
-(CGSize)waterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout sizeForFooterViewInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(KScreen_Width, kWidth_fact(267));
    }
    return CGSizeZero;
}
#pragma mark - UICollectionView数据源
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        //获取顶部视图
        DKHomeCollectionHeaderView *headerView=[DKHomeCollectionHeaderView headerViewWithCollectionView:collectionView forIndexPath:indexPath];
        //设置顶部视图属性
//        headerView.backgroundColor = [UIColor whiteColor];
        headerView.textLabel.text = @"热门视频";
        return headerView;
    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        //获取底部视图
        DKHomeCollectionFooterView *footerView=[DKHomeCollectionFooterView footerViewWithCollectionView:collectionView forIndexPath:indexPath];
        //设置底部视图属性
//        footerView.backgroundColor=[UIColor yellowColor];
//        footerView.textLabel.text = [NSString stringWithFormat:@"-Footer-%ld-",indexPath.section];
//        [footerView.subviews makeObjectsPerformSelector:@selector(rem)]
        if (indexPath.section == 0) {
            footerView.rollView.hidden = NO;
            NSArray *arr = @[@"48791.jpg",
            @"81239.jpg",
            @"128915.jpg"];
            [footerView.rollView rollView:arr];
        }else{
            NSLog(@"12345");
            footerView.rollView.hidden = YES;
        }
        return footerView;

    }
    return nil;
}
//组个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

//组内成员个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section != 0) {
        return 10;
    }
    return 0;
}

// 返回每个cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DKHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DKHomeCollectionViewCell" forIndexPath:indexPath];
//    cell.imageName = self.imageNameArray[indexPath.row];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //    NSDictionary *model = self.viewModel.listArray[indexPath.row];
    //    DKProductListViewController *productListVC = [[DKProductListViewController alloc] init];
    //    productListVC.code = [NSString null_str:model[@"category_code"]];
    //    productListVC.isHideNav = YES;
    //    [self.navigationController pushViewController:productListVC animated:YES];
    NSLog(@"%@",indexPath);
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
