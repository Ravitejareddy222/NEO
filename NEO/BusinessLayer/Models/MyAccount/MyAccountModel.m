//
//  MyAccountModel.m
//  NEO
//
//  Created by Neo on 17/12/24.
//

#import "MyAccountModel.h"

@implementation MyAccountDetailsFetchResponse

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _status = dictionary[@"status"];
        _message = dictionary[@"message"];
        _userMsg = dictionary[@"user_msg"];
        
        NSDictionary *dataDict = dictionary[@"data"];
        if ([dataDict isKindOfClass:[NSDictionary class]]) {
            NSDictionary *userDataDict = dataDict[@"user_data"];
            if ([userDataDict isKindOfClass:[NSDictionary class]]) {
                _data = [[AccountData alloc] initWithDictionary:userDataDict];
            } else {
                NSLog(@"Error: user_data is not a dictionary.");
            }
        } else {
            NSLog(@"Error: data is not a dictionary.");
        }
    }
    return self;
}

@end


@implementation AccountData

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _userID = [dictionary[@"id"] integerValue];
        _roleID = [dictionary[@"role_id"] integerValue];
        _firstName = dictionary[@"first_name"];
        _lastName = dictionary[@"last_name"];
        _email = dictionary[@"email"];
        _username = dictionary[@"username"];
        _profilePic = dictionary[@"profile_pic"];
        _gender = dictionary[@"gender"];
        _phoneNo = dictionary[@"phone_no"];
        _dob = dictionary[@"dob"];
        _isActive = [dictionary[@"is_active"] boolValue];
        _created = dictionary[@"created"];
        _modified = dictionary[@"modified"];
        _accessToken = dictionary[@"access_token"];
    }
    return self;
}

@end



