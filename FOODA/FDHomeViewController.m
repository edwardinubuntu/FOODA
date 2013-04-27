//
//  FDHomeViewController.m
//  FOODA
//
//  Created by Edward Chiang on 13/4/27.
//  Copyright (c) 2013年 Polydice Inc. All rights reserved.
//

#import "FDHomeViewController.h"
#import "UIBarButtonItem+BlocksKit.h"

@interface FDHomeViewController ()

@end

@implementation FDHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView {
  [super loadView];
  _barReaderViewController = [[ZBarReaderViewController alloc] init];
  _barReaderViewController.readerDelegate = self;
  _barReaderViewController.supportedOrientationsMask = ZBarOrientationMaskAll;
  
  ZBarImageScanner *scanner = _barReaderViewController.scanner;
  [scanner setSymbology: ZBAR_I25 config:ZBAR_CFG_ENABLE to: 0];
  
  __block FDHomeViewController *tempSelf = self;
  UIBarButtonItem *cameraButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera handler:^(id sender) {
    [tempSelf presentModalViewController:tempSelf.barReaderViewController animated:YES];
  }];
  self.navigationItem.rightBarButtonItem = cameraButtonItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) imagePickerController: (UIImagePickerController*) reader didFinishPickingMediaWithInfo: (NSDictionary*) info {
  // ADD: get the decode results
  id<NSFastEnumeration> results =
  [info objectForKey: ZBarReaderControllerResults];
  ZBarSymbol *symbol = nil;
  for(symbol in results)
    // EXAMPLE: just grab the first barcode
    break;

  NSString *resultText = symbol.data;
  NSString *resultBarCodeType = symbol.typeName;
  
  // EXAMPLE: do something useful with the barcode image
  UIImage *resultImage = [info objectForKey: UIImagePickerControllerOriginalImage];
  
  // ADD: dismiss the controller (NB dismiss from the *reader*!)
  [_barReaderViewController dismissModalViewControllerAnimated: YES];
}

@end
