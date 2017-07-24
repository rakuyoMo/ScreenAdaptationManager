//
//  AutolayoutViewController.h
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/21.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutolayoutViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mainViewTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mainViewBottom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mainViewLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mainViewRight;

@end
