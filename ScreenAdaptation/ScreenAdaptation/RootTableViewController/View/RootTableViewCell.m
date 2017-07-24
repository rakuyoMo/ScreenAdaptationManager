//
//  RootTableViewCell.m
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/24.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import "RootTableViewCell.h"

@implementation RootTableViewCell

- (instancetype)init {
    if (self = [super init]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return self;
}

// 自定义rootTableViewModel属性的set方法，进行赋值。
- (void)setTableViewCellModel:(RootTableViewModel *) rootTableViewModel{
    
    _tableViewCellModel = rootTableViewModel;
    self.textLabel.text = rootTableViewModel.title;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
