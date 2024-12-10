//
//  LoginAPIs.m
//  NEO
//
//  Created by Neo on 09/12/24.
//

#import "LoginAPIs.h"

@implementation LoginAPIs



+ (nonnull NSDictionary<NSString *,NSString *> *)headers {
    return@{
        @"Content-Type": @"application/x-www-form-urlencoded"
    };
}

+ (nonnull NSString *)method {
    return @"POST";
}

+ (nonnull NSString *)saveLoginDataPath {
    return @"http://staging.php-dev.in:8844/trainingapp/api/users/login";
}

@end
