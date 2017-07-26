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
    
//    [self.mainView setTranslatesAutoresizingMaskIntoConstraints:NO];
//
//    CGFloat spac = ((self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height - [UIApplication sharedApplication].statusBarFrame.size.height) - self.mainView.frame.size.width) * 0.5;
//    
////    NSLog(@"%@-----%@",self.mainViewTop, self.mainViewBottom);
//    
//    // 添加 width 约束
//    self.mainViewTop = [NSLayoutConstraint constraintWithItem:self.mainView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:spac];
////    [self.mainView addConstraint:mainViewTop];
//    
//    self.mainViewBottom = [NSLayoutConstraint constraintWithItem:self.mainView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-spac];
//    [self.mainView addConstraint:mainViewBottom];
//    [purpleView addConstraint:widthConstraint];
    
//    NSLog(@"%@-----%@",self.mainViewTop, self.mainViewBottom);
    
//    NSLog(@"%f----%f",self.mainView.frame.size.height, self.mainView.frame.size.width);
//    NSLog(@"%f",spac);

}

- (void)viewDidLayoutSubviews {

    // 如果View有Navigation的话，那么约束是从NaviBar的下面开始计算的，而不是从状态栏的下面或者屏幕顶部开始计算的。
    
    // 保证首次进入时，mainView的形状。
//    self.mainViewTop.constant = spac;
//    self.mainViewBottom.constant = spac;
}

@end
