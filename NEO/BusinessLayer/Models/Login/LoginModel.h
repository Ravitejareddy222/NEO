//
//  LoginResponse.h
//  NEO
//
//  Created by Neo on 09/12/24.
//

#import <Foundation/Foundation.h>

@class LoginData;

NS_ASSUME_NONNULL_BEGIN

@interface LoginResponse : NSObject
@property (nullable, nonatomic, strong) NSNumber *status;
@property (nullable, nonatomic, strong) LoginData *data;
@property (nullable, nonatomic, strong) NSString *message;
@property (nullable, nonatomic, strong) NSString *userMsg;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary error:(NSError **)error;

@end

@interface LoginData: NSObject

@property (strong, nullable, nonatomic) NSString *accessToken;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
