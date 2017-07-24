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

- (void)viewDidLoad {
    [super viewDidLoad];
    
#pragma mark 监听旋转
    // 监听开始旋转
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeViewFrame) name:UIDeviceOrientationDidChangeNotification object:nil];
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
