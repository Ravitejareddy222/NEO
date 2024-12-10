//
//  LoginAPIs.h
//  NEO
//
//  Created by Neo on 09/12/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginAPIs : NSObject

+ (NSString *) saveLoginDataPath;
+ (NSDictionary<NSString *, NSString *> *) headers;
+ (NSString *) method;

@end

NS_ASSUME_NONNULL_END
