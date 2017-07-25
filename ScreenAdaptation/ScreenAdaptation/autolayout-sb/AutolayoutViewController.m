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
    
    // 保证首次进入时，mainView的形状。
    [self changeMainViewConstr];
    
    NSLog(@"状态栏高：%f----naviBar高：%f",+ [UIApplication sharedApplication].statusBarFrame.size.height, self.navigationController.navigationBar.frame.size.height);
    
    NSLog(@"TopConstant:%f----BottomConstant:%f",self.mainViewTop.constant, self.mainViewBottom.constant);
    
    NSLog(@"MainViewH:%f----MainViewW:%f",self.mainView.frame.size.height, self.mainView.frame.size.width);
    
    NSLog(@"ViewH:%f----ViewW:%f",self.view.frame.size.height, self.view.frame.size.width);
    
    NSLog(@"和：%f-------space", self.mainViewTop.constant + self.mainViewBottom.constant + self.mainView.frame.size.width);
}

- (void)changeMainViewConstr {
    CGFloat space = (self.view.frame.size.height -  self.mainView.frame.size.width) / 2;
    CGFloat naviH = self.navigationController.navigationBar.frame.size.height ;
    self.mainViewTop.constant = space - naviH;
    self.mainViewBottom.constant = space + naviH;
    
//    NSLog(@"状态栏高：%f----naviBar高：%f",+ [UIApplication sharedApplication].statusBarFrame.size.height, self.navigationController.navigationBar.frame.size.height);
//    
//    NSLog(@"TopConstant:%f----BottomConstant:%f",self.mainViewTop.constant, self.mainViewBottom.constant);
//    
//    NSLog(@"MainViewH:%f----MainViewW:%f",self.mainView.frame.size.height, self.mainView.frame.size.width);
//    
//    NSLog(@"ViewH:%f----ViewW:%f",self.view.frame.size.height, self.view.frame.size.width);
//    
//    NSLog(@"和：%f-------space：%f", self.mainViewTop.constant + self.mainViewBottom.constant + self.mainView.frame.size.height,space);
}

@end
