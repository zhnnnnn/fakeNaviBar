//
//  UIViewController+fakeNaviBar.h
//  fakeNaviBar
//
//  Created by zhn on 16/6/1.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (fakeNaviBar)<UIGestureRecognizerDelegate>
/**
 *  设置navibar的颜色
 *
 *  @param naviBarColor 颜色
 */
- (void)zhn_setNavibarColor:(UIColor *)naviBarColor;
/**
 *  设置navibar的透明度
 *
 *  @param alpha 透明度
 */
- (void)zhn_setNavibarAlpha:(CGFloat)alpha;
/**
 *  设置navibar的标题
 *
 *  @param title 标题
 */
- (void)zhn_setNavibarTitle:(NSString *)title;
/**
 *  设置navibar向上移动的距离
 *
 *  @param transLationY 移动距离
 */
- (void)zhn_setNavibarTransLationY:(CGFloat)transLationY;
/**
 *  设置 返回按钮 返回标题 标题 的颜色
 *
 *  @param barTintColor 颜色
 */
- (void)zhn_setBarTintColor:(UIColor *)barTintColor;
/**
 *  自定义右边的navibaritem 右边预留了一个 width = 100 height = 30 的view 你传递的这个值需要设置frame ，frame 用那个长宽做一个参照设置
 *
 *  @param rightBarItem 自定义navibarrightitem
 */
- (void)zhn_setRightBarItem:(UIView *)rightBarItem;
/**
 *  上面那些方法都是要配合这个属性 如果你需要用到渐变navibar而且你需要比较自然的切换的效果 这个值必须设置为yes
 */
@property (nonatomic,assign) BOOL needFakeBar;
@end
