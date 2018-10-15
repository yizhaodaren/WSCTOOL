//
//  WSCDefine.h
//  WSCTOOL
//
//  Created by 徐天牧 on 2018/8/30.
//  Copyright © 2018年 WSC. All rights reserved.
//

#ifndef WSCDefine_h
#define WSCDefine_h



/*************************************屏幕尺寸相关*************************************/
//计算高度百分比（以iPhone6为基准）
#define kEstimateHeight(height)  (height/667.0f) * WSC_SCREEN_HEIGHT
//计算宽度百分比（以iPhone6为基准）
#define kEstimateWidth(width)   (width/375.0f) * WSC_SCREEN_WIDTH

#define WSC_SCREEN_SCALE      ([UIScreen mainScreen].scale)
// 1px线条
#define WSC_SCREEN_ONE_PIEXL (1.f/WSC_SCREEN_SCALE)
// 屏幕宽
#define WSC_SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
// 屏幕高
#define WSC_SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

// 状态栏高度
#define WSC_STATUSBAR_HEIGHT [UIApplication sharedApplication].statusBarFrame.size.height

// Status bar height.
#define  WSC_StatusBarHeight      (iPhoneX ? 44.f : 20.f)
// Navigation bar height.
#define  WSC_NavigationBarHeight  44.f
// Navigation bar safe top margin.
#define  WSC_NavBarSafeTopMargin         (iPhoneX ? 24.f : 0.f)
// Status bar & navigation bar height.
#define  WSC_StatusBarAndNavigationBarHeight  (iPhoneX ? 88.f : 64.f)
// Tabbar height.
#define  WSC_TabbarHeight         (iPhoneX ? (49.f+34.f) : 49.f)
// Tabbar safe bottom margin.
#define  WSC_TabbarSafeBottomMargin         (iPhoneX ? 34.f : 0.f)



//系统版本
/*************************************系统版本*************************************/
#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define IOS10 (SYSTEM_VERSION >= 10.0)?YES:NO
#define IOS9 (SYSTEM_VERSION >= 9.0)?YES:NO
#define IOS8 (SYSTEM_VERSION >= 8.0)?YES:NO
#define IOS7 (SYSTEM_VERSION >= 7.0)?YES:NO
#define IOS6 (SYSTEM_VERSION >= 6.0)?YES:NO

// 设备类型
/*************************************设备类型*************************************/
#define iPhoneX   ((WSC_SCREEN_HEIGHT==812)?YES:NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define iTouch ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(320, 480), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6Plus ((WSC_SCREEN_WIDTH==414)?YES:NO)
#define iPhone6   ((WSC_SCREEN_WIDTH==375)?YES:NO)
#define iPhone320 ((WSC_SCREEN_WIDTH==320)?YES:NO)
#define iPhone4 ((WSC_SCREEN_HEIGHT==480)?YES:NO)

//字体
/*************************************字体*************************************/
#define WSC_LIGHT_FONT(size) [UIFont WSC_systemFontOfSize:size weight:UIFontWeightLight]
#define WSC_REGULAR_FONT(size) [UIFont WSC_systemFontOfSize:size weight:UIFontWeightRegular]
#define WSC_MEDIUM_FONT(size) [UIFont WSC_systemFontOfSize:size weight:UIFontWeightMedium]

#define TB_10_FONT  [UIFont boldSystemFontOfSize:10]
#define TB_11_FONT  [UIFont boldSystemFontOfSize:11]
#define TB_12_FONT  [UIFont boldSystemFontOfSize:12]
#define TB_14_FONT  [UIFont boldSystemFontOfSize:14]
#define TB_16_FONT  [UIFont boldSystemFontOfSize:16]
#define TB_17_FONT  [UIFont boldSystemFontOfSize:17]
#define TB_18_FONT  [UIFont boldSystemFontOfSize:18]
#define TB_19_FONT  [UIFont boldSystemFontOfSize:19]
#define TB_20_FONT  [UIFont boldSystemFontOfSize:20]
#define TB_24_FONT  [UIFont boldSystemFontOfSize:24]

#define T8_FONT     [UIFont systemFontOfSize:8]
#define T10_FONT    [UIFont systemFontOfSize:10]
#define T11_FONT    [UIFont systemFontOfSize:11]
#define T12_FONT    [UIFont systemFontOfSize:12]
#define T13_FONT    [UIFont systemFontOfSize:13]
#define T14_FONT    [UIFont systemFontOfSize:14]
#define T15_FONT    [UIFont systemFontOfSize:15]
#define T16_FONT    [UIFont systemFontOfSize:16]
#define T17_FONT    [UIFont systemFontOfSize:17]
#define T18_FONT    [UIFont systemFontOfSize:18]
#define T20_FONT    [UIFont systemFontOfSize:20]
#define T24_FONT    [UIFont systemFontOfSize:24]
#define T25_FONT    [UIFont systemFontOfSize:25]
#define T30_FONT    [UIFont systemFontOfSize:30]
#define T35_FONT    [UIFont systemFontOfSize:35]
#define T_FONT(f)   [UIFont systemFontOfSize:(FONT_ADAPTER(f))]

#define WSC_FONT(size)    [UIFont systemFontOfSize:size]
#define WSC_THIN_FONT(size) [UIFont systemFontOfSize:size weight:UIFontWeightThin]


/*************************************颜色*************************************/
// 十六进制颜色值 使用：HEX_COLOR(0xf8f8f8)
#define HEX_COLOR_ALPHA(_HEX_,a) [UIColor colorWithRed:((float)((_HEX_ & 0xFF0000) >> 16))/255.0 green:((float)((_HEX_ & 0xFF00) >> 8))/255.0 blue:((float)(_HEX_ & 0xFF))/255.0 alpha:a]
#define HEX_COLOR(_HEX_) HEX_COLOR_ALPHA(_HEX_, 1.0)

#define HEX_COLOR_PERSONAL(_HEX_) HEX_COLOR_ALPHA(_HEX_, 0.8)

#define RGB_COLOR_ALPHA(r, g, b, a) [UIColor colorWithRed:(CGFloat)r/255.0f green:(CGFloat)g/255.0f blue:(CGFloat)b/255.0f alpha:a]
#define RGB_COLOR(r, g, b) RGB_COLOR_ALPHA(r, g, b, 1.0)


/*************************************系统信息*************************************/
#define APPName [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]





#endif /* WSCDefine_h */
