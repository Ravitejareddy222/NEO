//
//  ProductDetailsAPIs.m
//  NEO
//
//  Created by Neo on 11/12/24.
//

#import "ProductDetailsAPIs.h"

@implementation ProductDetailsAPIs

+ (nonnull NSString *)getProductDetailsPath {
    return @"http://staging.php-dev.in:8844/trainingapp/api/products/getDetail";
}

+ (nonnull NSString *)method {
    return  @"GET";
}

@end
