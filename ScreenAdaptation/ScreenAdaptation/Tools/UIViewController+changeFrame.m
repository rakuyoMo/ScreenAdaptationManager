//
//  UIViewController+changeFrame.m
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/23.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import "UIViewController+changeFrame.h"

@implementation UIViewController (changeFrame)

#pragma mark 处理旋转。

- (void)changeViewFrameOnCrossScreen:(void(^)())CrossScreen OrVerticalScreen:(void(^)())VerticalScreen{
    
    UIDevice *divice = [UIDevice currentDevice];
 
    // 左右反
    if (divice.orientation == UIDeviceOrientationLandscapeLeft || divice.orientation == UIDeviceOrientationLandscapeRight || divice.orientation == UIDeviceOrientationPortraitUpsideDown) {
            
        CrossScreen();
        
    // 正
    } else if (divice.orientation == UIDeviceOrientationPortrait  ) {
            
        VerticalScreen();
    }
}

@end
