//
//  FDAPIClient.m
//  FOODA
//
//  Created by Ben on 27/04/2013.
//  Copyright (c) 2013 Polydice Inc. All rights reserved.
//

#import "FDAPIClient.h"
#import "AFJSONRequestOperation.h"

@implementation FDAPIClient

+ (FDAPIClient *)sharedClient {
  static FDAPIClient *_sharedClient = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _sharedClient = [[FDAPIClient alloc] initWithBaseURL:[NSURL URLWithString:kFDAPIBaseURLString]];
  });

  return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
  self = [super initWithBaseURL:url];
  if (!self) {
    return nil;
  }

  [self registerHTTPOperationClass:[AFJSONRequestOperation class]];

  // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
  [self setDefaultHeader:@"Accept" value:@"application/json"];

  return self;
}

@end
