//
//  OrderDetailsAPIs.m
//  NEO
//
//  Created by Neo on 16/12/24.
//

#import "OrderDetailsAPIs.h"

@implementation OrderDetailsAPIs

+ (nonnull NSString *)getOrderDetailspath {
    return @"http://staging.php-dev.in:8844/trainingapp/api/orderDetail";
}

+ (nonnull NSString *)method {
    return @"GET";
}

@end
