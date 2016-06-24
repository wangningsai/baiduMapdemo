//
//  AppDelegate.h
//  百度地图
//
//  Created by ym on 16/6/13.
//  Copyright © 2016年 WisQo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import <BaiduMapAPI_Base/BMKMapManager.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UINavigationController *navigationController;
    BMKMapManager* _mapManager;
}
@property (strong, nonatomic) UIWindow *window;

@end

