//
//  fakeNaviBar.m
//  fakeNaviBar
//
//  Created by zhn on 16/6/1.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import "fakeNaviBar.h"


@interface fakeNaviBar()
@property (nonatomic,weak) UILabel * naviBarTitleLabel;
@end
/**
 *  右边预留的自定义navibaritem的宽度
 */
static const CGFloat rightBarItemWidth = 100;

@implementation fakeNaviBar{
    
    UIView * arrowBackView;
    UIView * arrowView;
    UIButton * arrowBackButton;
    UILabel * arrowTitleView;
    CAShapeLayer * arrowLayer;
    
}
- (instancetype)init{
    
    if (self = [super init]) {
        [self initialize];
    }
    return self;
}


- (void)initialize{
    // navibar的背景
    UIView * backGroundView = [[UIView alloc]init];
    [self addSubview:backGroundView];
    self.backGroundView = backGroundView;
    // 左边navibaritem的背景
    UIView * arrowBack = [[UIView alloc]init];
    [self addSubview:arrowBack];
    arrowBackView = arrowBack;
    // 左边navibaritem的箭头
    UIView * arrow = [[UIView alloc]init];
    [arrowBackView addSubview:arrow];
    arrowView = arrow;
    // 左边navibaritem的标题 这里默认是返回
    UILabel * titleView = [[UILabel alloc]init];
    [arrowBackView addSubview:titleView];
    arrowTitleView = titleView;
    arrowTitleView.text = @"返回";
    arrowTitleView.textColor = [UIColor whiteColor];
    arrowTitleView.textAlignment = NSTextAlignmentLeft;
    // 添加一个按钮响应事件
    UIButton * arrowBottomButton = [[UIButton alloc]init];
    arrowBackButton = arrowBottomButton;
    [arrowBackButton addTarget:self action:@selector(clickBackButton) forControlEvents:UIControlEventTouchUpInside];
    [arrowBack addSubview:arrowBottomButton];
    // 中间navibar的标题
    UILabel * naviBarTitleLabel = [[UILabel alloc]init];
    [self addSubview:naviBarTitleLabel];
    self.naviBarTitleLabel = naviBarTitleLabel;
    self.naviBarTitleLabel.font = [UIFont systemFontOfSize:20];
    self.naviBarTitleLabel.textColor = [UIColor whiteColor];
    
    // 右边的navibaritem 预留个位置给自定义
    UIView * rightNaviBarItem = [[UIView alloc]init];
    self.rightNaviBarItem = rightNaviBarItem;
    [self addSubview:rightNaviBarItem];
    
    // 箭头 直接画了不用图片了
    CAShapeLayer * arrLayer = [CAShapeLayer layer];
    arrowLayer = arrLayer;
    arrLayer.strokeColor = [UIColor whiteColor].CGColor;
    arrLayer.fillColor = [UIColor clearColor].CGColor;
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(13, 0)];
    [path addLineToPoint:CGPointMake(0, 10.5)];
    [path addLineToPoint:CGPointMake(13, 21)];
    arrLayer.path = path.CGPath;
    arrLayer.lineWidth = 2;
    [arrowView.layer addSublayer:arrLayer];
    
}

- (void)clickBackButton{
    
    if (self.popBlock) {
        self.popBlock();
    }
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.backGroundView.frame = self.bounds;
    
    arrowBackView.frame = CGRectMake(12, 5 + 24, 60, 30);
    
    arrowBackButton.frame = arrowBackView.bounds;
    
    arrowView.frame = CGRectMake(0, 4.5, 13, 21);
    
    arrowTitleView.frame = CGRectMake(27, 4.5, 50, 21);
    
    self.rightNaviBarItem.frame = CGRectMake(self.frame.size.width - (rightBarItemWidth + 12), 5 + 24, rightBarItemWidth, 30);
}

- (void)setNaviBarTitle:(NSString *)naviBarTitle{
    _naviBarTitle = naviBarTitle;
    self.naviBarTitleLabel.text = naviBarTitle;
    CGRect titleLabelRect = [self.naviBarTitle boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 30) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:20]}context:nil];
    self.naviBarTitleLabel.center = CGPointMake(self.frame.size.width/2, 44);
    self.naviBarTitleLabel.bounds = titleLabelRect;
}

- (void)setNaviBartintColor:(UIColor *)naviBartintColor{
    _naviBartintColor = naviBartintColor;
    
    arrowLayer.strokeColor = naviBartintColor.CGColor;
    arrowTitleView.textColor = naviBartintColor;
    self.naviBarTitleLabel.textColor = naviBartintColor;
    
}


@end
