//
//  BaseView.h
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/21.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AoturesizingCodeView : UIView

// 设置视图Frame。
- (void)frameWithSize:(CGSize)size;

//封装设置AutoresizingMask的方法。
- (void)autoresizingMaskOfChildView:(NSMutableArray<NSNumber *> *(^)())autoMaskArr;

@end
