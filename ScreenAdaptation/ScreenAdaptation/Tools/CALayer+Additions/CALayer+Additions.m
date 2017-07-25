//
//  CALayer+Additions.m
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/21.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import "CALayer+Additions.h"

@implementation CALayer (Additions)

// 为CALayer设置分类，方便在sb中设置边框颜色。
- (void)setBorderUIColor:(UIColor *)color{
    self.borderColor = color.CGColor;
}

- (UIColor *)borderUIColor {
    return [UIColor colorWithCGColor:self.borderColor];
}

@end
