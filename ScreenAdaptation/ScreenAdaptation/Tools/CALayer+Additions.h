//
//  CALayer+Additions.h
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/21.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CALayer (Additions)

#warning 这里用weak好像不太合适。
@property (nonatomic, weak)UIColor *borderUIColor;

@end
