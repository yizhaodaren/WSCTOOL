//
//  testBezierPathVC.m
//  WSCTOOL
//
//  Created by apple on 2018/9/27.
//  Copyright © 2018年 WSC. All rights reserved.
//

#import "testBezierPathVC.h"
#import "testBezierPatihView.h"
@interface testBezierPathVC ()
@property (nonatomic,strong)CAShapeLayer *layer;
@property(nonatomic,strong)testBezierPatihView *bgView;
@end

@implementation testBezierPathVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.bgView = [[testBezierPatihView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.view addSubview:_bgView];
  
}
-(void)test1{
    
        UIBezierPath* path = [UIBezierPath bezierPath];
    
        path.lineWidth     = 1.f;
        path.lineCapStyle  = kCGLineCapRound;
        path.lineJoinStyle = kCGLineCapRound;
    
        [path moveToPoint:CGPointMake(0, 100)];
        // 给定终点和两个控制点绘制贝塞尔曲线
        [path addQuadCurveToPoint:CGPointMake(20, 80) controlPoint:CGPointMake(15, 95)];
        [path addLineToPoint:CGPointMake(80, 20)];
        [path addQuadCurveToPoint:CGPointMake(100, 0) controlPoint:CGPointMake(85, 5)];
        [path addLineToPoint:CGPointMake(199 , 0)];
        [path addLineToPoint:CGPointMake(199 , 100)];
        self.layer= [CAShapeLayer layer];
        self.layer.frame         = CGRectMake(0,0, 100 ,100);//self.recordButton.bounds;
        // 与showView的frame一致
        self.layer.strokeColor   = [UIColor whiteColor].CGColor;   // 边缘线的颜色
        self.layer.fillColor     = [UIColor redColor].CGColor;   // 闭环填充的颜色
        self.layer.lineCap       = kCALineCapSquare;               // 边缘线的类型
        self.layer.path          = path.CGPath;                    // 从贝塞尔曲线获取到形状
        self.layer.lineWidth     = 2.0f;                           // 线条宽度
        self.layer.strokeStart   = 0.0f;
        self.layer.strokeEnd     = 1.0f;
        [self.view.layer addSublayer:self.layer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
