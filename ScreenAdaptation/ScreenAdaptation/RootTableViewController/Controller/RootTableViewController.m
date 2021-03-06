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

// 可变数组，用来整合title和ViewController的Model属性。
@property(nonatomic, strong)NSMutableArray<RootTableViewModel *> *dataModelArrM;

@end

@implementation RootTableViewController

// dataArrM的get方法。
- (NSMutableArray *)dataModelArrM {
    
    if (!_dataModelArrM) {
        // Frame
        FrameViewController *frameVC = [[FrameViewController alloc] init];
        RootTableViewModel *frameModel = [RootTableViewModel modelWithViewController:frameVC title:@"纯代码创建视图，使用frame布局"];
        
        // autoresizing
        AutoresizingViewController *autoresVC = [[AutoresizingViewController alloc] init];
        RootTableViewModel *autoresModel = [RootTableViewModel modelWithViewController:autoresVC title:@"纯代码创建视图，使用autoresizing布局"];
        
        // autoresizingSB
        AutoSBViewController *autoSBVC = [[UIStoryboard storyboardWithName:@"Autoresizing" bundle:nil] instantiateViewControllerWithIdentifier:@"Autoresizing"];
        RootTableViewModel *autoSBModel = [RootTableViewModel modelWithViewController:autoSBVC title:@"sb创建视图,使用autoresizing布局"];
        
        // autolayout
        AutolayoutViewController *autolayoutVC = [[UIStoryboard storyboardWithName:@"Autolayout" bundle:nil] instantiateViewControllerWithIdentifier:@"Autolayout"];
        RootTableViewModel *autolayoutModel = [RootTableViewModel modelWithViewController:autolayoutVC title:@"sb创建视图，使用autolayout布局"];
        
        // 将数据模型放入可变数组中存储。方便调用。
        self.dataModelArrM = [NSMutableArray arrayWithObjects:frameModel, autoresModel, autoSBModel, autolayoutModel, nil];
    }
    return _dataModelArrM;
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

    return self.dataModelArrM.count;
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
    cell.tableViewCellModel = self.dataModelArrM[indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 设置点击跳转。
    RootTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [self.navigationController pushViewController:cell.tableViewCellModel.viewController animated:YES];

}

@end
