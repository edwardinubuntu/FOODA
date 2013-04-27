//
//  FDHomeViewController.h
//  FOODA
//
//  Created by Edward Chiang on 13/4/27.
//  Copyright (c) 2013年 Polydice Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarReaderViewController.h"

@interface FDHomeViewController : UIViewController <
  ZBarReaderDelegate
>

@property (nonatomic, strong) ZBarReaderViewController *barReaderViewController;
@property (nonatomic, strong) UIImageView *barCodeImageView;

@end
