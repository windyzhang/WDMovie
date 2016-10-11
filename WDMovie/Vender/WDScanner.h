//
//  WDScanner.h
//  WDMovie
//
//  Created by WindyZhang on 16/10/9.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CompletionCallBack)(NSString *string);

@interface WDScanner : NSObject

@property (nonatomic, copy) CompletionCallBack completionBlock;// 完成回调

// 使用视图实例化扫描器，扫描预览窗口会添加到指定视图中
//
// @param view       指定的视图
// @param scanFrame  扫描范围
// @param completion 完成回调

- (instancetype)initWithView:(UIView *)view scanFrame:(CGRect)scanFrame;

// 扫描图像
//
// @param image 包含二维码的图像
// @remark 目前只支持 64 位的 iOS 设备
//+ (void)scaneImage:(UIImage *)image completion:(void (^)(NSArray *values))completion;

// 使用 string / 头像 异步生成二维码图像
//
// @param string     二维码图像的字符串
// @param avatar     头像图像，默认比例 0.2
// @param completion 完成回调
//+ (void)qrImageWithString:(NSString *)string avatar:(UIImage *)avatar completion:(void (^)(UIImage *image))completion;

// 使用 string / 头像 异步生成二维码图像，并且指定头像占二维码图像的比例
//
// @param string     二维码图像的字符串
// @param avatar     头像图像
// @param scale      头像占二维码图像的比例
// @param completion 完成回调
//+ (void)qrImageWithString:(NSString *)string avatar:(UIImage *)avatar scale:(CGFloat)scale completion:(void (^)(UIImage *))completion;

// 开始扫描
- (void)startScan;
// 停止扫描
- (void)stopScan;

@end
