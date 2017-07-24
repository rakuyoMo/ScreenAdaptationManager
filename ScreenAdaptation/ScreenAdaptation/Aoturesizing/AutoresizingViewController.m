//
//  AutoresizingViewController.m
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/21.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import "BaseView.h"
#import "AutoresizingViewController.h"

@interface AutoresizingViewController ()

@property (nonatomic, weak) UIView *mainView;

@end

@implementation AutoresizingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
#pragma mark - 初始化基础视图
    BaseView *baseView = [BaseView sharedManager];
    self.mainView = baseView;
    [self.view addSubview:self.mainView];
    
#pragma mark - 处理屏幕旋转

    // 通过代码使用autoresizingMask，让左右上下的间隔都保持不变，从而固定。
    self.mainView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
}


@end
