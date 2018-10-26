//
//  TEST_runtime.m
//  WSCTOOL
//
//  Created by apple on 2018/10/26.
//  Copyright © 2018年 WSC. All rights reserved.
//

#import "TEST_runtime.h"
#import <objc/runtime.h>
@interface TEST_runtime ()

@end

@implementation TEST_runtime

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    2、获取某个类的成员变量或则属性；
    
    
    unsigned int numIvars; //成员变量个数
    
Ivar *vars = class_copyIvarList(NSClassFromString(@"UIView"), &numIvars);
    
//Ivar *vars = class_copyIvarList([UIView class], &numIvars);
NSString *key=nil;
for(int i = 0; i < numIvars; i++) {
   Ivar thisIvar = vars[i];
   NSLog(@"variable name :%@", key);
   key = [NSString stringWithUTF8String:ivar_getTypeEncoding(thisIvar)]; //获取成员变量的数据类型
    NSLog(@"variable type :%@", key);
 }
    
free(vars);
    
//    3、获取成员函数
 Method *meth = class_copyMethodList(NSClassFromString(@"UIView"), &numIvars);
  //Method *meth = class_copyMethodList([UIView class], &numIvars);
   for(int i = 0; i < numIvars; i++) {
  Method thisIvar = meth[i];
    SEL sel = method_getName(thisIvar);
   const char *name = sel_getName(sel);
  NSLog(@"zp method :%s", name);
    }
   free(meth);
    
    
    //KVC 修改
    
    //        [pageControl setValue:[UIImage imageNamed:@"rc_music_library1"] forKeyPath:@"_currentPageImage"];
    //        [pageControl setValue:[UIImage imageNamed:@"rc_music_library1"] forKeyPath:@"_pageImage"];
    
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
