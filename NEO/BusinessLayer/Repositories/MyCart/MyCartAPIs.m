//
//  MyCartAPIs.m
//  NEO
//
//  Created by Neo on 13/12/24.
//

#import "MyCartAPIs.h"

@implementation MyCartAPIs

+ (nonnull NSString *)getMyCartpath {
    return @"http://staging.php-dev.in:8844/trainingapp/api/cart";
}

+ (nonnull NSString *)method {
    return @"GET";
}

@end
