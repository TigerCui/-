//
//  Circle.m
//  贝塞尔曲线
//
//  Created by 崔正清 on 16/6/12.
//  Copyright © 2016年 崔正清. All rights reserved.
//

#import "Circle.h"

@interface Circle ()
@property (nonatomic,assign) CGFloat percent;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,assign) CGFloat tempPercent;
@end

@implementation Circle


#pragma mark - set方法
- (void)setPercent:(CGFloat)percent {
    _percent = percent;
    [self setNeedsDisplay];
}

- (void)setLineWidth:(CGFloat)lineWidth {
    _lineWidth = lineWidth;
    [self setNeedsDisplay];
}

- (void)setPercentColor:(UIColor *)percentColor {
    _percentColor = percentColor;
    [self setNeedsDisplay];
}

- (void)setUnderColor:(UIColor *)underColor {
    _underColor = underColor;
    [self setNeedsDisplay];
}

#pragma mark - 设置百分比
- (void)setupPercent:(CGFloat)percent {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:self.rate target:self selector:@selector(chagePercent:) userInfo:nil repeats:YES];
    _timer = timer;
    _tempPercent = percent;
}

- (void)chagePercent:(id)sender {
    self.percent = self.percent + 0.01;
    if (self.percent >= self.tempPercent) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

//初始渲染
- (void)drawRect:(CGRect)rect {
    //实例化贝塞尔曲线
    UIBezierPath *path = [UIBezierPath bezierPath];
    //设置圆心
    CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    //设置半径
    CGFloat radius = MIN(self.frame.size.width, self.frame.size.height)/2-_lineWidth/2;
    //根据上面的圆心和半径设置贝塞尔曲线的路劲
    [path addArcWithCenter:center radius:radius startAngle:M_PI_2*3 endAngle:M_PI_2*3+2*M_PI clockwise:YES];
    [self.underColor setStroke];
    path.lineWidth = _lineWidth;
    [path stroke];
    
    //实例化贝塞尔曲线
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    //根据上面的圆心和半径设置贝塞尔曲线的路劲
    [path1 addArcWithCenter:center radius:radius startAngle:M_PI_2*3 endAngle:M_PI_2*3+2*M_PI*_percent clockwise:YES];
    [self.percentColor setStroke];
    path1.lineWidth = _lineWidth+0.3;
    path1.lineJoinStyle = kCGLineCapRound;
    [path1 stroke];
}


@end
