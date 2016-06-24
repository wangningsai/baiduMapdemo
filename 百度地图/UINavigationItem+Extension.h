//
//  UINavigationItem+Extension.h
//  百度地图
//
//  Created by ym on 16/6/14.
//  Copyright © 2016年 WisQo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (Extension)
-(void)resetDelegate:(id)delegate title:(NSString*)title imageName:(NSString*)imageName  action:(SEL)leftclick;
-(void)resetRight:(id)delegate
            title:(NSString *)title
            image:(UIImage *)image
           action:(SEL)leftclick;
@end
