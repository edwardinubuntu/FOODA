//
//  FDProductInfoViewController.m
//  FOODA
//
//  Created by Edward Chiang on 13/4/27.
//  Copyright (c) 2013年 Polydice Inc. All rights reserved.
//

#import "FDProductInfoViewController.h"

@interface FDProductInfoViewController ()

@end

@implementation FDProductInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView {
  [super loadView];
  
  _barCodeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
  
  self.barCodeImageView.contentMode = UIViewContentModeScaleAspectFit;
  [self.view addSubview:self.barCodeImageView];
  
  _barCodeTextLabel = [[UILabel alloc] init];
  [self.view addSubview:self.barCodeTextLabel];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  // Do any additional setup after loading the view.
  self.barCodeImageView.center = self.view.center;
  self.barCodeTextLabel.frame = CGRectMake(self.barCodeImageView.frame.origin.x, self.barCodeImageView.frame.origin.y + self.barCodeImageView.frame.size.height + 10, self.view.frame.size.width, 44);
  
  self.barCodeImageView.image = self.product.barcodeImage;
  self.barCodeTextLabel.text = self.product.barcode;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
  self.barCodeImageView.center = self.view.center;
}

@end
