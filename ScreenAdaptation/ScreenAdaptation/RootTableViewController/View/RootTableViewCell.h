//
//  RootTableViewCell.h
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/24.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootTableViewModel.h"

@interface RootTableViewCell : UITableViewCell

// 用一个可变数组存储VCModel和titleModel
@property(nonatomic, strong)NSMutableArray *tableViewCellArrM;

// 设置tableViewCellArrM的值。
- (void)setTableViewCellArrM:(NSMutableArray<NSMutableArray *> *)tableViewCellArrM WithIndexPathRow:(NSInteger)row;

@end
