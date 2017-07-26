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

// cell中title的Model
@property(nonatomic, strong)NSMutableArray<RootTableViewModel *> *titleModelArrM;
// cell中跳转的ViewController的Model
@property(nonatomic, strong)NSMutableArray<RootTableViewModel *> *viewContModelArrM;
// 可变数组，用来整合titleModel和ViewController的Model。
@property(nonatomic, strong)NSMutableArray<NSMutableArray *> *dataArrM;

@end

@implementation RootTableViewController

// dataArrM的get方法。
- (NSMutableArray *)dataArrM {
    if (!_dataArrM) {
        
        // 将title添加到dataArryM数组中。
        NSMutableArray *tempArr = [NSMutableArray arrayWithObjects:self.titleModelArrM, nil];
        
        _dataArrM = tempArr;
    }
    return _dataArrM;
}

// viewContModelArrM的get方法。
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
        _viewContModelArrM = [NSMutableArray arrayWithObjects:frameVCModel, autoresVCModel, autoSBVCModel, autolayVCModel, nil];
    }
    return _viewContModelArrM;
}

// titleModelArrM的get方法。
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

    return self.dataArrM[0].count;
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
    [cell setTableViewCellArrM:self.dataArrM WithIndexPathRow:indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 将VCModel添加到data数组中。
    [self.dataArrM addObject:self.viewContModelArrM];
    
    // 根据indexPath获取到对应Cell。
    RootTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    // 从Cell的data数组中取出VCModel，设置点击跳转。
    RootTableViewModel *vcModel = cell.tableViewCellArrM[1][indexPath.row];
    [self.navigationController pushViewController:vcModel.viewController animated:YES];
}

@end
