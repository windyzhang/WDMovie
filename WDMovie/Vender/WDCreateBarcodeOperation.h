//
//  WDCreateBarcodeOperation.h
//  WDMovie
//
//  Created by WindyZhang on 2017/3/31.
//  Copyright © 2017年 feeyo. All rights reserved.
//

#import <Foundation/Foundation.h>

#define WD_CREATEBARCODE_OPERATION [WDCreateBarcodeOperation sharedWDCreateBarcodeOperation]

@interface WDCreateBarcodeOperation : NSObject

+ (WDCreateBarcodeOperation *)sharedWDCreateBarcodeOperation;

- (void)createBarcodeImageWithString:(NSString *)qrcode
                withBarcodeImageView:(UIImageView *)barcodeImageView
                     withBarcodeSize:(CGFloat)size;

- (UIImage *)decodedImageWithBase64String:(NSString *)imgStr;

@end
