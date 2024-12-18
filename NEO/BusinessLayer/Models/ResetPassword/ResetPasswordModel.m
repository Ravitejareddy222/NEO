//
//  ResetPasswordModel.m
//  NEO
//
//  Created by Neo on 18/12/24.
//

#import "ResetPasswordModel.h"

@implementation ResetPasswordResponse
-(instancetype) initWithDictionary: (NSDictionary *)dictionary{
    self = [super init];
    if (self) {
        _status = dictionary[@"status"];
        _message = dictionary[@"message"];
        _userMsg = dictionary[@"user_msg"];
    }
    return self;
}

@end
