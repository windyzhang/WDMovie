//
//  WDBarCodeViewController.m
//  WDMovie
//
//  Created by WindyZhang on 16/10/8.
//  Copyright © 2016年 feeyo. All rights reserved.
//

#import "WDBarCodeViewController.h"
#import "WDCreateBarcodeOperation.h"
#import <CoreImage/CoreImage.h>

@interface WDBarCodeViewController ()
@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation WDBarCodeViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setNavigationBarStyle:HistoryStyle];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WD_COLOR.background;
    self.title = @"二维码";
    
    NSString *dataString = @"iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAIAAAAiOjnJAAAELElEQVR42u3cUW7jMAwE0N7/0t0D7GIRk0NFlt58Nmni2C8AO5b68ysykB+nQMASsAQsEbAELAFLBCwBS8D698O9/Od1PnmLT47n74ean+KjsxZ6r9q7gwUWWGCB9RVYz170g6v+iGPzJzWXj145fsbAAgsssMDaFlYNRPNq1aacuSta+4C1MwYWWGCBBdYZsGpVwoJ5JX48YIEFFlhggfWtASh12WrfCrDAAgsssO6BlQLxaOqKv87K35prPcACCyywwFoJK7Ue656fWI8FFlhggXUGrNjbhNr52pObPchVIMACCyywwOr8yZ26a1sj25SaesF4fwEWWGCBBdYmM1ac0dxsFKc2V0Dc27yDBRZYYB1RN8T/f0Gzd0h9PeLFyg0TFVhggQXWnTPWSmFzl625t/bRoBlfxQUWWGCBBdZXZqxa8968jzt33ufuhd+5DAsssMAC6zxYzRGkdiHn7vXG6/WmFasbwAILLLBeDatWLqT+dE+NMvH9paliBSywwAILrDfOWLUZolk3xJcCzym8wRNYYIEFFliFU5k63ak9sXPvfoMnsMACC6zzYDUHhUcXsrZYObWgqtkyxA8VLLDAAgusbWes2pjSXH21fzuQupEAFlhggQXWi2asuRVIK1dEpYTN7T4CCyywwALrjbDiD9WqjbmSojlIgQUWWGCBdVjdsHKt1cq5J/XQnXejwQILLLDuhBXfjrJybfHKBh8ssMACC6zD6obUtNQ8yws81eZLu3TAAgsssA6DVevQ59A0X7C5t2duURpYYIEFFli71Q1xPbW2Ys7c3HKu2vgFFlhggQXWbjNWTUbtyU3fNXOpu9rNmh4ssMACC6wXwWqeuNT0Nteq175UC6Y3sMACCyywvls3pCaP2pVILY1qfq5U3XDvjAUWWGCB9UJYzaueuiTxJ6eKg5oVa97BAgsssF5UNyy4wfzdv/NTxzz3fQMLLLDAAmuTuiFewdfGnZV1dvzALE0GCyywwDqjbqgpnPvfDQvmudpAdufOVbDAAgus8+qG+GiV2vzZnN5WFhm/NwUssMAC6+C6YZNWvTm0pbb0NLt4zTtYYIEF1hvrhnhNkJqoarNRc5NPs7bQY4EFFlhgvbp5n5tXmiNIqlV/9ORt76CDBRZYYIG1Cay5umGuSmgOSTasggUWWGCB1aeWqgDiC4hXHgZYYIEFFlhnNO/NWeQr+2SavcOdoxVYYIEF1sGwUuuxmlLj7xWvNlIKwQILLLDA2gSWCFgCloAlApaAJWCJgCVgCVgiYAlYApYIWAKWgCUCloAlYImAJWAJWCJgCVgClghYApaAJQKWgCVgiYAlYAlYImAJWAKWCFgCloAlApaAJWCJgCVgCVgiYAlYApYIWAKWgCUCloAlYImAJWAJWAKWCFgCloAlApaAJWCJgCVgyZ35A7yI9SDtFEaXAAAAAElFTkSuQmCC";
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 110, (SCREEN_HEIGHT - 64)/2 - 150, 220, 220)];
    UIImage *base64Image = [WD_CREATEBARCODE_OPERATION decodedImageWithBase64String:dataString];
//    self.imageView.image = [self clipImageFromOriginal:base64Image withClipRect:CGRectMake(0, 0, 145, 145)];
    [self.view addSubview:self.imageView];
    
    NSString *scanResult = [self scannedQRcodeFromImage:base64Image];
    [WD_CREATEBARCODE_OPERATION createBarcodeImageWithString:scanResult
                                        withBarcodeImageView:self.imageView
                                             withBarcodeSize:200];
}
//裁剪图片的部分区域
- (UIImage*)clipImageFromOriginal:(UIImage*)image withClipRect:(CGRect)rect{
    
    CGImageRef cgimage = CGImageCreateWithImageInRect([image CGImage], rect);
    UIImage *newImage = [UIImage imageWithCGImage:cgimage];
    CGImageRelease(cgimage);
    return newImage;
}
//扫描图片上的二维码
- (NSString*)scannedQRcodeFromImage:(UIImage*)image{
    //1.初始化扫描仪，设置设别类型和识别质量
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode
                                              context:nil
                                              options:@{CIDetectorAccuracy:CIDetectorAccuracyHigh}];
    //2.扫描获取的特征组
    NSArray *features = [detector featuresInImage:[CIImage imageWithCGImage:image.CGImage]];
    if(features.count > 0) {
        CIQRCodeFeature *feature = features.firstObject;
        NSString *scannedResult = feature.messageString;
        NSLog(@"扫描结果------%@",scannedResult);
        return scannedResult;
    } else {
        return nil;
    }

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
