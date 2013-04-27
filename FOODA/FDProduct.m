//
//  FDProduct.m
//  FOODA
//
//  Created by Ben on 27/04/2013.
//  Copyright (c) 2013 Polydice Inc. All rights reserved.
//

#import "FDProduct.h"
#import "FDAPIClient.h"

@implementation FDProduct

- (id)initWithBarcode:(NSString *)barcode
        barcodeFormat:(NSString *)barcodeFormat {

  if (self = [super init]) {
    self.barcode = barcode;
    self.barcodeFormat = barcodeFormat;
  }
  return self;
}

- (id)initWithBarcode:(NSString *)barcode
        barcodeFormat:(NSString *)barcodeFormat
         barcodeImage:(UIImage *)barcodeImage {

  if (self = [self initWithBarcode:barcode barcodeFormat:barcodeFormat]) {
    self.barcodeImage = barcodeImage;
  }
  return self;
}

#pragma mark - Combine FDProductModel

- (void)getProductInfoWithSuccess:(void (^)(AFHTTPRequestOperation *, FDProduct *))successHandler
                          failure:(void (^)(AFHTTPRequestOperation *, NSError *))failureHandler {

  if (!self.barcode || !self.barcodeFormat) {
    NSError *error = [NSError errorWithDomain:kFDAppDomain
                                         code:kFDErrorMissingParameter
                                     userInfo:@{ @"error" : @"Must specify barcode and barcodeFormat before getting product info." }];
    failureHandler(nil, error);
    return;
  }

  NSDictionary *param = @{ kFDProductJSONBarcodeKey : self.barcode,
                           kFDProductJSONBarcodeFormatKey : self.barcodeFormat };

  __weak __typeof(&*self)weakSelf = self;
  [[FDAPIClient sharedClient] getPath:kFDAPIGetPath
                           parameters:param
                              success:^(AFHTTPRequestOperation *operation, id responseObject) {

                                if (![responseObject[@"result"] isEqualToString:@"success"]) {
                                  NSError *error = [NSError errorWithDomain:kFDAppDomain
                                                                       code:kFDErrorAPIResponse
                                                                   userInfo:responseObject];
                                  failureHandler(nil, error);
                                  return;
                                }

                                NSDictionary *data = responseObject[@"data"];
                                if (!data) {
                                  NSError *error = [NSError errorWithDomain:kFDAppDomain
                                                                       code:kFDErrorProductNotFound
                                                                   userInfo:responseObject];
                                  failureHandler(nil, error);
                                  return;
                                }

                                // Getting info successfully
                                weakSelf.productID = data[kFDproductJSONUniqueID];
                                weakSelf.barcode = data[kFDProductJSONBarcodeKey];
                                weakSelf.barcodeFormat = data[kFDProductJSONBarcodeFormatKey];
                                weakSelf.title = data[kFDProductJSONTitleKey];
                                weakSelf.productDescription = data[kFDProductJSONDescription];
                                successHandler(operation, weakSelf);
                              }
                              failure:failureHandler];
}

- (void)postProductInfoWithSuccess:(void (^)(AFHTTPRequestOperation *, FDProduct *))successHandler
                           failure:(void (^)(AFHTTPRequestOperation *, NSError *))failureHandler {

  if (!self.productID) {
    NSError *error = [NSError errorWithDomain:kFDAppDomain
                                         code:kFDErrorMissingParameter
                                     userInfo:@{ @"error" : @"Must retrieve productID before updating product info." }];
    failureHandler(nil, error);
    return;
  }

  NSDictionary *param = @{ kFDproductJSONUniqueID : self.productID,
                           kFDProductJSONBarcodeKey : self.barcode,
                           kFDProductJSONBarcodeFormatKey : self.barcodeFormat,
                           kFDProductJSONTitleKey : self.title,
                           kFDProductJSONDescription : self.productDescription };

  __weak __typeof(&*self)weakSelf = self;
  [[FDAPIClient sharedClient] postPath:kFDAPIPostPath
                            parameters:param
                               success:^(AFHTTPRequestOperation *operation, id responseObject) {

                                 if (![responseObject[@"result"] isEqualToString:@"success"]) {
                                   NSError *error = [NSError errorWithDomain:kFDAppDomain
                                                                        code:kFDErrorAPIResponse
                                                                    userInfo:responseObject];
                                   failureHandler(nil, error);
                                   return;
                                 }

                                 // Update successfully
                                 successHandler(operation, weakSelf);
                               }
                               failure:failureHandler];
}

@end
