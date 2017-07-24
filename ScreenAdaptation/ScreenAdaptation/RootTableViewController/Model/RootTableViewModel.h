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

// model中viewController数据的初始化方法。
+ (instancetype)modelWithViewController:(UIViewController *)viewController;
// model中viewController数据的初始化方法。
+ (instancetype)modelWithTitle:(NSString *)title;


@end
