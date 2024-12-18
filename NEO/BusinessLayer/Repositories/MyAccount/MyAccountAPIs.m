//
//  MyAccountAPIs.m
//  NEO
//
//  Created by Neo on 17/12/24.
//

#import "MyAccountAPIs.h"

@implementation MyAccountAPIs

+ (nonnull NSString *)getfetchDetailsMethod {
    return @"GET";
}

+ (nonnull NSString *)saveAccountDetailsMethod {
    return @"POST";
}

+ (nonnull NSString *)getfetchDetailsPath {
    return @"http://staging.php-dev.in:8844/trainingapp/api/users/getUserData";
}

+ (nonnull NSString *)saveAccountDetailsPath {
    return @"http://staging.php-dev.in:8844/trainingapp/api/users/update";
}

@end
