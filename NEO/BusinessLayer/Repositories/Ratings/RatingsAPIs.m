//
//  RatingsAPIs.m
//  NEO
//
//  Created by Neo on 19/12/24.
//

#import "RatingsAPIs.h"

@implementation RatingsAPIs
+ (nonnull NSString *)getRatingsPath {
    return @"http://staging.php-dev.in:8844/trainingapp/api/products/setRating";
}

+ (nonnull NSString *)method {
    return @"POST";
}
@end
