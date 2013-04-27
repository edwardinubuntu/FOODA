//
//  FDProductModel.m
//  FOODA
//
//  Created by Ben on 27/04/2013.
//  Copyright (c) 2013 Polydice Inc. All rights reserved.
//

#import "FDProductModel.h"
#import "AFJSONRequestOperation.h"

@implementation FDProductModel

+ (void)getProductWithBarcode:(NSString *)barcode
                barcodeFormat:(NSString *)barcodeFormat
                      success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON))success
                      failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON))failure {

  static NSString *API_GET_URL = @"";
  NSURL *urlRequest = [NSURL URLWithString:API_GET_URL];
  [AFJSONRequestOperation JSONRequestOperationWithRequest:(NSURLRequest *)urlRequest
                                                  success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {

                                                  } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                    
                                                  }];
}

+ (void)postProduc:(FDProduct *)product
           Success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON))success
           failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON))failure {

}


@end
