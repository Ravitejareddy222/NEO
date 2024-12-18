//
//  MyAccountSaveModel.m
//  NEO
//
//  Created by Neo on 17/12/24.
//

#import "MyAccountSaveModel.h"

@implementation MyAccountDetailsSaveResponse

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _status = dictionary[@"status"];
        _message = dictionary[@"message"];
        _userMsg = dictionary[@"user_msg"];
    }
    return self;
}
@end
