//
//  RootTableViewModel.h
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/24.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootTableViewModel : NSObject

@property(nonatomic, weak)UIViewController *viewController;
@property(nonatomic, weak)NSString *title;

+ (instancetype)modelWithViewController:(UIViewController *)viewController title:(NSString *)title;

@end
