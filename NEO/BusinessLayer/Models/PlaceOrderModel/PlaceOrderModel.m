//
//  PlaceOrderModel.m
//  NEO
//
//  Created by Neo on 15/12/24.
//

#import "PlaceOrderModel.h"

@implementation PlaceOrderResponse

-(instancetype) initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self){
        _status = dictionary[@"status"];
        _message = dictionary[@"_message"];
        _userMsg = dictionary[@"user_msg"];
    }
    return self;
}
@end
