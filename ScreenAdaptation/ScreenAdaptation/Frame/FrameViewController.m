//
//  FrameViewController.m
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/21.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import "BaseView.h"
#import "FrameViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIViewController+changeFrame.h"

@interface FrameViewController ()

@property (nonatomic, weak) BaseView *mainView;

@property (nonatomic, assign) CGRect mainRec;
@property (nonatomic, assign) CGRect leftRec;
@property (nonatomic, assign) CGRect rightRec;
@property (nonatomic, assign) CGRect childView1Rec;
@property (nonatomic, assign) CGRect childView2Rec;
@property (nonatomic, assign) CGRect childView3Rec;
@property (nonatomic, assign) CGRect childView4Rec;

@end

@implementation FrameViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
#pragma mark - 初始化基础视图
    BaseView *baseView = [BaseView sharedManager];
    self.mainView = baseView;
    [self.view addSubview:self.mainView];
    
#pragma mark - 记录视图初始坐标
    CGRect tempMainRec = self.mainView.frame;
    CGRect tempLeftRec = self.mainView.leftView.frame;
    CGRect tempRightRec = self.mainView.rightView.frame;
    CGRect tempChildView1Rec = self.mainView.childView1.frame;
    CGRect tempChildView2Rec = self.mainView.childView2.frame;
    CGRect tempChildView3Rec = self.mainView.childView3.frame;
    CGRect tempChildView4Rec = self.mainView.childView4.frame;
    
    self.mainRec = tempMainRec;
    self.leftRec = tempLeftRec;
    self.rightRec = tempRightRec;
    self.childView1Rec = tempChildView1Rec;
    self.childView2Rec = tempChildView2Rec;
    self.childView3Rec = tempChildView3Rec;
    self.childView4Rec = tempChildView4Rec;

#pragma mark - 处理屏幕旋转
#pragma mark 监听旋转
    
    // 监听开始旋转
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeViewFrame) name:UIDeviceOrientationDidChangeNotification object:nil];
}

#pragma mark 处理旋转。
- (void)changeViewFrame{

    // 根据屏幕旋转方向处理视图frame.
    [self changeViewFrameOnCrossScreen:^{
        CGFloat viewWeight = self.view.frame.size.width;
        CGFloat viewHeight = self.view.frame.size.height;
        CGFloat flo = fabs((viewWeight - viewHeight) / 2);
        CGFloat naviBarHeight = self.navigationController.navigationBar.frame.size.height;
        CGFloat newLength = viewHeight - naviBarHeight;
        
        self.mainView.frame = CGRectMake(flo, naviBarHeight, newLength, newLength);
        
        self.mainView.leftView.frame = CGRectMake(0, 0, newLength / 2, newLength);
        self.mainView.rightView.frame = CGRectMake(newLength / 2, 0, newLength / 2, newLength);
        
        CGFloat baseS = 10;
        CGFloat baseX = 10;
        CGFloat baseY = 10;
        CGFloat baseH = newLength / 2 - baseY - baseS;
        CGFloat baseW = newLength / 2 - baseX - baseS;
        
        self.mainView.childView1.frame = CGRectMake(baseX, baseY, baseW, baseH);
        self.mainView.childView2.frame = CGRectMake(baseX, baseY * 2 + baseH + baseS, baseW, baseH);
        self.mainView.childView3.frame = CGRectMake(baseX, baseY, baseW, baseH);
        self.mainView.childView4.frame = CGRectMake(baseX, baseY * 2 + baseH + baseS, baseW, baseH);
        
    } OrVerticalScreen:^{
        self.mainView.frame = self.mainRec;
        
        self.mainView.leftView.frame = self.leftRec;
        self.mainView.rightView.frame = self.rightRec;
       
        self.mainView.childView1.frame = self.childView1Rec;
        self.mainView.childView2.frame = self.childView2Rec;
        self.mainView.childView3.frame = self.childView3Rec;
        self.mainView.childView4.frame = self.childView4Rec;
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
