//
//  RootTableViewModel.h
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/24.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootTableViewModel : NSObject

@property(nonatomic, strong)UIViewController *viewController;
@property(nonatomic, strong)NSString *title;

+ (instancetype)modelWithViewController:(UIViewController *)viewController title:(NSString *)title;

@end
