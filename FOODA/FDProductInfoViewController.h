//
//  FDProductInfoViewController.h
//  FOODA
//
//  Created by Edward Chiang on 13/4/27.
//  Copyright (c) 2013年 Polydice Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FDProduct.h"

@interface FDProductInfoViewController : UIViewController

@property (nonatomic, strong) FDProduct *product;

@property (nonatomic, strong) UIImageView *barCodeImageView;
@property (nonatomic, strong) UILabel *barCodeTextLabel;

@end
