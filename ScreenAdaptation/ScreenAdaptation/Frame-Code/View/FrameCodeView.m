//
//  BaseView.m
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/21.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import "FrameCodeView.h"
#import "UIView+Border.h"

#if !defined(MAINSCRSIZE)
#define MAINSCRSIZE [[UIScreen mainScreen] bounds].size
#endif

@interface FrameCodeView ()

#pragma mark - 子视图属性。
@property(nonatomic, weak) UIView *leftView;
@property(nonatomic, weak) UIView *rightView;

@property(nonatomic, weak) UIView *leftUpperView;
@property(nonatomic, weak) UIView *leftLowerView;
@property(nonatomic, weak) UIView *rightUpperView;
@property(nonatomic, weak) UIView *rightLowerView;

@end

@implementation FrameCodeView

#pragma mark - 初始化FrameCodeView，并为其添加样式。
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
    UIDeviceOrientation orien = [UIDevice currentDevice].orientation;
    
    // 初始化设置frame的x、y、width、height值。
    CGFloat mainViewX = fabs(MAINSCRSIZE.width - size.width) * 0.5;
    CGFloat mainViewY = fabs(MAINSCRSIZE.height - size.height) * 0.5;
    CGFloat mainViewWidth = size.width;
    CGFloat mainViewHeight = size.height;
    
    // 减去横屏时屏幕顶端的NaviBar
    if (orien == UIDeviceOrientationLandscapeLeft || orien == UIDeviceOrientationLandscapeRight ) {
        
        // 老实说这个样子做好像不太好。
        // 但是如果只传宽高的话只能这么弄，在View里判断屏幕尺寸。
        // 如果不只传宽高，那么可以再VC里的viewDidLayoutSubviews里获取Bar的高度，剪掉之后直接作为Y值传过来，设置View的Frame。
        // 至于这两种方法哪种更好.....就不太清楚了。
        int naviBarH = 0;
        if (MAINSCRSIZE.height >= 414) {
            naviBarH = 44;
        } else {
            naviBarH = 32;
        }
        
        // 横屏时候，这里在plus下，naviBar的高度是44，iPhone 7下是32.
        mainViewWidth -= naviBarH;
        mainViewHeight -= naviBarH;
        mainViewY += naviBarH;
    }
    
    // 设置frame
    self.frame = CGRectMake(mainViewX, mainViewY, mainViewWidth, mainViewHeight);
}

#pragma mark - 重新对子视图进行布局。
- (void)layoutSubviews {
    [super layoutSubviews];
    
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
    
    // 左上子视图frame
    self.leftUpperView.frame = CGRectMake(baseX, baseY, baseW, baseH);
    // 左下子视图frame
    self.leftLowerView.frame = CGRectMake(baseX, baseY * 2 + baseH, baseW, baseH);
    // 右上子视图frame
    self.rightUpperView.frame = CGRectMake(baseS, baseY, baseW, baseH);
    // 右下子视图frame
    self.rightLowerView.frame = CGRectMake(baseS, baseY * 2 +baseH, baseW, baseH);
}

@end
