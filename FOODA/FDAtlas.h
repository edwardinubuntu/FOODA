//
//  FDAtlas.h
//  FOODA
//
//  Created by Ben on 27/04/2013.
//  Copyright (c) 2013 Polydice Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kFDAppDomain;

// Prefixed with k for autocompletion
extern NSString * const kFDAPIBaseURLString;
extern NSString * const kFDAPIGetPath;
extern NSString * const kFDAPIPostPath;

// JSON attributes
extern NSString * const kFDproductJSONUniqueID;
extern NSString * const kFDProductJSONBarcodeKey;
extern NSString * const kFDProductJSONBarcodeFormatKey;
extern NSString * const kFDProductJSONTitleKey;
extern NSString * const kFDProductJSONDescription;

typedef NS_ENUM (NSInteger, kFDErrorCode) {
  kFDErrorMissingParameter,
  kFDErrorAPIResponse,
  kFDErrorProductNotFound
};

@interface FDAtlas : NSObject

@end
