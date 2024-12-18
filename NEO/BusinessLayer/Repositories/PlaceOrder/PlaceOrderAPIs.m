//
//  PlaceOrderAPIs.m
//  NEO
//
//  Created by Neo on 15/12/24.
//

#import "PlaceOrderAPIs.h"

@implementation PlaceOrderAPIs

+ (nonnull NSString *)getPlaceOrderpath {
    return @"http://staging.php-dev.in:8844/trainingapp/api/order";
}

+ (nonnull NSString *)method {
    return @"POST";
}

@end


