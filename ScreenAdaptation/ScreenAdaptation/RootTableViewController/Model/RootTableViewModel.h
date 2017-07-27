//
//  RootTableViewModel.h
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/24.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootTableViewModel : NSObject


@property(nonatomic, strong)UIViewController *viewController;   // cell对应的控制器。
@property(nonatomic, strong)NSString *title;    // cell标题

// 设置模型
+ (instancetype)modelWithViewController:(UIViewController *)viewController title:(NSString *)title;


@end
