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

#import "ListTableViewController.h"

@interface ListTableViewController ()

@end

@implementation ListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *listTableView = [[UITableView alloc] init];
    listTableView.delegate = self;
    listTableView.dataSource = self;
    
    self.navigationItem.title = @"屏幕适配";

    [self.view addSubview:listTableView];
}

#pragma mark - Table view data source

// 显示几组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

// 一组几行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"纯代码创建视图，使用frame布局";
            break;
        
        case 1:
            cell.textLabel.text = @"纯代码创建视图，使用autoresizing布局";
            break;
            
        case 2:
            cell.textLabel.text = @"sb创建视图,使用autoresizing布局";
            break;
            
        case 3:
            cell.textLabel.text = @"sb创建视图，使用autolayout布局";
            break;
            
        default:
            break;
    }
    
    // 显示小箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Frame
        FrameViewController *frameVC = [[FrameViewController alloc] init];

    // autoresizing
        AutoresizingViewController *autoVC = [[AutoresizingViewController alloc] init];

    // autoresizingSB
        AutoSBViewController *AutoSBVC = [[UIStoryboard storyboardWithName:@"Autoresizing" bundle:nil] instantiateViewControllerWithIdentifier:@"Autoresizing"];

    // autolayout
        AutolayoutViewController *AutolayoutVC = [[UIStoryboard storyboardWithName:@"Autolayout" bundle:nil] instantiateViewControllerWithIdentifier:@"Autolayout"];

    switch (indexPath.row) {
        case 0:
            frameVC.navigationItem.title = @"Frame";
            [self.navigationController pushViewController:frameVC animated:YES];
            break;
                
        case 1:
            autoVC.navigationItem.title = @"Autoresizing";
            [self.navigationController pushViewController:autoVC animated:YES];
            break;
                
        case 2:
            AutoSBVC.navigationItem.title = @"Autoresizing-StoryBoard";
            [self.navigationController pushViewController:AutoSBVC animated:YES];
            break;
                
        case 3:
            AutolayoutVC.navigationItem.title = @"Autolayout";
            [self.navigationController pushViewController:AutolayoutVC animated:YES];
            break;
                
        default:
            break;
    }

}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
