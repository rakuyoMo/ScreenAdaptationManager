//
//  BaseView.h
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/21.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView

@property (nonatomic, assign) CGFloat mainViewX;
@property (nonatomic, assign) CGFloat mainViewY;
@property (nonatomic, assign) CGFloat mainViewLength;

@property (nonatomic, weak) UIView *childView1;
@property (nonatomic, weak) UIView *childView2;
@property (nonatomic, weak) UIView *childView3;
@property (nonatomic, weak) UIView *childView4;

@property (nonatomic, weak) UIView *leftView;
@property (nonatomic, weak) UIView *rightView;

+ (instancetype)sharedManager;


@end
