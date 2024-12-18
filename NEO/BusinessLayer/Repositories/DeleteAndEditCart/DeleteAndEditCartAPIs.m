//
//  DeleteAndEditCartAPIs.m
//  NEO
//
//  Created by Neo on 16/12/24.
//

#import "DeleteAndEditCartAPIs.h"

@implementation DeleteAndEditCartAPIs

+ (nonnull NSString *)getdeleteCartMethod {
    return @"POST";
}

+ (nonnull NSString *)getEditCartMethod {
    return @"POST";
}

+ (nonnull NSString *)getdeleteCartpath {
    return @"http://staging.php-dev.in:8844/trainingapp/api/deleteCart";
}

+ (nonnull NSString *)getEditCartpath {
    return @"http://staging.php-dev.in:8844/trainingapp/api/editCart";
}

@end
