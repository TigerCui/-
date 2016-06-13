//
//  Circle.h
//  贝塞尔曲线
//
//  Created by 崔正清 on 16/6/12.
//  Copyright © 2016年 崔正清. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Circle : UIView
//线宽
@property (nonatomic,assign) CGFloat lineWidth;
//百分比的颜色
@property (nonatomic,strong) UIColor *percentColor;
//底部圆环颜色
@property (nonatomic,strong) UIColor *underColor;
//加载速率  此参数小于1
@property (nonatomic,assign) CGFloat rate;

/**
 *  设置要显示的百分比
 *  @percent    显示的百分比数据在0到1之间
 */
- (void)setupPercent:(CGFloat)percent;
@end
