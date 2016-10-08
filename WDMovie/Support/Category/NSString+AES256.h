//
//  NSString+AES256.h
//  WDMovie
//
//  Created by WindyZhang on 16/9/30.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@interface NSString (AES256)

-(NSString *)aes256_encrypt:(NSString *)key;
-(NSString *)aes256_decrypt:(NSString *)key;

@end
