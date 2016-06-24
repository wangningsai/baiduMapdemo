//
//  UINavigationItem+Extension.m
//  百度地图
//
//  Created by ym on 16/6/14.
//  Copyright © 2016年 WisQo. All rights reserved.
//

#import "UINavigationItem+Extension.h"

@implementation UINavigationItem (Extension)
-(void)resetDelegate:(id)delegate title:(NSString*)title imageName:(NSString*)imageName  action:(SEL)leftclick
{
    //导航栏左边返回按钮
    UIButton *leftBtn=[[UIButton alloc]initWithFrame:CGRectMake(0,0,40, 44)];
    [leftBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -25, 0, 0)];
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [leftBtn setTitle:title forState:UIControlStateNormal];
    [leftBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
    
    [leftBtn addTarget:delegate action:leftclick forControlEvents:UIControlEventTouchUpInside];
    self.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:leftBtn];
}
-(void)resetRight:(id)delegate
            title:(NSString *)title
            image:(UIImage *)image
           action:(SEL)leftclick
{
    //导航栏右边返回按钮
    UIButton *rightBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, title? 80:50, 50)];
    
    if (title.length>0) {
        [rightBtn setTitle:title forState:UIControlStateNormal];
        [rightBtn setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -30)];
    }
    if (image) {
        [rightBtn setImage:image forState:UIControlStateNormal];
    }
    [rightBtn.titleLabel setFont: [UIFont systemFontOfSize:16]];
    [rightBtn setImageEdgeInsets:UIEdgeInsetsMake(5, 20, 0, -10)];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [rightBtn addTarget:delegate action:leftclick forControlEvents:UIControlEventTouchUpInside];
    
    self.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
}

@end
