//
//  FOODATests.m
//  FOODATests
//
//  Created by Edward Chiang on 13/4/27.
//  Copyright (c) 2013年 Polydice Inc. All rights reserved.
//

#import "FOODATests.h"
#import "FDProduct.h"
#import "FDProductModel.h"

@implementation FOODATests

- (void)setUp {
  [super setUp];
  // Set-up code here.
}

- (void)tearDown {
  // Tear-down code here.
  [super tearDown];
}

- (void)testExample {
//  STFail(@"Unit tests are not implemented yet in FOODATests");
}

- (void)testGetProduct {

  NSString *barcode = @"";
  NSString *barcodeFormat = @"";

  __block BOOL done = NO;
  [FDProductModel getProductWithBarcode:barcode
                          barcodeFormat:barcodeFormat
                                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                  done = YES;
                                  // Assertion
                                  NSDictionary *data = responseObject[@"data"];
                                  STAssertEqualObjects(responseObject[@"result"], @"success", @"result must be success");
                                  STAssertNotNil(data, @"data must not be nil");
                                  STAssertEqualObjects(data[@"barcode"], barcode, @"barcode must be equal");
                                  STAssertEqualObjects(data[@"barcode_format"], barcodeFormat, @"barcodeFormat must be equal");

                                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                  done = YES;
                                  STAssertTrue(NO, @"Get product with Error");
                                }];

  while (!done) {
    // This executes another run loop.
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    // Sleep 1/100th sec
    usleep(1000);
  }
}

- (void)testPostProduct {

  NSString *barcode = @"";
  NSString *barcodeFormat = @"";

  FDProduct *testProduct = [[FDProduct alloc] initWithBarcode:barcode
                                                barcodeFormat:barcodeFormat];
  __block BOOL done = NO;
  [FDProductModel postProduc:testProduct
                     success:^(AFHTTPRequestOperation *operation, id responseObject) {
                       done = YES;
                       // Assertion
                       NSDictionary *data = responseObject[@"data"];
                       STAssertEqualObjects(responseObject[@"result"], @"success", @"result must be success");
                       STAssertNotNil(data, @"data must not be nil");
                       STAssertEqualObjects(data[@"barcode"], barcode, @"barcode must be equal");
                       STAssertEqualObjects(data[@"barcode_format"], barcodeFormat, @"barcodeFormat must be equal");

                     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                       done = YES;
                       STAssertTrue(NO, @"Post product with Error");
                     }];

  while (!done) {
    // This executes another run loop.
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    // Sleep 1/100th sec
    usleep(1000);
  }
}

@end
