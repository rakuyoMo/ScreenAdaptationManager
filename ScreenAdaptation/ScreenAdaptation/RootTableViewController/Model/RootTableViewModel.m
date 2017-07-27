//
//  RootTableViewModel.m
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/24.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import "RootTableViewModel.h"

@implementation RootTableViewModel

// model数据的初始化方法。
+ (instancetype)modelWithViewController:(UIViewController *)viewController title:(NSString *)title {
    
    RootTableViewModel *tableViewMod = [[RootTableViewModel alloc] init];
    
    tableViewMod.viewController = viewController;
    tableViewMod.title = title.copy;
    
    return tableViewMod;
}


@end
