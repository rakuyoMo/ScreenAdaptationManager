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

@property (nonatomic, strong) AoturesizingCodeView *mainView;

@end

@implementation AutoresizingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 初始化BaseView，并设置autoresizing约束。
    self.mainView = [self autoresizingMastWithView];
    
    // 设置的样式和Frame。
    CGFloat mainViewLength = MIN(self.view.frame.size.height, self.view.frame.size.width);
    [self.mainView frameWithSize:CGSizeMake(mainViewLength, mainViewLength)];
    
    // 添加到子视图。
    [self.view addSubview:self.mainView];
}

// 初始化BaseView，并设置autoresizing约束。
- (AoturesizingCodeView *)autoresizingMastWithView {
    
    AoturesizingCodeView *aoturesView = [[AoturesizingCodeView alloc] init];
    
    // 设置主视图的Autoresizing约束。
    // 通过代码使用autoresizingMask，让左右上下的间隔都保持不变，从而固定。
    aoturesView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    // 设置子视图的Autoresizing约束。
    [aoturesView autoresizingMaskOfChildView:^NSMutableArray *{

        // 左、右视图约束。
        UIViewAutoresizing viewAutores = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        NSNumber *num = [NSNumber numberWithInt:viewAutores];
        
        // 左上&&右上视图约束。
        UIViewAutoresizing uppViewAutores = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;        NSNumber *upptNum = [NSNumber numberWithInt:uppViewAutores];
        
        // 左下&&右下视图约束。
        UIViewAutoresizing lowViewAutores = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin;
        NSNumber *lowtNum = [NSNumber numberWithInt:lowViewAutores];
        
        // 添加到数组中，返回供View里添加约束。
        NSMutableArray *tempArr = [NSMutableArray arrayWithObjects:num, upptNum, lowtNum, nil];
        
        return tempArr;
    }];
    return aoturesView;
}

// 设置点击事件，判断autoresizing设置是否正确。
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CGRect temp = self.mainView.frame;
    temp.size.height *= 0.8;
    self.mainView.frame = temp;
}

@end
