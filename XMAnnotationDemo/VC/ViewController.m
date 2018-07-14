//
//  ViewController.m
//  XMAnnotationDemo
//
//  Created by fuqi on 2018/5/16.
//  Copyright © 2018年 fuqi. All rights reserved.
//

#import "ViewController.h"
#import "AnnotationViewController.h"

@interface ViewController ()

@property (nonatomic,strong)UIButton * loginBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
}

-(void)viewWillAppear:(BOOL)animated{
//    NSNumber *orientationUnknown = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
//    [[UIDevice currentDevice] setValue:orientationUnknown forKey:@"orientation"];
    
    NSNumber *orientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.loginBtn setTitle:@"Click" forState:UIControlStateNormal];
    [self.view addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(60);
        make.center.mas_equalTo(self.view);
    }];
    [[self.loginBtn rac_signalForControlEvents:UIControlEventTouchDown] subscribeNext:^(id x) {
        
        AnnotationViewController * vc = [[AnnotationViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }];
    
}

- (UIButton *)loginBtn
{
    if (!_loginBtn)
    {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    }
    return _loginBtn;
}


- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
@end
