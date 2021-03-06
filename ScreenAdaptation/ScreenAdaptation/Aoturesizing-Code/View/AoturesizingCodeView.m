//
//  BaseView.m
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/21.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import "AoturesizingCodeView.h"
#import "UIView+Border.h"

#if !defined(MAINSCRSIZE)
#define MAINSCRSIZE [[UIScreen mainScreen] bounds].size
#endif

@interface AoturesizingCodeView ()

#pragma mark - 子视图属性。

@property(nonatomic, strong) UIView *leftView;
@property(nonatomic, strong) UIView *rightView;

@property(nonatomic, strong) UIView *leftUpperView;
@property(nonatomic, strong) UIView *leftLowerView;
@property(nonatomic, strong) UIView *rightUpperView;
@property(nonatomic, strong) UIView *rightLowerView;

@end

@implementation AoturesizingCodeView

#pragma mark - 初始化BaseView，并为其添加样式。
- (instancetype)init {

    if (self = [super init]) {
        
        // 主视图
        // 背景颜色。
        self.backgroundColor = [UIColor whiteColor];
        // 设置边框、圆角
        [self borderViewInColor:[UIColor colorWithRed:0.82 green:0.35 blue:0.81 alpha:1.00]];
        
        // 内视图。
        // 创建左视图
        UIView *leftView = [[UIView alloc] init];
        self.leftView = leftView;
        // 将二级视图加入BaseView主视图。
        [self addSubview:self.leftView];
        
        // 创建右视图，和左视图方法相同。
        UIView *rightView = [[UIView alloc] init];
        self.rightView = rightView;
        [self addSubview:self.rightView];
        
        // 创建4个子视图
        // 子视图1
        UIView *luView = [[UIView alloc] init];
        self.leftUpperView = luView;
        // 将子视图添加到对应的左右视图中。
        [self.leftView addSubview:self.leftUpperView];
        // 设置子视图的边框、圆角
        [self.leftUpperView borderViewInColor:[UIColor redColor]];
        
        // 子视图2，和子视图1方法相同。
        UIView *llView = [[UIView alloc] init];
        self.leftLowerView = llView;
        [self.leftView addSubview:self.leftLowerView];
        [self.leftLowerView borderViewInColor:[UIColor yellowColor]];
        
        // 子视图3，和子视图1方法相同。
        UIView *ruView = [[UIView alloc] init];
        self.rightUpperView = ruView;
        [self.rightView addSubview:self.rightUpperView];
        [self.rightUpperView borderViewInColor:[UIColor blueColor]];
        
        // 子视图4，和子视图1方法相同。
        UIView *rlView = [[UIView alloc] init];
        self.rightLowerView = rlView;
        [self.rightView addSubview:self.rightLowerView];
        [self.rightLowerView borderViewInColor:[UIColor greenColor]];
    }
    return self;
}

#pragma mark - 设置视图Frame。
- (void)frameWithSize:(CGSize)size {
    
    // 初始化第一次进入视图时View的Frame。
    CGFloat mainViewY = fabs(MAINSCRSIZE.height - size.height) * 0.5;
    CGFloat mainViewX = fabs(MAINSCRSIZE.width - size.width) * 0.5;
    
    self.frame = CGRectMake(mainViewX, mainViewY, size.width, size.height);
    
    // 设置左视图和右视图的frame
    // 左视图
    CGSize selfSize = self.frame.size;
    self.leftView.frame = CGRectMake(0, 0, selfSize.width * 0.5, selfSize.height);
    
    // 右视图
    CGSize leftViewSize = self.leftView.frame.size;
    self.rightView.frame = CGRectMake(leftViewSize.width, 0, selfSize.width * 0.5, selfSize.height);
    
    // 设置四个子视图的frame
    // 设置基础数值
    CGFloat baseS = 5;
    CGFloat baseX = 10;
    CGFloat baseY = 10;
    CGFloat baseW = leftViewSize.width - baseX - baseS;
    CGFloat baseH = (leftViewSize.height * 0.5) - baseY - baseS;
    
    // 左上、右上子视图frame
    self.leftUpperView.frame = CGRectMake(baseX, baseY, baseW, baseH);
    self.rightUpperView.frame = CGRectMake(baseS, baseY, baseW, baseH);
    
    // 左下、右下子视图frame
    self.leftLowerView.frame = CGRectMake(baseX, baseY * 2 + baseH, baseW, baseH);
    self.rightLowerView.frame = CGRectMake(baseS, baseY * 2 +baseH, baseW, baseH);
}

#pragma mark - 封装设置AutoresizingMask的方法。
- (void)autoresizingMaskOfChildView:(NSMutableArray<NSNumber *> *(^)())autoMaskArr {
    
    // 接收block的返回值。
    NSMutableArray *tempArrM = [NSMutableArray arrayWithArray:autoMaskArr()];
    
    // 设置左、右视图的AutoresizingMask
    self.leftView.autoresizingMask = (UIViewAutoresizing)[tempArrM[0] unsignedIntegerValue];
    self.rightView.autoresizingMask = (UIViewAutoresizing)[tempArrM[0] unsignedIntegerValue];
    
    // 设置左上、右上视图的AutoresizingMask
    self.leftUpperView.autoresizingMask = (UIViewAutoresizing)[tempArrM[1] unsignedIntegerValue];
    self.rightUpperView.autoresizingMask = (UIViewAutoresizing)[tempArrM[1] unsignedIntegerValue];
    
    // 设置左下、右下视图的AutoresizingMask
    self.leftLowerView.autoresizingMask = (UIViewAutoresizing)[tempArrM[2] unsignedIntegerValue];
    self.rightLowerView.autoresizingMask = (UIViewAutoresizing)[tempArrM[2] unsignedIntegerValue];
}

@end
