//
//  WJLoginResignController.m
//  百思不得姐
//
//  Created by wangju on 16/3/19.
//  Copyright © 2016年 wangju. All rights reserved.
//

#import "WJLoginResignController.h"

@interface WJLoginResignController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginViewCenterX;

@end

@implementation WJLoginResignController

- (void)viewDidLoad {
    [super viewDidLoad];
    


    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    // Dispose of any resources that can be recreated.
}
- (IBAction)showLoginOrResign:(UIButton *)sender {
    
    [self.view endEditing:YES];
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        self.loginViewCenterX.constant -= self.view.width;
    }else
    {
        self.loginViewCenterX.constant += self.view.width;
    }
  
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
    
    
}

- (IBAction)close {
    
    [self.view endEditing:YES];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];

}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
