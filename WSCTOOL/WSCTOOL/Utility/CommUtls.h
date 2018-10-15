//
//  CommUtls.h
//  WSCTOOL
//
//  Created by 徐天牧 on 2018/8/30.
//  Copyright © 2018年 WSC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CommUtls : NSObject

//转换颜色色值
+(UIColor *)colorWithHexString:(NSString *)stringToConvert;
+(NSString *)getDeviceBounds;
+(UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;
+ (NSURL *)getURLFromString:(NSString *)str;
+(NSString *)checkNullValueForString:(id)object;
//检测是否是手机号码
+ (BOOL)isMobileNumber:(NSString *)mobileNum;
//检验是否为有效邮箱
+(BOOL)isValidateEmail:(NSString *)email;
//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard;
//检查是否有效网址
+(BOOL)isValidateURL:(NSString *)url;
+ (void)telePhone;
+(UIImage*)createImageWithColor:(UIColor*) color;
+ (NSString *)timeConvertoString:(NSString *)time;//时间戳转换成时间
+ (NSString *)getSha1String:(NSString *)srcString;

+ (NSString *)toJSONData:(id)theData;

//键盘首响应  键盘是否开启
+(BOOL)TTIsKeyboardVisible;
//编码
+(NSString *)encodeToPercentEscapeString: (NSString *) input;

//解码
+(NSString *)decodeFromPercentEscapeString: (NSString *) input;

+(NSString *)getTimeToShowWithTimestamp:(NSString *)timestamp;//转时间戳，不带时间

// 获取当前最上层的控制器
+(UIViewController *)topViewController;

//打印字体的类型
+(void)showFontType;
//把秒转换成 分秒 03:45
+(NSString *)convertToMSStringWithS:(NSTimeInterval)time;
// 获得Info.plist数据字典
+(NSDictionary *)getInfoDictionary;


//改变图片的颜色
+(UIImage *)Chanage:(UIImage *)image WithColor:(UIColor *)color;
// 获取视频／音频文件的总时长
+ (CGFloat)getFileDuration:(NSURL*)URL;
@end
