//
//  Storage.m
//  NEO
//
//  Created by Neo on 12/12/24.
//

#import "Storage.h"

#import "Storage.h"

@implementation Storage

+ (nonnull NSString *)checkAccessToken {
    NSString *accessToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"accessToken"];
    if (accessToken) {
        return accessToken;
    } else {
        return nil;
    }
}

+ (void)removeAccessToken {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"accessToken"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (nonnull NSString *)getAccessToken {
    NSString *accessToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"accessToken"];
    if (accessToken) {
        return accessToken;
    } else {
        return @"";
    }
}

+ (void)setAccessToken:(NSString *)accessToken {
    [[NSUserDefaults standardUserDefaults] setObject:accessToken forKey:@"accessToken"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end

