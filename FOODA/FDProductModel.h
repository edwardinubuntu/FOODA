//
//  FDProductModel.h
//  FOODA
//
//  Created by Ben on 27/04/2013.
//  Copyright (c) 2013 Polydice Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FDProduct;

@interface FDProductModel : NSObject

+ (void)getProductWithBarcode:(NSString *)barcode
                barcodeFormat:(NSString *)barcodeFormat
                      success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON))success
                      failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON))failure;

+ (void)postProduc:(FDProduct *)product
           Success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON))success
           failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON))failure;

@end
