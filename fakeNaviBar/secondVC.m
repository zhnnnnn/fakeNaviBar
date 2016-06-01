//
//  secondVC.m
//  fakeNaviBar
//
//  Created by zhn on 16/6/1.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import "secondVC.h"
#import "UIViewController+fakeNaviBar.h"
#import <objc/runtime.h>
@implementation secondVC

- (void)viewDidLoad{
#warning  不能用tableviewcontroller 和 uicollectionviewtroller 之类的 必须是tableviewcontroller ，然后设置color alpha 之类的必须在tableview加载到view上之后。
    [super viewDidLoad];
    UITableView * backTableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:backTableView];
    backTableView.delegate = self;
    backTableView.dataSource = self;
    
    self.needFakeBar = YES;
    [self zhn_setNavibarColor:[UIColor redColor]];
    [self zhn_setNavibarTitle:@"啊哈"];
    [self zhn_setBarTintColor:[UIColor whiteColor]];
    
   
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.y < 200 && scrollView.contentOffset.y > 0) {
        CGFloat scale = 1 - scrollView.contentOffset.y / 200;
        
//        [self zhn_setNavibarTransLationY: - 65 * (1-scale)];
        [self zhn_setNavibarAlpha:scale];
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [[UITableViewCell alloc]init];
    CGFloat temp =  arc4random()%255;
    cell.backgroundColor = [UIColor colorWithRed:temp/255.0 green:temp/255.0 blue:temp/255.0 alpha:1.0];
    return cell;
}



@end
