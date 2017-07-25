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

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    // 屏幕旋转时使BaseView在屏幕中间。且保证无论合适进入VC，BaseView都在屏幕中间。
    self.mainView.center = self.view.center;
}

#pragma mark 监听旋转。
- (void)viewDidLoad {
    [super viewDidLoad];

}

@end
