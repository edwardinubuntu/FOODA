//
//  AppDelegate.h
//  FOODA
//
//  Created by Edward Chiang on 13/4/27.
//  Copyright (c) 2013年 Polydice Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FDHomeViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) FDHomeViewController *homeViewController;

@end
