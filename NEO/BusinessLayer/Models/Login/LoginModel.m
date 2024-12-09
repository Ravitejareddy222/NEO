//
//  LoginResponse.m
//  NEO
//
//  Created by Neo on 09/12/24.
//

#import "LoginModel.h"

@implementation LoginResponse

- (instancetype)initWithDictionary:(NSDictionary *)dictionary error:(NSError **)error {
    self = [super init];
    if (self) {
        _status = dictionary[@"status"];
        _data = [[LoginData alloc] initWithDictionary:dictionary[@"data"]];
        _message = dictionary[@"message"];
        _userMsg = dictionary[@"user_msg"];
    }
    return  self;
}

@end

@implementation LoginData
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _accessToken = dictionary[@"access_token"];
    }
    return  self;
}

@end
