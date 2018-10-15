//
//  testBezierPatihView.m
//  WSCTOOL
//
//  Created by apple on 2018/9/27.
//  Copyright © 2018年 WSC. All rights reserved.
//



//// 创建基本路径
//+ (instancetype)bezierPath;
//// 创建矩形路径
//+ (instancetype)bezierPathWithRect:(CGRect)rect;
//// 创建椭圆路径
//+ (instancetype)bezierPathWithOvalInRect:(CGRect)rect;
//// 创建圆角矩形
//+ (instancetype)bezierPathWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius; // rounds all corners with the same horizontal and vertical radius
//// 创建指定位置圆角的矩形路径
//+ (instancetype)bezierPathWithRoundedRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;
//// 创建弧线路径
//+ (instancetype)bezierPathWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;
//// 通过CGPath创建
//+ (instancetype)bezierPathWithCGPath:(CGPathRef)CGPath;

    
#import "testBezierPatihView.h"

@implementation testBezierPatihView

- (void)drawRect:(CGRect)rect {
     [self draw9];
    
    

}


//https://www.jianshu.com/p/6c9aa9c5dd68 简书
//画直线
-(void)drawLine{
    [[UIColor redColor] set];
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    path.lineWidth     = 5.f;
    path.lineCapStyle  = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    // 起点
    [path moveToPoint:CGPointMake(20, 100)];
    
    // 绘制线条
    [path addLineToPoint:CGPointMake(200, 20)];
    
    [path stroke];
}
//矩形
-(void)draw2{
    [[UIColor redColor] set];
    // 创建矩形路径对象
    UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 150, 100)];
    
    path.lineWidth     = 5.f;
    path.lineCapStyle  = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    [path stroke];

}
//圆角矩形
-(void)draw3{
    [[UIColor redColor] set];
    // 创建圆角矩形路径对象
    UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, 150, 100) cornerRadius:30]; // 圆角半径为30
    
    path.lineWidth     = 5.f;
    path.lineCapStyle  = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    [path stroke];
    
}
//指定位置圆角矩形
-(void)draw4{
    [[UIColor redColor] set];
    
    UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, 150, 150) byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(65, 65)];
    
    path.lineWidth     = 5.f;
    path.lineCapStyle  = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    [path stroke];
  
//    typedef NS_OPTIONS(NSUInteger, UIRectCorner) {
//        UIRectCornerTopLeft     = 1 << 0,
//        UIRectCornerTopRight    = 1 << 1,
//        UIRectCornerBottomLeft  = 1 << 2,
//        UIRectCornerBottomRight = 1 << 3,
//        UIRectCornerAllCorners  = ~0UL
//    };

}
//圆形
-(void)draw5{
    [[UIColor redColor] set];
    // 创建圆形路径对象
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 100, 100)];
    
    path.lineWidth     = 5.f;
    path.lineCapStyle  = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    [path stroke];
  
    
}
//椭圆形
-(void)draw6{
    [[UIColor redColor] set];
    // 创建椭圆形路径对象
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 180, 100)];
    
    path.lineWidth     = 5.f;
    path.lineCapStyle  = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    [path stroke];
    
}
//弧线
-(void)draw7{
    [[UIColor redColor] set];
    // 创建弧线路径对象
    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100)
                                                        radius:70
                                                    startAngle:3.1415926
                                                      endAngle:3.1415926 *3/2
                                                     clockwise:YES];
    
    path.lineWidth     = 5.f;
    path.lineCapStyle  = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    [path stroke];
//    center：弧线圆心坐标
//    radius：弧线半径
//    startAngle：弧线起始角度
//    endAngle：弧线结束角度
//    clockwise：是否顺时针绘制

}
//贝塞尔曲线1
-(void)draw8{
    [[UIColor redColor] set];
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    path.lineWidth     = 5.f;
    path.lineCapStyle  = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    [path moveToPoint:CGPointMake(20, 100)];
    // 给定终点和控制点绘制贝塞尔曲线
    [path addQuadCurveToPoint:CGPointMake(150, 100) controlPoint:CGPointMake(20, 0)];

    
    [path stroke];
   
}
//贝塞尔曲线2`
-(void)draw9{
    [[UIColor redColor] set];
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    path.lineWidth     = 1.f;
    path.lineCapStyle  = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    [path moveToPoint:CGPointMake(0, 100)];
    // 给定终点和两个控制点绘制贝塞尔曲线

    [path addCurveToPoint:CGPointMake(100, 0) controlPoint1:CGPointMake(25, 95) controlPoint2:CGPointMake(75, 5)];
    
    [path stroke];
    
}
//扇形
-(void)draw10{
    [[UIColor redColor] set]; // 画笔颜色设置
    
    UIBezierPath * path = [UIBezierPath bezierPath]; // 创建路径
    
    [path moveToPoint:CGPointMake(100, 100)]; // 设置起始点
    
    [path addArcWithCenter:CGPointMake(100, 100) radius:50 startAngle:0 endAngle:3.14159/2 clockwise:NO]; // 绘制一个圆弧
    
    path.lineWidth     = 5.0;
    path.lineCapStyle  = kCGLineCapRound; //线条拐角
    path.lineJoinStyle = kCGLineCapRound; //终点处理
    
    [path closePath]; // 封闭未形成闭环的路径
    
    [path stroke]; // 绘制
//    [path fill];
    
}
//多边形
-(void)draw11{
    [[UIColor redColor] set];
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    path.lineWidth     = 5.f;
    path.lineCapStyle  = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    
    // 起点
    [path moveToPoint:CGPointMake(100, 50)];
    
    // 添加直线
    [path addLineToPoint:CGPointMake(150, 50)];
    [path addLineToPoint:CGPointMake(200, 100)];
    [path addLineToPoint:CGPointMake(200, 150)];
    [path addLineToPoint:CGPointMake(150, 200)];
    [path addLineToPoint:CGPointMake(100, 200)];
    [path addLineToPoint:CGPointMake(50, 150)];
    [path addLineToPoint:CGPointMake(50, 100)];
    [path closePath];
    
    //根据坐标点连线
    [path stroke];
    [path fill];

    
}
@end
