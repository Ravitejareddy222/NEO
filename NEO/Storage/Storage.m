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

+(void) saveAddrress: (NSString *)address{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *savedAddresses = [[defaults objectForKey:@"SavedAddressList"] mutableCopy];
    
    if (!savedAddresses) {
        savedAddresses = [[NSMutableArray alloc] init];
    }
    
    [savedAddresses addObject:address];
    
    [defaults setObject:savedAddresses forKey:@"SavedAddressList"];
    [defaults synchronize];
    
}

+ (nonnull NSArray *)getAddressList {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *savedAddresses = [[defaults objectForKey:@"SavedAddressList"] mutableCopy];
    return savedAddresses;
}

@end

