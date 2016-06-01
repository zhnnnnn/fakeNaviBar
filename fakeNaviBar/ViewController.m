//
//  ViewController.m
//  fakeNaviBar
//
//  Created by zhn on 16/6/1.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import "ViewController.h"
#import "secondVC.h"
#import "UIViewController+fakeNaviBar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
    self.title = @"eeadadadadadadaadada";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pushVC:(id)sender {
    
    secondVC * sVC = [[secondVC alloc]init];
    [self.navigationController pushViewController:sVC animated:YES];
}

@end
