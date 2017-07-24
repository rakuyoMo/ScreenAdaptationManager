//
//  ViewController.m
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/21.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import "AutoSBViewController.h"
#import "UIView+changeFrame.h"

@interface AutoSBViewController ()

@end

@implementation AutoSBViewController

#pragma mark 监听旋转。
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 保证横屏进入时，BaseView在屏幕中间。
    self.mainView.center = self.view.center;
    
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
    
    CGFloat naviBarHeight = self.navigationController.navigationBar.frame.size.height;
    CGFloat viewHeight = self.view.frame.size.height;
    CGFloat viewWeight = self.view.frame.size.width;
    // 取绝对值。
    CGFloat space = fabs( (viewHeight - viewWeight) / 2);
    
    // 根据屏幕旋转方向处理视图frame。
    [self.view changeViewFrameOnCrossScreen:^{
        self.mainView.frame = CGRectMake(space, naviBarHeight, viewHeight - naviBarHeight, viewHeight - naviBarHeight);
        
    } OrVerticalScreen:^{
        self.mainView.frame = CGRectMake(0, space, viewWeight, viewWeight);
    }];
}



@end
