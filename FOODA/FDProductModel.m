//
//  FDProductModel.m
//  FOODA
//
//  Created by Ben on 27/04/2013.
//  Copyright (c) 2013 Polydice Inc. All rights reserved.
//

#import "FDProductModel.h"
#import "FDProduct.h"
#import "FDAPIClient.h"

@implementation FDProductModel

+ (void)getProductWithBarcode:(NSString *)barcode
                barcodeFormat:(NSString *)barcodeFormat
                      success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successHandler
                      failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureHandler {

  static NSString *API_GET_PATH = @"";
  [[FDAPIClient sharedClient] postPath:API_GET_PATH
                            parameters:@{}
                               success:successHandler
                               failure:failureHandler];

}

+ (void)postProduc:(FDProduct *)product
           success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successHandler
           failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureHandler {

  static NSString *API_POST_PATH = @"";
  [[FDAPIClient sharedClient] postPath:API_POST_PATH
                            parameters:@{}
                               success:successHandler
                               failure:failureHandler];
}


@end
