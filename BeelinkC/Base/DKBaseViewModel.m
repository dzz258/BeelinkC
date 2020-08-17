//
//  DKBaseViewModel.m
//  dingdonghuigou
//
//  Created by Gavin on 2018/12/19.
//  Copyright © 2018 bei jing you ji. All rights reserved.
//

#import "DKBaseViewModel.h"

@implementation DKBaseViewModel

-(NSMutableArray *)listArray{
    if (!_listArray) {
        _listArray = [[NSMutableArray alloc] init];
    }
    return _listArray;
}

+ (instancetype)viewModel{
    return [[self alloc] init];
}

@end
