//
//  WDChangeRealNameController.m
//  WDMovie
//
//  Created by WindyZhang on 2017/5/2.
//  Copyright © 2017年 feeyo. All rights reserved.
//

#import "WDChangeRealNameController.h"

@interface WDChangeRealNameController ()<UITextFieldDelegate>

@property(nonatomic,strong)UITextField *chTextField;
@property(nonatomic,strong)UITextField *enTextField;

@end

@implementation WDChangeRealNameController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setNavigationBarStyle:HistoryStyle];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改姓名";
    self.view.backgroundColor = WD_COLOR.background;
    
    self.chTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, SCREEN_WIDTH - 100, 30)];
    self.chTextField.placeholder = @"请输入汉字";
    self.chTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.chTextField.keyboardType = UIKeyboardTypeDefault;
    self.chTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.chTextField.returnKeyType = UIReturnKeyDone;
    self.chTextField.delegate = self;
    [self.view addSubview:self.chTextField];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(changeTextField:)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:self.chTextField];
    
    self.enTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 200, SCREEN_WIDTH - 100, 30)];
    self.enTextField.placeholder = @"自动为你转为拼音";
    self.enTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.enTextField.enabled = NO;
    [self.view addSubview:self.enTextField];

}
- (void)changeTextField:(NSNotification *)notification{
    UITextField *textField = notification.object;
    if ([textField.text isChinese] || [textField.text isEmptyOrNil]) {
        NSMutableString *mString = [[NSMutableString alloc] initWithString:textField.text];
        if (CFStringTransform((__bridge CFMutableStringRef)mString, 0, kCFStringTransformMandarinLatin, NO)){
            if (CFStringTransform((__bridge CFMutableStringRef)mString, 0, kCFStringTransformStripDiacritics, NO)) {
                self.enTextField.text = mString.uppercaseString;
            }
        }
    }

}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if ([textField canResignFirstResponder]) {
        [textField resignFirstResponder];
    }
    return YES;
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
