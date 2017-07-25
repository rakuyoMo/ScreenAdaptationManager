//
//  FrameViewController.m
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/21.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import "FrameCodeView.h"
#import "FrameViewController.h"

@interface FrameViewController ()

@property (nonatomic, weak) FrameCodeView *mainView;

@end

@implementation FrameViewController

- (void)viewDidLayoutSubviews {

    [super viewDidLayoutSubviews];
    
    // 重新布局BaseView。
    CGFloat mainViewLength = MIN(self.view.frame.size.height, self.view.frame.size.width);
    [self.mainView frameWithSize:CGSizeMake(mainViewLength, mainViewLength)];
}

#pragma mark - 初始化基础视图
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 初始化BaseView。
    FrameCodeView *baseView = [[FrameCodeView alloc] init];
    self.mainView = baseView;
    [self.view addSubview:self.mainView];
}

@end
