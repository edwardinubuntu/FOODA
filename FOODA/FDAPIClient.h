//
//  FDAPIClient.h
//  FOODA
//
//  Created by Ben on 27/04/2013.
//  Copyright (c) 2013 Polydice Inc. All rights reserved.
//

#import "AFHTTPClient.h"

@interface FDAPIClient : AFHTTPClient

+ (FDAPIClient *)sharedClient;

@end
