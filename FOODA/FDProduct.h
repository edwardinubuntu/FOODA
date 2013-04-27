//
//  FDProduct.h
//  FOODA
//
//  Created by Ben on 27/04/2013.
//  Copyright (c) 2013 Polydice Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FDProduct : NSObject

// Database ID returned from API server
@property (nonatomic, strong) NSString *productID;

// Product info
@property (nonatomic, strong) NSString *barcode;
@property (nonatomic, strong) NSString *barcodeFormat;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *productDescription;

// Images
@property (nonatomic, strong) UIImage *barcodeImage;
@property (nonatomic, strong) UIImage *productImage;

// Image URLs returned from API
@property (nonatomic, strong) NSURL *barcodeImageURL;
@property (nonatomic, strong) NSURL *productImageURL;

// Designated initializer
- (id)initWithBarcode:(NSString *)barcode barcodeFormat:(NSString *)barcodeFormat;

@end
