//
//  MainTabBarVC.m
//  JXRS
//
//  Created by fuqi on 17/12/25.
//  Copyright © 2017年 fuqi. All rights reserved.
//

#import "MainTabBarVC.h"
#import "ViewController.h"
#import "JXNavigationController.h"


@interface MainTabBarVC ()<UITabBarControllerDelegate>


@end

@implementation MainTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTabbar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Setup
- (void)setupTabbar
{
    ViewController * viewcontroller = [[ViewController alloc] init];
    ViewController * viewcontroller2 = [[ViewController alloc] init];
    
    UITabBarItem * tabbarItem1 = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"tabbar_homepage_normal"] selectedImage:[UIImage imageNamed:@"tabbar_homepage_highlighted"]];
    tabbarItem1.tag = 1;
    
    UITabBarItem * tabbarItem2 = [[UITabBarItem alloc] initWithTitle:@"积分" image:[UIImage imageNamed:@"tabbar_point_normal"] selectedImage:[UIImage imageNamed:@"tabbar_point_highlighted"]];

    tabbarItem2.tag = 2;
    
    
    JXNavigationController * navigationVC1 = [[JXNavigationController alloc] initWithRootViewController:viewcontroller];
    JXNavigationController * navigationVC2 = [[JXNavigationController alloc] initWithRootViewController:viewcontroller2];

    
    navigationVC1.edgesForExtendedLayout = UIRectEdgeNone;
    navigationVC2.edgesForExtendedLayout = UIRectEdgeNone;
    
    navigationVC1.tabBarItem = tabbarItem1;
    navigationVC2.tabBarItem = tabbarItem2;
    
    self.viewControllers = @[navigationVC1,navigationVC2];
    
    self.delegate = self;
//    self.tabBar.translucent = NO;
}

#pragma mark - Delegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{

}


@end
