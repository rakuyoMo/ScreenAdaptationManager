//
//  AutolayoutViewController.m
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/21.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import "AutolayoutViewController.h"
#import "UIView+changeFrame.h"

@interface AutolayoutViewController ()

@end

@implementation AutolayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 保证首次进入时，mainView的形状。
    [self changeMainViewConstr];
    
#pragma mark 监听旋转。
    // 监听开始旋转
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeViewFrame) name:UIDeviceOrientationDidChangeNotification object:nil];
}

#pragma mark 移除监听。
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}

#pragma mark 处理旋转。
- (void)changeViewFrame {
    
    // 根据屏幕旋转方向处理视图frame,保证mainView视图是一个正方形
    [self.view changeViewFrameOnCrossScreen:^{
        CGFloat space = (self.view.frame.size.width -  self.mainView.frame.size.height) / 2;
        self.mainViewLeft.constant = space;
        self.mainViewRight.constant = space;
    } OrVerticalScreen:^{
        [self changeMainViewConstr];
    }];
}

- (void)changeMainViewConstr {
    CGFloat space = (self.view.frame.size.height -  self.mainView.frame.size.width) / 2;
    self.mainViewTop.constant = space - self.navigationController.navigationBar.frame.size.height - 14;
    self.mainViewBottom.constant = space;
}

@end
