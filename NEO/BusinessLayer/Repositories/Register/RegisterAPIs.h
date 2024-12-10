//
//  RegisterAPIs.h
//  NEO
//
//  Created by Neo on 06/12/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RegisterAPIs : NSObject

+ (NSString *)saveRegisterDataPath;
+ (NSDictionary<NSString *, NSString *> *)headers;
+ (NSString *)method;

@end

NS_ASSUME_NONNULL_END

