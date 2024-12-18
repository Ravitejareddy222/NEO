//
//  OrdersListAPIs.m
//  NEO
//
//  Created by Neo on 15/12/24.
//

#import "OrdersListAPIs.h"

@implementation OrdersListAPIs

+ (nonnull NSString *)getOrderListpath {
    return @"http://staging.php-dev.in:8844/trainingapp/api/orderList";
}

+ (nonnull NSString *)method {
    return @"GET";
}
@end
