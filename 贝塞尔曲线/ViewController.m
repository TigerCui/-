//
//  ViewController.m
//  贝塞尔曲线
//
//  Created by 崔正清 on 16/6/12.
//  Copyright © 2016年 崔正清. All rights reserved.
//

#import "ViewController.h"
#import "Circle.h"

@interface ViewController ()
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,weak) Circle *v;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Circle *circle = [[Circle alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)];
    circle.backgroundColor = [UIColor clearColor];
    [self.view addSubview:circle];
    circle.lineWidth = self.view.frame.size.width/2;
    circle.percentColor = [UIColor redColor];
    circle.underColor = [UIColor yellowColor];
    circle.rate = 0.01;
    [circle setupPercent:0.5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
