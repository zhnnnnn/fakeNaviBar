//
//  UIViewController+fakeNaviBar.m
//  fakeNaviBar
//
//  Created by zhn on 16/6/1.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import "UIViewController+fakeNaviBar.h"
#import "fakeNaviBar.h"
#import <objc/runtime.h>

// 方法交换
void exchangeMehtod(Class class,SEL originalSel,SEL newSel){
    
    Method originalMethod = class_getInstanceMethod(class, originalSel);
    Method newMethod = class_getInstanceMethod(class, newSel);
    
    BOOL success = class_addMethod(class, originalSel, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    if (success) {
        class_replaceMethod(class, newSel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, newMethod);
    }
}

static const NSString * Kkey = @"fakeNaviBar";
@implementation UIViewController (fakeNaviBar)

+ (void)load{
    
    static dispatch_once_t onceT;
    dispatch_once(&onceT, ^{
       
        Class class = [self class];
        
        SEL viewWillAppearOriginalSEL = @selector(viewWillAppear:);
        SEL viewWillAppearNewSEL = @selector(zhn_viewWillApper:);
        
        exchangeMehtod(class, viewWillAppearOriginalSEL, viewWillAppearNewSEL);
    });
}


- (void)zhn_viewWillApper:(BOOL)animated{

    [self zhn_viewWillApper:animated];
    // navibar hidden 的情况下默认滑动返回手势没效果 需要特殊处理
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    if (self.needFakeBar) {
        [self.navigationController setNavigationBarHidden:YES animated:animated];
    }else{
        [self.navigationController setNavigationBarHidden:NO animated:animated];
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.navigationController.childViewControllers.count <= 1) {
        return NO;
    }else{
        return YES;
    }
}
#pragma mark -  set get 方法
- (void)setNeedFakeBar:(BOOL)needFakeBar{
    objc_setAssociatedObject(self, @"needfakeBar", @(needFakeBar), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)needFakeBar{
    return [objc_getAssociatedObject(self, @"needfakeBar")boolValue];
}


- (fakeNaviBar *)fakeNaviBar{
    return objc_getAssociatedObject(self, &Kkey);
}

- (void)setFakeNaviBar:(fakeNaviBar *)fakeNaviBar{
    objc_setAssociatedObject(self, &Kkey, fakeNaviBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (fakeNaviBar *)instanceFakeNaviBar{
    
    fakeNaviBar * naviBar = [[fakeNaviBar alloc]init];
    naviBar.popBlock = ^(){
        [self.navigationController popViewControllerAnimated:YES];
    };
    naviBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
    [self.view addSubview:naviBar];
    [self.view bringSubviewToFront:naviBar];
    return naviBar;
}

- (void)dealTheNaviBar{
    if (!self.fakeNaviBar) {
        self.fakeNaviBar = [self instanceFakeNaviBar];
    }
}

#pragma mark -  给外部提供的方法
- (void)zhn_setNavibarColor:(UIColor *)naviBarColor{
    [self dealTheNaviBar];
    self.fakeNaviBar.backGroundView.backgroundColor = naviBarColor;
    
}

- (void)zhn_setNavibarTitle:(NSString *)title{
    [self dealTheNaviBar];
    self.fakeNaviBar.naviBarTitle = title;
    
}
- (void)zhn_setRightBarItem:(UIView *)rightBarItem{
    [self dealTheNaviBar];
    [self.fakeNaviBar.rightNaviBarItem addSubview:rightBarItem];
}

- (void)zhn_setBarTintColor:(UIColor *)barTintColor{
    [self dealTheNaviBar];
    self.fakeNaviBar.naviBartintColor = barTintColor;
}

- (void)zhn_setNavibarAlpha:(CGFloat)alpha{
    [self dealTheNaviBar];
    self.fakeNaviBar.backGroundView.alpha = alpha;
}

- (void)zhn_setNavibarTransLationY:(CGFloat)transLationY{
    [self dealTheNaviBar];
    self.fakeNaviBar.transform = CGAffineTransformMakeTranslation(0, transLationY);
}


@end
