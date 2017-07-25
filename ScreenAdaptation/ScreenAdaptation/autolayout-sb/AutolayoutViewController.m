//
//  AutolayoutViewController.m
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/21.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import "AutolayoutViewController.h"

@interface AutolayoutViewController ()

@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mainViewTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mainViewBottom;

@end

@implementation AutolayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidLayoutSubviews {

    // 如果View有Navigation的话，那么约束是从NaviBar的下面开始计算的，而不是从状态栏的下面或者屏幕顶部开始计算的。
    CGFloat spac = ((self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height - [UIApplication sharedApplication].statusBarFrame.size.height) - self.mainView.frame.size.width) * 0.5;
    // 保证首次进入时，mainView的形状。
    self.mainViewTop.constant = spac;
    self.mainViewBottom.constant = spac;
}

@end
