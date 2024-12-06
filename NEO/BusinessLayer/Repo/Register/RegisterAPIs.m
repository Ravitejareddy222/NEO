//
//  RegisterAPIs.m
//  NEO
//
//  Created by Neo on 06/12/24.
//

#import "RegisterAPIs.h"

@implementation RegisterAPIs

+ (NSString *)saveRegisterDataPath {
    return @"http://staging.php-dev.in:8844/trainingapp/api/users/register";
}

+ (NSDictionary<NSString *, NSString *> *)headers {
    return @{ @"Content-Type": @"application/x-www-form-urlencoded" };
}

+ (NSString *)method {
    return @"POST";
}

@end
