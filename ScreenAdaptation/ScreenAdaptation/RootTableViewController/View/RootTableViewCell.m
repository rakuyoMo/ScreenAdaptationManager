//
//  RootTableViewCell.m
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/24.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import "RootTableViewCell.h"

@implementation RootTableViewCell

// 重写cell的初始化方法。
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 添加cell右侧的小箭头。
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

// 自定义rootTableViewModel属性的set方法，进行赋值。
- (void)setTableViewCellModel:(RootTableViewModel *) rootTableViewModel{
    
//    _tableViewCellModel = rootTableViewModel;
    self.textLabel.text = rootTableViewModel.title;
}

@end
