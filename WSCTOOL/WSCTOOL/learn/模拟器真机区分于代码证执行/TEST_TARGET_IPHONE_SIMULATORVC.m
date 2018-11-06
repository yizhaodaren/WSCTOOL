//
//  TEST_TARGET_IPHONE_SIMULATORVC.m
//  WSCTOOL
//
//  Created by apple on 2018/11/3.
//  Copyright © 2018年 WSC. All rights reserved.
//

#import "TEST_TARGET_IPHONE_SIMULATORVC.h"

@interface TEST_TARGET_IPHONE_SIMULATORVC ()

@end

@implementation TEST_TARGET_IPHONE_SIMULATORVC

- (void)viewDidLoad {
    [super viewDidLoad];
#ifdef TARGET_IPHONE_SIMULATOR
    
//    XXXXX  模拟器时会编译的代码
 //#error 因Mac模拟器上的GPU和真机差别太大, 我们SDK暂不支持MAC系统的模拟器,请在真机上测试试用,谢谢.
#else
    
//    XXXXX  不是模拟器才会编译的代码
    
#endif

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
