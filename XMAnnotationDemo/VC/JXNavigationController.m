//
//  JXNavigationController.m
//  JXRS
//
//  Created by fuqi on 17/12/25.
//  Copyright © 2017年 fuqi. All rights reserved.
//

#import "JXNavigationController.h"
#import "UIBarButtonItem+CustomStyle.h"

@interface JXNavigationController ()

@end

@implementation JXNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.translucent = NO;
    self.interactivePopGestureRecognizer.enabled = YES;
}




#pragma mark - Override
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
    if (self.viewControllers.count > 1) {
        UIBarButtonItem *back = [UIBarButtonItem backBarButtonItemWithTarget:viewController action:@selector(actionBack:)];
        [viewController.navigationItem setLeftBarButtonItem:back animated:animated];
    }
}

- (BOOL)shouldAutorotate
{
    return [self.topViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [self.topViewController supportedInterfaceOrientations];
}
@end

@implementation UIViewController (HKNavigationController)

- (void)actionBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
