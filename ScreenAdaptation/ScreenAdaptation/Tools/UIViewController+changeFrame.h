//
//  UIViewController+changeFrame.h
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/23.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (changeFrame)

- (void)changeViewFrameOnCrossScreen:(void(^)())CrossScreen OrVerticalScreen:(void(^)())VerticalScreen;



@end
