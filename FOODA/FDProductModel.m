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
                      success:(void (^)(AFHTTPRequestOperation *, id, FDProduct *))successHandler
                      failure:(void (^)(AFHTTPRequestOperation *, NSError *))failureHandler {

  NSDictionary *param = @{ kFDJSONKeyForProductBarcode : barcode,
                           kFDJSONKeyForProductBarcodeFormat : barcodeFormat };

  [[FDAPIClient sharedClient] getPath:kFDAPIGetPath
                           parameters:param
                              success:^(AFHTTPRequestOperation *operation, id responseObject) {

                                FDProduct *receivedProduct;
                                NSDictionary *data = responseObject[@"data"];
                                if ([responseObject[@"result"] isEqualToString:@"success"] && data) {
                                  // Getting info successfully
                                  receivedProduct = [[FDProduct alloc] initWithBarcode:data[kFDJSONKeyForProductBarcode]
                                                                         barcodeFormat:data[kFDJSONKeyForProductBarcodeFormat]];
                                  receivedProduct.productID = data[kFDJSONKeyForProductID];
                                  receivedProduct.title = data[kFDJSONKeyForProductTitle];
                                  receivedProduct.productDescription = data[kFDJSONKeyForProductDescription];
                                }

                                successHandler(operation, responseObject, receivedProduct);
                              }
                              failure:failureHandler];

}

+ (void)postProduct:(FDProduct *)product
            success:(void (^)(AFHTTPRequestOperation *, id))successHandler
            failure:(void (^)(AFHTTPRequestOperation *, NSError *))failureHandler {

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
