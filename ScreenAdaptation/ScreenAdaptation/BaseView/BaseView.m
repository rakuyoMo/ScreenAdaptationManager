//
//  BaseView.m
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/21.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "UIView+changeFrame.h"
#import "UIView+Border.h"
#import "BaseView.h"

@implementation BaseView

#pragma mark - 基础视图设置。
- (instancetype)initWithSuperview:(UIView *)superView {

    if (self = [super init] ) {
        
        // 主正方形。
        self.backgroundColor = [UIColor whiteColor];
        
        CGSize superViewOfmainView = superView.frame.size;
        
        // 按照初始进入时屏幕的方向初始化视图Frames。
        [self changeViewFrameOnCrossScreen:^{
            self.mainViewX = fabs((superViewOfmainView.height - superViewOfmainView.width) / 2);
            self.mainViewY = 0;
            self.mainViewLength = superViewOfmainView.height;
        } OrVerticalScreen:^{
            self.mainViewX = 0;
            self.mainViewY = fabs((superViewOfmainView.height - superViewOfmainView.width) / 2);
            self.mainViewLength = superViewOfmainView.width;
        }];
        
        self.frame = CGRectMake(self.mainViewX, self.mainViewY, self.mainViewLength, self.mainViewLength);
        
        // (__bridge CGColorRef _Nullable) 桥接，仅仅作为类型转换
        CGColorRef purple = (__bridge CGColorRef _Nullable)((__bridge id)[UIColor colorWithRed:0.82 green:0.35 blue:0.81 alpha:1.00].CGColor);
        // 设置边框、圆角
        [self borderViewInColor:purple];
        
        // 内视图。
        // 创建四个子视图，并设置四个子视图的frame
        CGFloat baseS = 10;
        CGFloat baseX = 10;
        CGFloat baseY = 10;
        CGFloat baseH = self.mainViewLength / 2 - baseY - baseS;
        CGFloat baseW = self.mainViewLength / 2 - baseX - baseS;
        
        UIView *childView1 = [[UIView alloc] initWithFrame:CGRectMake(baseX, baseY, baseW, baseH)];
        self.childView1 = childView1;
        
        UIView *childView2 = [[UIView alloc] initWithFrame:CGRectMake(baseX, baseY * 2 + baseH + baseS, baseW, baseH)];
        self.childView2 = childView2;
        
        UIView *childView3 = [[UIView alloc] initWithFrame:CGRectMake(baseX, baseY, baseW, baseH)];
        self.childView3 = childView3;
        
        UIView *childView4 = [[UIView alloc] initWithFrame:CGRectMake(baseX, baseY * 2 + baseH + baseS, baseW, baseH)];
        self.childView4 = childView4;
        
        // 区块化4个子视图
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.mainViewLength / 2, self.mainViewLength)];
        self.leftView = leftView;
        UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(self.mainViewLength / 2, 0, self.mainViewLength / 2, self.mainViewLength)];
        self.rightView = rightView;
        
        [self addSubview:self.leftView];
        [self addSubview:self.rightView];
        
        // 设置4个小视图的边框、圆角
        CGColorRef red = (__bridge CGColorRef _Nullable)((__bridge id)[UIColor redColor].CGColor);
        [self.childView1 borderViewInColor:red];
        
        CGColorRef yellow = (__bridge CGColorRef _Nullable)((__bridge id)[UIColor yellowColor].CGColor);
        [self.childView2 borderViewInColor:yellow];
        
        CGColorRef blue = (__bridge CGColorRef _Nullable)((__bridge id)[UIColor blueColor].CGColor);
        [self.childView3 borderViewInColor:blue];
        
        CGColorRef green = (__bridge CGColorRef _Nullable)((__bridge id)[UIColor greenColor].CGColor);
        [self.childView4 borderViewInColor:green];
        
        // 添加子视图。
        [self.leftView addSubview:self.childView1];
        [self.leftView addSubview:self.childView2];
        
        [self.rightView addSubview:self.childView3];
        [self.rightView addSubview:self.childView4];
    }
    return self;
}

@end
