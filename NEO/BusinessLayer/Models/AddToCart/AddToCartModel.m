//
//  AddToCartModel.m
//  NEO
//
//  Created by Neo on 11/12/24.
//

#import "AddToCartModel.h"

@implementation AddToCartResponse

-(instancetype) initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self){
        _status = dictionary[@"status"];
        _data = dictionary[@"data"];
        _totalCart = dictionary[@"total_carts"];
        _message = dictionary[@"_message"];
        _userMsg = dictionary[@"user_msg"];
    }
    return self;
}
@end
