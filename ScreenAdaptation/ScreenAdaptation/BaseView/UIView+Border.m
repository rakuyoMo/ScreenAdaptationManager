//
//  UIView+Border.m
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/21.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import "UIView+Border.h"

@implementation UIView (Border)

- (void)borderViewInColor:(CGColorRef)color {
    // 圆角
    self.layer.cornerRadius = 10;
    // 边框宽度不用加单位
    self.layer.borderWidth = 5;
    // 设置边框颜色
    self.layer.borderColor = color;
}

@end
