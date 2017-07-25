//
//  AutoresizingViewController.m
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/21.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import "AoturesizingCodeView.h"
#import "AutoresizingViewController.h"

@interface AutoresizingViewController ()

@property (nonatomic, weak) AoturesizingCodeView *mainView;

@end

@implementation AutoresizingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 初始化BaseView，设置的样式和Frame。
    CGFloat mainViewLength = MIN(self.view.frame.size.height, self.view.frame.size.width);
    AoturesizingCodeView *aoturesView = [[AoturesizingCodeView alloc] init];
    [aoturesView frameWithSize:CGSizeMake(mainViewLength, mainViewLength)];
    
    // 添加到子视图。
    self.mainView = aoturesView;
    [self.view addSubview:self.mainView];
    
    // 利用Autoresizing处理屏幕旋转
    [self autoresizingMastWithView];
    
}

- (void)autoresizingMastWithView {
    
    // 设置主视图的Autoresizing约束。
    // 通过代码使用autoresizingMask，让左右上下的间隔都保持不变，从而固定。
    self.mainView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    // 设置子视图的Autoresizing约束。
    [self.mainView autoresizingMaskOfChildView:^NSMutableArray *{
        
        // 因为我觉得6个子视图的Autoresizing约束是一样的，但是又不确定，所以先用数组来接收，方便增加约束。
        // 等确定之后可以将block的返回值直接改为NSNumber值。
        
        // 所有子视图（6个）的布局约束。
        UIViewAutoresizing viewAutores = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        NSNumber *num = [NSNumber numberWithInt:viewAutores];
        
        // 添加到数组中，返回供View里添加约束。
        NSMutableArray *tempArr = [NSMutableArray arrayWithObjects:num, nil];
        
        return tempArr;
    }];
}


@end
