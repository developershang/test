//
//  LoginController.m
//  QQZone
//
//  Created by developershang on 2017/4/20.
//  Copyright © 2017年 developershang. All rights reserved.
//

#import "LoginController.h"
#import "MainViewController.h"
@interface LoginController ()<UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet UIView *MainView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;
@property (weak, nonatomic) IBOutlet UIButton *remeberPassewordBtn;
@property (weak, nonatomic) IBOutlet UIButton *autoLoginBtn;


@end

@implementation LoginController


- (void)viewDidLoad {
    [super viewDidLoad];

}


- (IBAction)loginAction:(UIButton *)sender {
    [self.view endEditing:YES];
    //   1.拿到输入的账号密码
    NSString *account = self.accountField.text;
    NSString *password = self.passwordField.text;
    
    //   2. 判断是否为空
    if (account.length == 0 || password.length == 0) {
        [self showError:@"账号或者密码为空"];
        return;
    }
    
    //   3. 请求
    CGFloat duration = 0.618;
    [self.activityView startAnimating];
    self.MainView.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      if ([account isEqualToString:@"123"] && [password isEqualToString:@"123"]) {
          self.view.window.rootViewController = [[MainViewController alloc] init];
        }else{
            [self showError:@"账号或密码错误"];
        }
        [self.activityView stopAnimating];
        self.MainView.userInteractionEnabled = YES;
        
    });
    
    
}


- (void)showError:(NSString *)error{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:error delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    
    [alert show];
    
    //动画效果
    CAKeyframeAnimation *shakeAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    shakeAnim.values = @[@-10,@0,@10,@0];
    shakeAnim.repeatCount = 3;
    shakeAnim.duration = 0.1;
    [self.MainView.layer addAnimation:shakeAnim forKey:nil];

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == self.accountField) {
        
        [self.passwordField becomeFirstResponder];
    }else  if (textField == self.passwordField) {
        [self loginAction:self.login];
        
    }
    
    return YES;
}


- (IBAction)remeberPasswordAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected == NO) {
        self.autoLoginBtn.selected = NO;
    }
}


- (IBAction)autoLoginAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected == YES) {
        self.remeberPassewordBtn.selected = YES;
    }
}


@end







