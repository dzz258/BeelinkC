//
//  DKVideoListVC.m
//  BeelinkC
//
//  Created by Gavin on 2020/9/13.
//  Copyright © 2020 Gavin. All rights reserved.
//

#import "DKVideoListVC.h"
#import "WSLWaterFlowLayout.h"
#import "DKHomeCollectionViewCell.h"

@interface DKVideoListVC ()<UICollectionViewDelegate,UICollectionViewDataSource,WSLWaterFlowLayoutDelegate>
@property (nonatomic, strong) UICollectionView *collevtionview;
@property (nonatomic, strong) WSLWaterFlowLayout * flowLayout;

@end

@implementation DKVideoListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)_addSubviews{
    [self.view addSubview:self.collevtionview];
    [self.collevtionview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.offset(0);
        make.height.offset(self.vHeight);
    }];
    [self.flowLayout.collectionView  reloadData];
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
/////** 头视图Size */
//-(CGSize )waterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout sizeForHeaderViewInSection:(NSInteger)section{
////    if (section == 0) {
//        return CGSizeMake(KScreen_Width, kWidth_fact(35));
////    }
////    return CGSizeZero;
//}
//-(CGSize)waterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout sizeForFooterViewInSection:(NSInteger)section{
//    if (section == 0) {
//        return CGSizeMake(KScreen_Width, kWidth_fact(267));
//    }
//    return CGSizeZero;
//}
#pragma mark - UICollectionView数据源
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        //获取顶部视图
//        DKHomeCollectionHeaderView *headerView=[DKHomeCollectionHeaderView headerViewWithCollectionView:collectionView forIndexPath:indexPath];
//        //设置顶部视图属性
////        headerView.backgroundColor = [UIColor whiteColor];
//        headerView.textLabel.text = @"热门视频";
//        return headerView;
//    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
//        //获取底部视图
//        DKHomeCollectionFooterView *footerView=[DKHomeCollectionFooterView footerViewWithCollectionView:collectionView forIndexPath:indexPath];
//        //设置底部视图属性
////        footerView.backgroundColor=[UIColor yellowColor];
////        footerView.textLabel.text = [NSString stringWithFormat:@"-Footer-%ld-",indexPath.section];
////        [footerView.subviews makeObjectsPerformSelector:@selector(rem)]
//        if (indexPath.section == 0) {
//            footerView.rollView.hidden = NO;
//            NSArray *arr = @[@"48791.jpg",
//            @"81239.jpg",
//            @"128915.jpg"];
//            [footerView.rollView rollView:arr];
//        }else{
//            NSLog(@"12345");
//            footerView.rollView.hidden = YES;
//        }
//        return footerView;
//
//    }
//    return nil;
//}
//组个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

//组内成员个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
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
