//
//  MyAccountAPIs.h
//  NEO
//
//  Created by Neo on 17/12/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyAccountAPIs : NSObject

+(NSString *)getfetchDetailsPath;
+(NSString *)getfetchDetailsMethod;

+(NSString *)saveAccountDetailsPath;
+(NSString *)saveAccountDetailsMethod;

@end

NS_ASSUME_NONNULL_END
