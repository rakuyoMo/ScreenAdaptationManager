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

// 单个cell的model
@property(nonatomic, weak)RootTableViewModel *tableViewCellModel;

@end
