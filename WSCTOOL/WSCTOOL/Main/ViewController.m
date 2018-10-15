//
//  ViewController.m
//  WSCTOOL
//
//  Created by 徐天牧 on 2018/8/30.
//  Copyright © 2018年 WSC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    ELCVViewController * vc = [[ELCVViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
//当前控制器的抖动动画
- (void)showAnimation:(BOOL)isAnimation
{
    if (isAnimation) {
        //使用CAAnimationGroup
        //1.不透明度的变化
        CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.fromValue = @0.;
        opacityAnimation.toValue = @1.;
        opacityAnimation.duration = 0.5f;
        //2.大小的变化
        CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        //确定变化的情况
        CATransform3D startingScale = CATransform3DScale(self.view.layer.transform, 0, 0, 0);
        CATransform3D overshootScale = CATransform3DScale(self.view.layer.transform, 1.05, 1.05, 1.0);
        CATransform3D undershootScale = CATransform3DScale(self.view.layer.transform, 0.97, 0.97, 1.0);
        CATransform3D endingScale = self.view.layer.transform;
        
        NSMutableArray *scaleValues = [NSMutableArray arrayWithObject:[NSValue valueWithCATransform3D:startingScale]];
        //第二个动画的时间
        NSMutableArray *keyTimes = [NSMutableArray arrayWithObject:@0.0f];
        //添加到group里面
        NSMutableArray *timingFunctions = [NSMutableArray arrayWithObject:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
        [scaleValues addObjectsFromArray:@[[NSValue valueWithCATransform3D:overshootScale], [NSValue valueWithCATransform3D:undershootScale]]];
        //        时间累计
        [keyTimes addObjectsFromArray:@[@0.5f, @0.85f]];
        //        可以为每个动画设置不同的动画方式
        [timingFunctions addObject:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        //        最后结束的情况
        [scaleValues addObject:[NSValue valueWithCATransform3D:endingScale]];
        [keyTimes addObject:@1.0f];
        [timingFunctions addObject:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        //        赋值
        scaleAnimation.values = scaleValues;
        //        注意keytimes时间差
        scaleAnimation.keyTimes = keyTimes;
        scaleAnimation.timingFunctions = timingFunctions;
        //        CAAnimationGroup
        CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
        animationGroup.animations = @[scaleAnimation, opacityAnimation];
        animationGroup.duration = 0.6;
        [self.view.layer addAnimation:animationGroup forKey:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
