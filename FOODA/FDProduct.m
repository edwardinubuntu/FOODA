//
//  FDProduct.m
//  FOODA
//
//  Created by Ben on 27/04/2013.
//  Copyright (c) 2013 Polydice Inc. All rights reserved.
//

#import "FDProduct.h"

@implementation FDProduct

- (id)initWithBarcode:(NSString *)barcode barcodeFormat:(NSString *)barcodeFormat {
  if (self = [super init]) {
    self.barcode = barcode;
    self.barcodeFormat = barcodeFormat;
  }
  return self;
}

@end
