//
//  BaseView.m
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/21.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import "BaseView.h"
#import "UIView+Border.h"

#if !defined(MAINSCRSIZE)
#define MAINSCRSIZE [[UIScreen mainScreen] bounds].size
#endif

@interface BaseView ()

#pragma mark - 视图坐标属性。
@property(nonatomic, assign) CGFloat mainViewX;
@property(nonatomic, assign) CGFloat mainViewY;
@property(nonatomic, assign) CGFloat mainViewWidth;
@property(nonatomic, assign) CGFloat mainViewHeight;

#pragma mark - 子视图属性。
@property(nonatomic, weak) UIView *leftView;
@property(nonatomic, weak) UIView *rightView;

@property(nonatomic, weak) UIView *leftUpperView;
@property(nonatomic, weak) UIView *leftLowerView;
@property(nonatomic, weak) UIView *rightUpperView;
@property(nonatomic, weak) UIView *rightLowerView;

@end

@implementation BaseView

#pragma mark - 初始化BaseView，并为其添加样式。
- (instancetype)initWithStyle {

    if (self = [super init]) {
        // 主正方形颜色。
        self.backgroundColor = [UIColor whiteColor];
        // 设置边框、圆角
        [self borderViewInColor:[UIColor colorWithRed:0.82 green:0.35 blue:0.81 alpha:1.00]];
        
        // 内视图。
        // 创建2个二级区块视图。
        UIView *leftView = [[UIView alloc] init];
        UIView *rightView = [[UIView alloc] init];
        
        self.leftView = leftView;
        self.rightView = rightView;
        
        // 将二级视图加入BaseView主视图。
        [self addSubview:self.leftView];
        [self addSubview:self.rightView];
        
        // 创建4个子视图
        UIView *luView = [[UIView alloc] init];
        UIView *llView = [[UIView alloc] init];
        UIView *ruView = [[UIView alloc] init];
        UIView *rlView = [[UIView alloc] init];
        self.leftUpperView = luView;
        self.leftLowerView = llView;
        self.rightUpperView = ruView;
        self.rightLowerView = rlView;
        
        // 将4个子视图加入二级视图中。
        [self.leftView addSubview:self.leftUpperView];
        [self.leftView addSubview:self.leftLowerView];
        [self.rightView addSubview:self.rightUpperView];
        [self.rightView addSubview:self.rightLowerView];
        
        // 设置4个小视图的边框、圆角
        [self.leftUpperView borderViewInColor:[UIColor redColor]];
        [self.leftLowerView borderViewInColor:[UIColor yellowColor]];
        [self.rightUpperView borderViewInColor:[UIColor blueColor]];
        [self.rightLowerView borderViewInColor:[UIColor greenColor]];
        
    }
    return self;
}

#pragma mark - 设置视图Frame。
- (void)frameWithSize:(CGSize)size {
    
    // 初始化第一次进入视图时View的Frame。
    UIDeviceOrientation orien = [UIDevice currentDevice].orientation;
    
    // 减去横屏时屏幕顶端的NaviBar
    if (orien == UIDeviceOrientationLandscapeLeft || orien == UIDeviceOrientationLandscapeRight ) {
        self.mainViewWidth = size.width - 30;
        self.mainViewHeight = size.height - 30;
        self.mainViewY = fabs(MAINSCRSIZE.height - size.height) * 0.5 + 30;
    } else {
        self.mainViewWidth = size.width;
        self.mainViewHeight = size.height;
        self.mainViewY = fabs(MAINSCRSIZE.height - size.height) * 0.5;
    }
    self.mainViewX = fabs(MAINSCRSIZE.width - size.width) * 0.5;
    
    self.frame = CGRectMake(self.mainViewX, self.mainViewY, self.mainViewWidth, self.mainViewHeight);
}

#pragma mark - 重新对子视图进行布局。
- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 设置两个二级视图的frame
    CGSize superViewOfLeftView = self.leftView.superview.frame.size;
    self.leftView.frame = CGRectMake(0, 0, superViewOfLeftView.width * 0.5, superViewOfLeftView.height);
    
    CGSize superViewOfRightView = self.rightView.superview.frame.size;
    self.rightView.frame = CGRectMake(self.leftView.frame.size.width, 0, superViewOfRightView.width * 0.5, superViewOfRightView.height);
    
    // 设置四个子视图的frame
    CGSize superViewOfLeftChildView = self.leftUpperView.superview.frame.size;
    CGSize superViewOfRightChildView = self.rightUpperView.superview.frame.size;
    
    CGFloat baseS = 5;
    CGFloat baseX = 10;
    CGFloat baseY = 10;
    
    CGFloat baseLeftW = superViewOfLeftChildView.width - baseX - baseS;
    CGFloat baseLeftH = (superViewOfLeftChildView.height * 0.5) - baseY - baseS;
    
    CGFloat baseRightW = superViewOfRightChildView.width - baseX - baseS;
    CGFloat baseRightH = (superViewOfRightChildView.height * 0.5) - baseY - baseS;
    
    self.leftUpperView.frame = CGRectMake(baseX, baseY, baseLeftW, baseLeftH);
    self.leftLowerView.frame = CGRectMake(baseX, baseY * 2 + baseLeftH, baseLeftW, baseLeftH);
    
    self.rightUpperView.frame = CGRectMake(baseS, baseY, baseRightW, baseRightH);
    self.rightLowerView.frame = CGRectMake(baseS, baseY * 2 +baseRightH, baseRightW, baseRightH);
}

@end
