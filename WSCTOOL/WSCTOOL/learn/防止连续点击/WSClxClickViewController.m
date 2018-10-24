//
//  WSClxClickViewController.m
//  WSCTOOL
//
//  Created by apple on 2018/10/24.
//  Copyright © 2018年 WSC. All rights reserved.
//

#import "WSClxClickViewController.h"

@interface WSClxClickViewController ()

@end

@implementation WSClxClickViewController
- (IBAction)buttoActon:(id)sender {
    
    //3秒内点击 只执行一次
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(myDelayedMethod:) object:sender];
    [self performSelector:@selector(myDelayedMethod:) withObject:sender afterDelay:0.3];

}
- (void)myDelayedMethod:(UIButton *)sender {
    NSLog(@"被点击了");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
