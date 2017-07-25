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

@property (nonatomic, weak) BaseView *mainView;

@end

@implementation AutoresizingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 初始化BaseView，设置的样式和Frame。
    CGFloat mainViewLength = MIN(self.view.frame.size.height, self.view.frame.size.width);
    BaseView *baseView = [[BaseView alloc] init];
    [baseView frameWithSize:CGSizeMake(mainViewLength, mainViewLength)];
    
    // 添加到子视图。
    self.mainView = baseView;
    [self.view addSubview:self.mainView];
    
    // 处理屏幕旋转
    // 通过代码使用autoresizingMask，让左右上下的间隔都保持不变，从而固定。
    self.mainView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
}


@end
