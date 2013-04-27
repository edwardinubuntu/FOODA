//
//  FDProductModel.h
//  FOODA
//
//  Created by Ben on 27/04/2013.
//  Copyright (c) 2013 Polydice Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FDAPIClient.h"

@class FDProduct;

@interface FDProductModel : NSObject

+ (void)getProductWithBarcode:(NSString *)barcode
                barcodeFormat:(NSString *)barcodeFormat
                      success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successHandler
                      failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureHandler;

+ (void)postProduc:(FDProduct *)product
           success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successHandler
           failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureHandler;

@end
