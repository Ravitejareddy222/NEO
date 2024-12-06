//
//  RegisterModels.m
//  NEO
//
//  Created by Neo on 06/12/24.
//

#import "RegisterModel.h"

@implementation UserResponse

- (instancetype)initWithDictionary:(NSDictionary *)dictionary error:(NSError **)error {
    self = [super init];
    if (self) {
        _status = dictionary[@"status"];
        _data = [[UserData alloc] initWithDictionary:dictionary[@"data"]];
        _message = dictionary[@"message"];
        _userMsg = dictionary[@"user_msg"];
    }
    return self;
}

@end

@implementation UserData

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _userId = dictionary[@"id"];
        _roleId = dictionary[@"role_id"];
        _firstName = dictionary[@"first_name"];
        _lastName = dictionary[@"last_name"];
        _email = dictionary[@"email"];
        _username = dictionary[@"username"];
        _profilePic = dictionary[@"profile_pic"];
        _countryId = dictionary[@"country_id"];
        _gender = dictionary[@"gender"];
        _phoneNo = dictionary[@"phone_no"];
        _dob = dictionary[@"dob"];
        _isActive = dictionary[@"is_active"];
        _created = dictionary[@"created"];
        _modified = dictionary[@"modified"];
        _accessToken = dictionary[@"access_token"];
    }
    return self;
}

@end

