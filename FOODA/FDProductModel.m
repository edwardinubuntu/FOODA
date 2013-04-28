//
//  FDProductModel.m
//  FOODA
//
//  Created by Ben on 27/04/2013.
//  Copyright (c) 2013 Polydice Inc. All rights reserved.
//

#import "FDProductModel.h"
#import "FDProduct.h"

@implementation FDProductModel

+ (void)getProductWithBarcode:(NSString *)barcode
                barcodeFormat:(NSString *)barcodeFormat
                      success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successHandler
                      failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureHandler {

  NSDictionary *param = @{ kFDJSONKeyForProductBarcode : barcode,
                           kFDJSONKeyForProductBarcodeFormat : barcodeFormat };

  [[FDAPIClient sharedClient] getPath:kFDAPIGetPath
                           parameters:param
                              success:successHandler
                              failure:failureHandler];

}

+ (void)postProduc:(FDProduct *)product
           success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successHandler
           failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureHandler {

  NSDictionary *param = @{ kFDJSONKeyForProductID : product.productID,
                           kFDJSONKeyForProductBarcode : product.barcode,
                           kFDJSONKeyForProductBarcodeFormat : product.barcodeFormat,
                           kFDJSONKeyForProductTitle : product.title,
                           kFDJSONKeyForProductDescription : product.productDescription };

  [[FDAPIClient sharedClient] postPath:kFDAPIPostPath
                            parameters:param
                               success:successHandler
                               failure:failureHandler];
}

@end
