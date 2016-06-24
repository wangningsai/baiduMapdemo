//
//  ViewController.m
//  百度地图
//
//  Created by ym on 16/6/13.
//  Copyright © 2016年 WisQo. All rights reserved.
//

#import "ViewController.h"
#import "WNNavigationController.h"
#import <BaiduMapAPI_Map/BMKMapView.h>
#import <BaiduMapAPI_Location/BMKLocationService.h>
@interface ViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate>
@property (nonatomic, strong) BMKMapView * mapView;
@property (nonatomic, strong) BMKLocationService * locService;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UINavigationBar *navigationBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(50, 10, 200, 40)];
    textField.placeholder = @"ssssss";
    textField.backgroundColor = [UIColor redColor];
    [navigationBar addSubview:textField];
    navigationBar.alpha = 0.9;
    
    
    _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview: _mapView];
    
    UITabBar *tabBar = [[UITabBar alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-44, self.view.frame.size.width, 44)];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, 0, 40, 40)];
    [button setTitle:@"定位" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    [tabBar addSubview:button];
    [self.view addSubview:navigationBar];

    
    [self.view addSubview:tabBar];
    

 _mapView.baseIndoorMapEnabled = YES;
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}
-(void)click
{
    //初始化BMKLocationService
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    //启动LocationService
    [_locService startUserLocationService];
    _mapView.showsUserLocation = YES;//显示定位图层

}
-(void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    //展示定位
    self.mapView.showsUserLocation = YES;
    
    //更新位置数据
    [self.mapView updateLocationData:userLocation];
    
    //获取用户的坐标
    self.mapView.centerCoordinate = userLocation.location.coordinate;
    
    self.mapView.zoomLevel = 18;
}
@end
