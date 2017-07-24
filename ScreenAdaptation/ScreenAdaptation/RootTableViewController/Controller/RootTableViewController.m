//
//  ListTableViewController.m
//  ScreenAdaptation
//
//  Created by Rakuyo on 2017/7/21.
//  Copyright © 2017年 Rakuyo. All rights reserved.
//

#import "FrameViewController.h"
#import "AutoSBViewController.h"
#import "AutolayoutViewController.h"
#import "AutoresizingViewController.h"

#import "RootTableViewCell.h"
#import "RootTableViewModel.h"
#import "RootTableViewController.h"

@interface RootTableViewController ()

@property(nonatomic, strong)NSMutableArray *titleModelArrM;
@property(nonatomic, strong)NSMutableArray *viewContModelArrM;
//@property(nonatomic, strong)NSMutableArray *dataModelArrM;

@end

@implementation RootTableViewController

// dataModelArrM的set方法。
//- (NSMutableArray *)dataModelArrM {
//
//    if (!_dataModelArrM) {
//
//        self.dataModelArrM = [NSMutableArray arrayWithObjects:self.titleModelArrM, self.viewContModelArrM, nil];
//
//        RootTableViewModel *frameModel = [RootTableViewModel modelWithViewController:frameVC title:@"纯代码创建视图，使用frame布局"];
//
//        RootTableViewModel *autoresModel = [RootTableViewModel modelWithViewController:autoresVC title:@"纯代码创建视图，使用autoresizing布局"];
//
//        RootTableViewModel *autoSBModel = [RootTableViewModel modelWithViewController:autoSBVC title:@"sb创建视图,使用autoresizing布局"];
//
//        RootTableViewModel *autolayoutModel = [RootTableViewModel modelWithViewController:autolayoutVC title:@"sb创建视图，使用autolayout布局"];
//
//        self.dataModelArrM = [NSMutableArray arrayWithObjects:frameModel, autoresModel, autoSBModel, autolayoutModel, nil];
//    }
//
//    return _dataModelArrM;
//}

// viewContModelArrM的set方法。
- (NSMutableArray *)viewContModelArrM {
    if (!_viewContModelArrM) {
        
        // frame
        FrameViewController *frameVC = [[FrameViewController alloc] init];
        RootTableViewModel *frameVCModel = [RootTableViewModel modelWithViewController:frameVC];

        // autoresizing
        AutoresizingViewController *autoresVC = [[AutoresizingViewController alloc] init];
        RootTableViewModel *autoresVCModel = [RootTableViewModel modelWithViewController:autoresVC];

        // autoresizingSB
        AutoSBViewController *autoSBVC = [[UIStoryboard storyboardWithName:@"Autoresizing" bundle:nil] instantiateViewControllerWithIdentifier:@"Autoresizing"];
        RootTableViewModel *autoSBVCModel = [RootTableViewModel modelWithViewController:autoSBVC];

        // autolayout
        AutolayoutViewController *autolayoutVC = [[UIStoryboard storyboardWithName:@"Autolayout" bundle:nil] instantiateViewControllerWithIdentifier:@"Autolayout"];
        RootTableViewModel *autolayVCModel = [RootTableViewModel modelWithViewController:autolayoutVC];

        // 将数据模型放入可变数组中存储。方便调用。
        self.viewContModelArrM = [NSMutableArray arrayWithObjects:frameVCModel, autoresVCModel, autoSBVCModel, autolayVCModel, nil];
    }
    return _viewContModelArrM;
}

// titleModelArrM的set方法。
- (NSMutableArray *)titleModelArrM {
    
    if (!_titleModelArrM) {
        // Frame
        RootTableViewModel *frameTitleModel = [RootTableViewModel modelWithTitle:@"纯代码创建视图，使用frame布局"];
        
        // autoresizing
        RootTableViewModel *autoresTitleModel = [RootTableViewModel modelWithTitle:@"纯代码创建视图，使用autoresizing布局"];
        
        // autoresizingSB
        RootTableViewModel *autoSBTitleModel = [RootTableViewModel modelWithTitle:@"sb创建视图,使用autoresizing布局"];
        
        // autolayout
        RootTableViewModel *autolayTitleModel = [RootTableViewModel modelWithTitle:@"sb创建视图，使用autolayout布局"];

        // 将数据模型放入可变数组中存储。方便调用。
        self.titleModelArrM = [NSMutableArray arrayWithObjects:frameTitleModel, autoresTitleModel, autoSBTitleModel, autolayTitleModel, nil];

    }
    return _titleModelArrM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"屏幕适配";
}

#pragma mark - Table view data source

// 显示几组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

// 一组几行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.viewContModelArrM.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 设置cell标识
    static NSString *cellIdent = @"cell";
    
    // 重用cell
    RootTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdent];

    if (cell == nil) {
        cell = [[RootTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdent];
    }
    
    // 设置模型数据。
    cell.tableViewCellModel = self.titleModelArrM[indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 设置点击跳转。
    RootTableViewModel *vcModel = self.viewContModelArrM[indexPath.row];
    [self.navigationController pushViewController:vcModel.viewController animated:YES];
}


@end
