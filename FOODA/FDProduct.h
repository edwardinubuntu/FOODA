//
//  FDProduct.h
//  FOODA
//
//  Created by Ben on 27/04/2013.
//  Copyright (c) 2013 Polydice Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPRequestOperation;

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

#pragma mark -

/*
 *  Designated initializer
 */
- (id)initWithBarcode:(NSString *)barcode
        barcodeFormat:(NSString *)barcodeFormat;

- (id)initWithBarcode:(NSString *)barcode
        barcodeFormat:(NSString *)barcodeFormat
         barcodeImage:(UIImage *)barcodeImage;

#pragma mark - Combine FDProductModel

/*
 *  Retrieve product info from API based on product's barcode and barcodeFormat
 */
- (void)getProductInfoWithSuccess:(void (^)(AFHTTPRequestOperation *operation, FDProduct *syncedProduct))successHandler
                          failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureHandler;

/*
 *  Send updates of product info to the backend through API
 */
- (void)postProductInfoWithSuccess:(void (^)(AFHTTPRequestOperation *operation, FDProduct *syncedProduct))successHandler
                           failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureHandler;

/*
 *  Combine `- initializer` and `- getProductInfoWithSuccess:failure:`
 *
- (id)initWithBarcode:(NSString *)barcode
        barcodeFormat:(NSString *)barcodeFormat
              success:(void (^)(AFHTTPRequestOperation *operation, FDProduct *syncedProduct))successHandler
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureHandler;
 */

@end
