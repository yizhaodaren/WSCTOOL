//
//  testlayoutVC.m
//  WSCTOOL
//
//  Created by apple on 2018/10/15.
//  Copyright © 2018年 WSC. All rights reserved.
//

#import "testlayoutVC.h"
#import "UIView+layout.h"

@interface testlayoutVC ()

@end

@implementation testlayoutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
   UIView *view1 = [[UIView alloc] init];
    view1.left = 30;
    view1.width = 300;
    view1.height = 50;
    view1.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:view1];
    
}

-(void)showView{
    UIView *view = [[UIView alloc] init];
    view.width = 300;
    view.height = 300;
    view.backgroundColor = [UIColor greenColor];
    [self.view presentView:view animated:YES complete:nil];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self showView];
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
