//
//  AddToCartAPIs.m
//  NEO
//
//  Created by Neo on 11/12/24.
//

#import "AddToCartAPIs.h"

@implementation AddToCartAPIs

+ (nonnull NSString *)getAddToCartPath {
    return @"http://staging.php-dev.in:8844/trainingapp/api/addToCart";
}

+ (nonnull NSString *)method {
    return @"POST";
}

@end
