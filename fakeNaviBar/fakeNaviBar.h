//
//  fakeNaviBar.h
//  fakeNaviBar
//
//  Created by zhn on 16/6/1.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^naviBarPopControllerBlock)();

@interface fakeNaviBar : UIView
/**
 *  背景 主要用来控制背景色 和 背景透明度
 */
@property (nonatomic,weak) UIView * backGroundView;
/**
 *  navibar的标题
 */
@property (nonatomic,copy) NSString * naviBarTitle;
/**
 *  右边预留的自定义navibaritem
 */
@property (nonatomic,weak) UIView * rightNaviBarItem;
/**
 *  tintcolor 包括 返回箭头按钮颜色 标题颜色 返回标题的颜色 ，不设置颜色默认是白色
 */
@property (nonatomic,strong) UIColor * naviBartintColor;
/**
 *  按钮回调
 */
@property (nonatomic,copy) naviBarPopControllerBlock popBlock;
@end
