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

#warning - This position doesn't seem to fit well with "weak".
@property (nonatomic, weak)UIColor *borderUIColor;

@end
