//
//  ResetPasswordAPIs.m
//  NEO
//
//  Created by Neo on 18/12/24.
//

#import "ResetPasswordAPIs.h"

@implementation ResetPasswordAPIs

+ (nonnull NSString *)getResetPasswordPath {
    return @"http://staging.php-dev.in:8844/trainingapp/api/users/change";
}

+ (nonnull NSString *)method {
    return @"POST";
}

@end
