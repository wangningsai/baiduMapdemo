//
//  WNNavigationController.m
//  百度地图
//
//  Created by ym on 16/6/14.
//  Copyright © 2016年 WisQo. All rights reserved.
//

#import "WNNavigationController.h"
#import "UINavigationItem+Extension.h"
@interface WNNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation WNNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    如果右划pop的功能失效
    self.interactivePopGestureRecognizer.delegate = self;
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count>1)
    {
        viewController.hidesBottomBarWhenPushed = YES;
        // 修改导航栏左边的item
        [viewController.navigationItem resetDelegate:self title:@"" imageName:@"navigation_icon_back" action:@selector(outClick)];
    }
    [super pushViewController:viewController animated:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)outClick
{
    [self popViewControllerAnimated:YES];
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    //白色   默认的黑色
    return UIStatusBarStyleLightContent;
}


@end
