//
//  ProductListAPIs.m
//  NEO
//
//  Created by Neo on 10/12/24.
//

#import "ProductListAPIs.h"

@implementation ProductListAPIs

+ (nonnull NSString *)getProductListDataPath {
    return @"http://staging.php-dev.in:8844/trainingapp/api/products/getList";
}

+ (nonnull NSString *)method {
    return @"GET";
}

//+ (nonnull NSDictionary<NSString *,NSString *> *)headers {
//    return@{
//        @"Content-Type": @"application/x-www-form-urlencoded"
//    };
//}

@end
