//
//  BaseView.h
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/21.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView

// 初始化BaseView，并为其添加样式。
- (instancetype)initWithStyle;
// 设置视图Frame。
- (void)frameWithSize:(CGSize)size;

@end
