//
//  ForgotPasswordAPIs.m
//  NEO
//
//  Created by Neo on 17/12/24.
//

#import "ForgotPasswordAPIs.h"

@implementation ForgotPasswordAPIs

+ (nonnull NSString *)getForgotPasswordPath {
    return @"http://staging.php-dev.in:8844/trainingapp/api/users/forgot";
}

+ (nonnull NSString *)method {
    return @"POST";
}

@end
