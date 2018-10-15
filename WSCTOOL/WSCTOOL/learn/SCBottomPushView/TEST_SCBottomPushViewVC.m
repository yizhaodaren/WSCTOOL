//
//  TEST_SCBottomPushViewVC.m
//  WSCTOOL
//
//  Created by apple on 2018/10/15.
//  Copyright © 2018年 WSC. All rights reserved.
//

#import "TEST_SCBottomPushViewVC.h"
#import "MOLClipMusicView.h"
@interface TEST_SCBottomPushViewVC ()
@property(nonatomic,strong)MOLClipMusicView  *pushView;
@end

@implementation TEST_SCBottomPushViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.pushView = [[MOLClipMusicView alloc] initWithCustomH:200 showBottom:YES];
    // Do any additional setup after loading the view.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.pushView showInView:self.view];
    
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
