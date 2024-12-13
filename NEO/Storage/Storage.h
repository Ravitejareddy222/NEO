//
//  Storage.h
//  NEO
//
//  Created by Neo on 12/12/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Storage : NSObject

+ (void)setAccessToken:(nonnull NSString *)accessToken;

+ (NSString *)checkAccessToken;

+ (void)removeAccessToken;

+ (NSString *)getAccessToken;

@end

NS_ASSUME_NONNULL_END
